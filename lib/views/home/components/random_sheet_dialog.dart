import 'package:dog_app/core/constants/image/image_constants.dart';
import 'package:dog_app/core/extensions/context_extension.dart';
import 'package:dog_app/models/dog.dart';
import 'package:dog_app/service/dog_service.dart';
import 'package:flutter/material.dart';

class RandomSheetDialog extends StatelessWidget {
  const RandomSheetDialog({super.key, required this.dog});
  final Dog dog;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      content: Builder(builder: (context) {
        return SizedBox(
          width: context.screenWidth * 0.3,
          height: context.screenHeight * 0.3,
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<String>(
                    future: DogApiService().getRandomBreedImage(dog.breed),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text("Error Here");
                      }
                      if (snapshot.data == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        child: Image.network(
                          snapshot.data!,
                          errorBuilder: (context, err, _) {
                            return Image.asset(
                              ImageConstants.instance.imageNotFound,);
                          },
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
              ),
              SizedBox(height: context.screenHeight * 0.01),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white),
                  child: const Icon(Icons.close),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
