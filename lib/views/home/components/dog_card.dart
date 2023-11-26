import 'dart:ui';

import 'package:dog_app/core/constants/image/image_constants.dart';
import 'package:dog_app/core/extensions/context_extension.dart';
import 'package:dog_app/models/dog.dart';
import 'package:flutter/material.dart';

class DogCard extends StatelessWidget {
  final Dog dog;
  final String dogImage;
  const DogCard({
    super.key,
    required this.dogImage,
    required this.dog,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _buildCardImage(),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          child: _buildCardText(context),
        ),
      ],
    );
  }

  ClipRRect _buildCardImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        dogImage,
        fit: BoxFit.cover,
        errorBuilder: (context, err, _) {
          return Image.asset(ImageConstants.instance.imageNotFound,
              fit: BoxFit.cover);
        },
      ),
    );
  }

  Container _buildCardText(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.2,
      height: context.screenHeight * 0.05,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8.0), bottomLeft: Radius.circular(8.0)),
        color: Colors.black.withOpacity(0.3),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8.0), bottomLeft: Radius.circular(8.0)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Center(
            child: Text(
              "${dog.breed[0].toUpperCase()}${dog.breed.substring(1)}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'GalanoGrotesque'),
            ),
          ),
        ),
      ),
    );
  }
}
