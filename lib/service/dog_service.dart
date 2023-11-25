import 'dart:convert';

import 'package:dog_app/models/dog.dart';
import 'package:http/http.dart' as http;

class DogApiService {
  final String baseUrl = "https://dog.ceo/api";

  Future<List<Dog>> getDogList() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/breeds/list/all'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        List<Dog> dogsList =
            (data['message'] as Map<String, dynamic>).entries.map((entry) {
          return Dog(
            breed: entry.key,
            subBreed: (entry.value as List<dynamic>).cast<String>(),
          );
        }).toList();
        // print(dogsList);
        return dogsList;
      } else {
        throw Exception('Failed to load dog list');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<String> getRandomBreedImage(String breed) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/breed/$breed/images/random'));

      Map<String, dynamic> data = json.decode(response.body);
      String imageUrl = data['message'];
      return imageUrl;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<String> getRandomSubBreedImage(String breed, String subBreed) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/breed/$breed/$subBreed/images/random'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        String imageUrl = data['message'];
        return imageUrl;
      } else {
        throw Exception('Failed to load random dog image');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
