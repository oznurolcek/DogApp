import 'package:dog_app/core/constants/image/image_constants.dart';
import 'package:dog_app/core/extensions/context_extension.dart';
import 'package:dog_app/models/dog.dart';
import 'package:dog_app/views/home/components/random_sheet_dialog.dart';
import 'package:flutter/material.dart';

class DetailBottomSheet extends StatelessWidget {
  final Dog dog;
  final String imageUrl;
  const DetailBottomSheet({
    super.key,
    required this.dog,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: SizedBox(
        height: context.screenHeight * 0.75,
        width: context.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                  child: Image.network(
                    imageUrl,
                    width: context.screenWidth,
                    height: 300,
                    fit: BoxFit.cover,
                    errorBuilder: (context, err, _) {
                      return Image.asset(
                        ImageConstants.instance.imageNotFound,
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 14,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.screenHeight * 0.01),
            _buildDetailSheetInfos(context),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: context.screenWidth * 0.7,
                height: context.screenHeight * 0.07,
                child: _buildGenerateButton(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildDetailSheetInfos(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Breed",
          style: TextStyle(
              color: Color(0xFF0054d3),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'GalanoGrotesque'),
        ),
        const Divider(thickness: 0.3),
        SizedBox(height: context.screenHeight * 0.005),
        Text("${dog.breed[0].toUpperCase()}${dog.breed.substring(1)}"),
        SizedBox(height: context.screenHeight * 0.02),
        const Text(
          "Sub Breed",
          style: TextStyle(
              color: Color(0xFF0054d3),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'GalanoGrotesque'),
        ),
        SizedBox(height: context.screenHeight * 0.005),
        const Divider(thickness: 0.3),
        SizedBox(height: context.screenHeight * 0.005),
        if (dog.subBreed.isNotEmpty)
          for (var subBreed in dog.subBreed)
            Text(
              "${subBreed[0].toUpperCase()}${subBreed.substring(1)}",
              style: const TextStyle(fontFamily: 'GalanoGrotesque'),
            )
        else
          const Text(
            "No Sub Breed",
            style: TextStyle(fontFamily: 'GalanoGrotesque'),
          ),
        SizedBox(height: context.screenHeight * 0.005),
      ],
    );
  }

  ElevatedButton _buildGenerateButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return RandomSheetDialog(dog: dog);
            });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0054d3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text(
        "Generate",
        style: TextStyle(color: Colors.white, fontFamily: 'GalanoGrotesque'),
      ),
    );
  }
}
