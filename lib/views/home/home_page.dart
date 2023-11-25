import 'dart:ui';

import 'package:dog_app/core/constants/image/image_constants.dart';
import 'package:dog_app/core/extensions/context_extension.dart';
import 'package:dog_app/models/dog.dart';
import 'package:dog_app/service/dog_service.dart';
import 'package:dog_app/views/home/components/random_sheet_dialog.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DogApiService _dogApiService = DogApiService();
  List<Dog> dogList = [];

  @override
  void initState() {
    _loadDogs();
    super.initState();
  }

  Future<void> _loadDogs() async {
    try {
      final dogsData = await _dogApiService.getDogList();
      setState(() {
        dogList = dogsData;
      });
    } catch (e) {
      // ignore: avoid_print
      print('Error loading dogs: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "breeDogs",
          style: TextStyle(fontFamily: 'GalanoGrotesque'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _buildGridView(context),
      ),
    );
  }

  GridView _buildGridView(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: context.screenWidth * 0.5,
        childAspectRatio: 1.1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: dogList.length,
      itemBuilder: (_, index) {
        //TODO: card
        return FutureBuilder<String>(
            future: _dogApiService.getRandomBreedImage(dogList[index].breed),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Error Here");
              }
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return _showBottomSheet(
                            context, dogList[index], snapshot.data!);
                      });
                },
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        snapshot.data!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, err, _) {
                          return Image.asset(
                              ImageConstants.instance.imageNotFound,
                              fit: BoxFit.cover);
                        },
                      ),
                    ),
                    //buildBreedText
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      child: Container(
                        width: context.screenWidth * 0.2,
                        height: context.screenHeight * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0)),
                          color: Colors.black.withOpacity(0.3),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0)),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                            child: Center(
                              child: Text(
                                "${dogList[index].breed[0].toUpperCase()}${dogList[index].breed.substring(1)}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'GalanoGrotesque'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
      },
    );
  }

  Dialog _showBottomSheet(BuildContext context, Dog dog, String imageUrl) {
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
            //buildSheetImage
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
                              ImageConstants.instance.imageNotFound,);
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
            Column(
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
            ),
            const Spacer(),
            //buildGenerateButton
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: context.screenWidth * 0.7,
                height: context.screenHeight * 0.07,
                child: ElevatedButton(
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
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'GalanoGrotesque'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
