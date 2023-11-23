import 'dart:convert';

import 'package:dog_app/models/random_image.dart';
import 'package:http/http.dart' as http;

class DogApiService {
  final String baseUrl = "https://dog.ceo/api";

  Future<List<Map<String, dynamic>>> getDogList() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/breeds/list/all'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> dogsList = [];

        data['message'].forEach((key, value) {
          if (value is List) {
            value.forEach((breed) {
              dogsList.add({
                "id": dogsList.length + 1,
                "name": "Dog ${dogsList.length + 1}",
                "imageUrl": BreedImage(message: "message", status: ""),
                "breed": breed,
              });
            });
          }
        });

        return dogsList;
      } else {
        throw Exception('Failed to load dog list');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<String> getRandomDogImage() async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/breeds/image/random'));

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

  Future<List<String>> getBreedImages(String breed) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/breed/$breed/images'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        List<String> breedImages = List<String>.from(data['message']);
        return breedImages;
      } else {
        throw Exception('Failed to load breed images');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<String>> getBreedList(String breed) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/breed/$breed/list'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        List<String> breedList = List<String>.from(data['message']);
        return breedList;
      } else {
        throw Exception('Failed to load breed list');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
