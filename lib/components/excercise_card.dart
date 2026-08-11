import 'package:flutter/material.dart';
import 'package:wellness_app/models/exercise_model.dart';

class ExerciseCard extends StatelessWidget {
  final ExerciseModel exercise;

  const ExerciseCard({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      // padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey.shade300.withAlpha(200),
          width: 0.6
        )
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(.05),
        //     blurRadius: 15,
        //     offset: const Offset(0, 8),
        //   ),
        // ],
      ),
      child: Row(
        children: [
          /// image
          exercise.image.isEmpty
              ? Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 80,
                  width: 80,

                  child: Icon(Icons.image_not_supported),
                )
              : GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => imageDialog(image: exercise.image),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      bottomLeft: Radius.circular(14),
                      ),
                    child: Image.network(
                      exercise.image,
                    
                      height: 125,
                      width: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 125,
                          width: 120,
                          color: Colors.white,
                          child: Icon(Icons.image_not_supported),
                        );
                      },
                    ),
                  ),
                ),

          const SizedBox(width: 15),

          /// info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                ),

                const SizedBox(height: 10),

                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    badgeWidget(
                      exercise.targetMuscles.isNotEmpty
                          ? exercise.targetMuscles.first
                          : "",
                      Colors.green,
                    ),

                    badgeWidget(
                      exercise.equipments.isNotEmpty
                          ? exercise.equipments.first
                          : "",
                      Colors.orange,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Icon(Icons.chevron_right_rounded, size: 22 , color: Colors.black54,),
          SizedBox(width: 8,)
        ],
      ),
    );
  }

  Widget badgeWidget(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  Widget imageDialog({required String image}) {
    return AlertDialog(
      backgroundColor: Colors.white,
      // contentPadding: EdgeInsets.all(16),
      content: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          image,
          height: 250,
          width: 250,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 250,
              width: 250,
              color: Colors.grey.shade200,
              child: Icon(Icons.image_not_supported),
            );
          },
        ),
      ),
    );
  }
}
