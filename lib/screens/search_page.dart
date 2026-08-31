import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wellness_app/components/excercise_card.dart';
import 'package:wellness_app/components/too_many_requests_page.dart';
import 'package:wellness_app/models/exercise_model.dart';
// import 'package:wellness_app/screens/excercises_page.dart';
import 'package:wellness_app/screens/exercise_details_page.dart';
import 'package:wellness_app/services/excercise_services.dart';
import 'package:wellness_app/shimmers/shimmer_list.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: AppBar(
              automaticallyImplyLeading: false,
              surfaceTintColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              // scrolledUnderElevation: 0,
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, 1.2),
                child: Container(
                  height: 1.2,
                  color: Colors.grey.shade300.withAlpha(200),
                ),
              ),
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.chevron_left_rounded,
                      size: 32,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 12),

                  Expanded(
                    child: TextField(
                      onChanged: (value) => setState(() => searchQuery = value),
                      autofocus: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Exercises",
                        hintStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: searchQuery.isEmpty
          ? const Center(
              child: Text(
                'Search for an excercise',
                style: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            )
          : FutureBuilder(
              future: ExcerciseServices().searchExcercises(searchQuery),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ShimmerList();
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (snapshot.hasData) {
                  List<ExerciseModel> exercises = snapshot.data!;

                  return exercises.isEmpty
                      ? snapshot.error.hashCode == 429
                            ? TooManyRequestsPage()
                            : TooManyRequestsPage(
                                title: 'Too Many Requests , Try Later',
                              )
                      : SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              SizedBox(height: 85),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(16),
                                itemCount: exercises.length,
                                itemBuilder: (context, index) {
                                  final exercise = exercises[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ExerciseDetailsPage(
                                                exercise: exercise,
                                              ),
                                        ),
                                      );
                                    },
                                    child: ExerciseCard(exercise: exercise),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                } else {
                  return ShimmerList();
                }
              },
            ),
    );
  }
}
