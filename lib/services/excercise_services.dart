import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wellness_app/models/exercise_model.dart';

class ExcerciseServices {
  // final String baseUrl = 'https://exercisedb.dev/api/v1';
  final String baseUrl = 'https://oss.exercisedb.dev/api/v1';

  Future<List<String>> getBodyParts() async {
    final response = await http.get(Uri.parse('$baseUrl/bodyparts'));
    if (response.statusCode == 200) {
      final List<String> bodyParts = [];
      final data = jsonDecode(response.body);
      for (var part in data['data']) {
        bodyParts.add(part['name']);
      }
      return bodyParts;
    } else if (response.statusCode == 429) {
      return [];
    } else {
      throw Exception('Failed to load body parts');
    }
  }

  Future<List<String>> getEquipments() async {
    final response = await http.get(Uri.parse('$baseUrl/equipments'));
    if (response.statusCode == 200) {
      final List<String> equipments = [];
      final data = jsonDecode(response.body);
      for (var part in data['data']) {
        equipments.add(part['name']);
      }
      return equipments;
    } else if (response.statusCode == 429) {
      return [];
    } else {
      throw Exception('Failed to load body parts');
    }
  }

  Future<List<ExerciseModel>> getExcerciseByBodyPart(String bodyPart) async {
    final response = await http.get(
      Uri.parse('$baseUrl/exercises?bodyParts=$bodyPart'),
    );

    if (response.statusCode == 200) {
      final List<ExerciseModel> excercises = [];
      final data = jsonDecode(response.body);
      for (var part in data['data']) {
        excercises.add(ExerciseModel.fromJson(part));
      }
      return excercises;
    } else if (response.statusCode == 429) {
      return [];
    } else {
      throw Exception('Failed to load excercises');
    }
  }

  Future<List<ExerciseModel>> getExcerciseByEquipment(String equipment) async {
    final response = await http.get(
      Uri.parse('$baseUrl/exercises?equipments=$equipment'),
    );

    if (response.statusCode == 200) {
      final List<ExerciseModel> excercises = [];
      final data = jsonDecode(response.body);
      for (var part in data['data']) {
        excercises.add(ExerciseModel.fromJson(part));
      }
      return excercises;
    } else if (response.statusCode == 429) {
      return [];
    } else {
      throw Exception('Failed to load excercises');
    }
  }

  Future<ExerciseModel> getExcerciseById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/exercises/$id'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ExerciseModel.fromJson(data['data']);
    } else {
      throw Exception('Failed to load excercises');
    }
  }

  Future<List<ExerciseModel>> searchExcercises(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl/exercises?search=$query&offset=0&limit=10&&sortBy=name&sortOrder=asc'),
    );
    if (response.statusCode == 200) {
      final List<ExerciseModel> excercises = [];
      final data = jsonDecode(response.body);
      for (var part in data['data']) {
        excercises.add(ExerciseModel.fromJson(part));
      }
      return excercises;
    } else if (response.statusCode == 429) {
      return [];
    } else {
      throw Exception('Failed to load excercises');
    }
  }

  Future<List<String>> getAllMuscles() async {
    final response = await http.get(Uri.parse('$baseUrl/muscles'));
    if (response.statusCode == 200) {
      final List<String> muscles = [];
      final data = jsonDecode(response.body);
      for (var part in data['data']) {
        muscles.add(part['name']);
      }
      return muscles;
    } else if (response.statusCode == 429) {
      return [];
    } else {
      throw Exception('Failed to load body parts');
    }
  }

  Future<List<ExerciseModel>> getExcercisesByMuscle(String muscle) async {
    final response = await http.get(
      Uri.parse('$baseUrl/exercises?targetMuscles=$muscle'),
    );
    if (response.statusCode == 200) {
      final List<ExerciseModel> excercises = [];
      final data = jsonDecode(response.body);
      for (var part in data['data']) {
        excercises.add(ExerciseModel.fromJson(part));
      }
      return excercises;
    }
    if (response.statusCode == 429) {
      return [];
    } else {
      throw Exception('Failed to load excercises');
    }
  }


  Future<List<ExerciseModel>> getExcercises() async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/exercises?offset=0&limit=10&&sortBy=name&sortOrder=asc',
      ),
    );
    if (response.statusCode == 200) {
      final List<ExerciseModel> excercises = [];
      final data = jsonDecode(response.body);
      for (var part in data['data']) {
        excercises.add(ExerciseModel.fromJson(part));
      }
      excercises;
      return excercises;
    } else if (response.statusCode == 429) {
      return [];
    } else {
      throw Exception('Failed to load excercises');
    }
  }
}
