import 'package:flutter/material.dart';
import 'package:wellness_app/constant.dart';
import '../models/exercise_model.dart';

class ExerciseDetailsPage extends StatefulWidget {
  final ExerciseModel exercise;

  const ExerciseDetailsPage({super.key, required this.exercise});

  @override
  State<ExerciseDetailsPage> createState() => _ExerciseDetailsPageState();
}

class _ExerciseDetailsPageState extends State<ExerciseDetailsPage> {
  String currentBadge = 'targetMuscles';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: const Color(0xffF4F6F5),
        body: Stack(
          children: [
            /// Scrollable Content
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                    onPressed: Navigator.of(context).pop,
                    icon: Icon(
                      Icons.chevron_left_rounded,
                      size: 34,
                      color: Colors.black54,
                    ),
                  ),
                  expandedHeight: 350,
                  pinned: true,
                  backgroundColor: Colors.grey.shade300,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        widget.exercise.image.isEmpty
                            ? Image.asset(
                                'aseets/icons/body_parts/cardiology.png',
                              )
                            : Image.network(
                                widget.exercise.image,
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: 80,
                                    width: 80,
                                    color: Colors.grey.shade200,
                                    child: Icon(Icons.image_not_supported),
                                  );
                                },
                              ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(.2),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// باقي المحتوى
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// اسم التمرين
                        Text(
                          widget.exercise.name.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 32),
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          currentBadge = 'targetMuscles';
                                        });
                                      },
                                      child: Container(
                                        // margin: EdgeInsets.all(0),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 32,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          color: currentBadge == 'targetMuscles'
                                              ? kSecondaryColor
                                              : Colors.grey.shade300,
                                        ),
                                        child: Text(
                                          'Target Muscles',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                currentBadge == 'targetMuscles'
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),

                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          currentBadge = 'eq';
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 32,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          color: currentBadge == 'eq'
                                              ? kSecondaryColor
                                              : Colors.grey.shade300,
                                        ),
                                        child: Text(
                                          'Equipments',
                                          style: TextStyle(
                                            color: currentBadge == 'eq'
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),

                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          currentBadge = 'secondaryMuscles';
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 32,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                          color:
                                              currentBadge == 'secondaryMuscles'
                                              ? kSecondaryColor
                                              : Colors.grey.shade300,
                                        ),
                                        child: Text(
                                          'Secondary Muscles',
                                          style: TextStyle(
                                            color:
                                                currentBadge ==
                                                    'secondaryMuscles'
                                                ? Colors.white
                                                : Colors.black,
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

                        SizedBox(height: 26),

                        currentBadge == 'targetMuscles'
                            ? Wrap(
                                spacing: 10,
                                runSpacing: 8,
                                children: [
                                  ...List.generate(
                                    widget.exercise.targetMuscles.length,
                                    (index) => badge(
                                      widget.exercise.targetMuscles[index],
                                      Colors.green,
                                    ),
                                  ),
                                ],
                              )
                            : currentBadge == 'eq'
                            ? Wrap(
                                spacing: 10,
                                runSpacing: 8,
                                children: [
                                  ...List.generate(
                                    widget.exercise.equipments.length,
                                    (index) => badge(
                                      widget.exercise.equipments[index],
                                      Colors.orange,
                                    ),
                                  ),
                                ],
                              )
                            : Wrap(
                                spacing: 10,
                                runSpacing: 8,
                                children: [
                                  ...List.generate(
                                    widget.exercise.secondaryMuscles.length,
                                    (index) => badge(
                                      widget.exercise.secondaryMuscles[index],
                                      Colors.purple,
                                    ),
                                  ),
                                ],
                              ),

                        const SizedBox(height: 42),

                        /// Instructions Title
                        const Text(
                          "Instructions",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),

                        /// Steps
                        ...List.generate(
                          widget.exercise.instructions.length,
                          (index) => stepCard(
                            index + 1,
                            widget.exercise.instructions[index],
                          ),
                        ),

                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // gradient
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 40,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.green.withOpacity(0.4), Colors.transparent],
                  ),
                ),
              ),
            ),

            /// زرار Start ثابت تحت
            Positioned(
              bottom: 15,
              left: 20,
              right: 20,
              child: SizedBox(
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: const Color(0xff2F8F6F),
                    backgroundColor: const Color.fromARGB(255, 43, 128, 46),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 8,
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Start Workout",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Badge Widget
  Widget badge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, color: color),
      ),
    );
  }

  /// Instruction Card
  Widget stepCard(int number, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 10),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.green,
            child: Text(
              number.toString(),
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text.replaceAll("Step:", "").substring(2),
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
