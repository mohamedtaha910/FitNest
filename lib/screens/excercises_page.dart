import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wellness_app/components/excercise_card.dart';
import 'package:wellness_app/components/too_many_requests_page.dart';
import 'package:wellness_app/screens/exercise_details_page.dart';
// import 'package:wellness_app/services/excercise_services.dart';
import 'package:wellness_app/shimmers/shimmer_list.dart';
import '../models/exercise_model.dart';

class ExercisesPage extends StatelessWidget {
  final Future future;
  final String query;

  const ExercisesPage({super.key, required this.query, required this.future});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      // backgroundColor: const Color(0xffF4F6F5),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              forceMaterialTransparency: true,
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, 1.2),
                child: Container(height: 1.2, color: Colors.grey.shade200),
              ),
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.chevron_left_rounded,
                      color: Colors.black,
                      size: 32,
                    ),
                  ),
                  SizedBox(width: 12),

                  Flexible(
                    child: Text(
                      "$query's Workout",

                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return ShimmerList();
          } else if (snapshot.hasData) {
            List<ExerciseModel> exercises = snapshot.data!;

            return exercises.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'No Excercise Found.',
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                      ),
                    ],
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
                                        ExerciseDetailsPage(exercise: exercise),
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
