import 'package:dog_app/core/extensions/context_extension.dart';
import 'package:dog_app/models/dog.dart';
import 'package:dog_app/views/home/components/detail_bottom_sheet.dart';
import 'package:dog_app/views/home/components/dog_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List<Dog> dogList;
  final Map<String, String> dogsImageUrls;

  const HomePage(
      {super.key, required this.dogList, required this.dogsImageUrls});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "breeDogs",
            style: TextStyle(fontFamily: 'GalanoGrotesque'),
          ),
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
      itemCount: widget.dogList.length,
      itemBuilder: (_, index) {
        final dog = widget.dogList[index];
        final dogImage = widget.dogsImageUrls[dog.breed]!;
        return GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return DetailBottomSheet(dog: dog, imageUrl: dogImage);
                });
          },
          child: DogCard(dog: dog, dogImage: dogImage),
        );
      },
    );
  }
}