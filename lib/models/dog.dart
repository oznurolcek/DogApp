import 'dart:convert';

import 'package:flutter/foundation.dart';

class Dog {
  final String breed;
  final List<String> subBreed;
  Dog({
    required this.breed,
    required this.subBreed,
  });

  Dog copyWith({
    String? breed,
    List<String>? subBreed,
  }) {
    return Dog(
      breed: breed ?? this.breed,
      subBreed: subBreed ?? this.subBreed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'breed': breed,
      'subBreed': subBreed,
    };
  }

  factory Dog.fromMap(Map<String, dynamic> map) {
    return Dog(
      breed: map['breed'] as String,
      subBreed: List<String>.from(
        (map['subBreed'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Dog.fromJson(String source) =>
      Dog.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Dog(breed: $breed, subBreed: $subBreed)';

  @override
  bool operator ==(covariant Dog other) {
    if (identical(this, other)) return true;

    return other.breed == breed && listEquals(other.subBreed, subBreed);
  }

  @override
  int get hashCode => breed.hashCode ^ subBreed.hashCode;
}