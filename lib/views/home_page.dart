import 'dart:ui';

import 'package:dog_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map> myDogs = List.generate(
      100,
      (index) => {
            "id": index,
            "name": "Dog $index",
            "imageUrl":
                "https://thumbs.dreamstime.com/b/golden-retriever-dog-21668976.jpg",
            "breed": "Breed $index"
          }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dog App"),
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
          childAspectRatio: 1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: myDogs.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return _showBottomSheet(context, index);
                  });
            },
            child: _buildDogImage(index, context),
          );
        },
      );
  }

  Dialog _showBottomSheet(BuildContext context, int index) {
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
            _buildSheetImage(index, context),
            SizedBox(height: context.screenHeight * 0.01),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    "Breed",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 0.3),
                  SizedBox(height: context.screenHeight * 0.005),
                  const Text("Breed"),
                  SizedBox(height: context.screenHeight * 0.02),
                  const Text(
                    "Sub Breed",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: context.screenHeight * 0.005),
                  const Divider(thickness: 0.3),
                  SizedBox(height: context.screenHeight * 0.005),
                  const Text("Sub Breed 1"),
                  SizedBox(height: context.screenHeight * 0.005),
                  const Text("Sub Breed 2"),
                ],
              ),
            ),
            _buildGenerateButton(context),
          ],
        ),
      ),
    );
  }

  Stack _buildSheetImage(int index, BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
          child: Image.network(
            myDogs[index]["imageUrl"],
            width: context.screenWidth,
            height: 300,
            fit: BoxFit.cover,
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
    );
  }

  Padding _buildGenerateButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: context.screenWidth * 0.7,
        height: context.screenHeight * 0.07,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text(
            "Generate",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Stack _buildDogImage(int index, BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(myDogs[index]["imageUrl"]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        _buildBreedText(context, index)
      ],
    );
  }

  Positioned _buildBreedText(BuildContext context, int index) {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      child: Container(
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
                myDogs[index]["breed"],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
