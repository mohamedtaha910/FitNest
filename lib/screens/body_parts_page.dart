import 'package:flutter/material.dart';
import 'package:wellness_app/components/custom_row.dart';
import 'package:wellness_app/components/too_many_requests_page.dart';
import 'package:wellness_app/screens/excercises_page.dart';
import 'package:wellness_app/services/excercise_services.dart';
import 'package:wellness_app/shimmers/shimmer_list.dart';

class BodyPartsPage extends StatefulWidget {
  const BodyPartsPage({super.key});

  @override
  State<BodyPartsPage> createState() => _BodyPartsPageState();
}

class _BodyPartsPageState extends State<BodyPartsPage> {
  final List<String> bodyIcons = [
    //neck
    'aseets/icons/body_parts/neck_final.png',
    //lower arms
    'aseets/icons/body_parts/lower_arms.png',
    //shoulders
    'aseets/icons/body_parts/shoulder_2.png',
    //cardio
    'aseets/icons/body_parts/cardiology.png',
    //upper arms
    'aseets/icons/body_parts/arms.png',
    // chest
    'aseets/icons/body_parts/chest4.png',
    // lower legs
    'aseets/icons/body_parts/lower_leg2.png',
    // back
    'aseets/icons/body_parts/back5.png',
    // upper legs
    'aseets/icons/body_parts/leg.png',
    // waist
    'aseets/icons/body_parts/abs.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: ExcerciseServices().getBodyParts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            List<String> bodyParts = snapshot.data!;

            return bodyParts.isEmpty
                ? TooManyRequestsPage()
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: bodyParts.length,
                    itemBuilder: (context, index) {
                      final String bodyPart = bodyParts[index];

                      final String icon = bodyIcons[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ExercisesPage(
                                future: ExcerciseServices()
                                    .getExcerciseByBodyPart(bodyPart),
                                query: bodyPart,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: index == bodyParts.length - 1 ? 100 : 0,
                            top: index == 0 ? 20 : 0,
                          ),
                          child: CustomRow(bodyPart: bodyPart, icon: icon),
                        ),
                      );
                    },
                  );
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ShimmerList(),
            );
          }
        },
      ),
    );
  }
}
