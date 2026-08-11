class ExerciseModel {
  final String id;
  final String name;
  final String image;
  final List<String> targetMuscles;
  final List<String> bodyParts;
  final List<String> equipments;
  final List<String> secondaryMuscles;
  final List<String> instructions;

  ExerciseModel({
    required this.id,
    required this.name,
    required this.image,
    required this.targetMuscles,
    required this.bodyParts,
    required this.equipments,
    required this.secondaryMuscles,
    required this.instructions,
  });
  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['exerciseId'] ?? '',
      name: json['name'] ?? '',
      image: json['gifUrl'] ?? '',
      targetMuscles: List<String>.from(json['targetMuscles']),
      bodyParts: List<String>.from(json['bodyParts']),
      equipments: List<String>.from(json['equipments']),
      secondaryMuscles: List<String>.from(json['secondaryMuscles']),
      instructions: List<String>.from(json['instructions']),
    );
  }

}