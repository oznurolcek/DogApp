import 'package:dog_app/models/random_image.dart';

class Dog {
  final int id;
  final String name;
  final BreedImage imageUrl;
  final String breed;

  Dog({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.breed,
  });

  factory Dog.fromMap(Map<String, dynamic> map) {
    return Dog(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
      breed: map['breed'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'breed': breed,
    };
  }
}
