import 'package:dog_app/core/constants/image/image_constants.dart';
import 'package:dog_app/models/dog.dart';
import 'package:dog_app/service/dog_service.dart';
import 'package:dog_app/views/tabbar/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final DogApiService _dogApiService = DogApiService();
  List<Dog> dogList = [];
  bool isLoaded = false;
  Map<String, String> dogsImageUrls = {};

  Future<void> fetchData() async {
    await _loadDogs();
    await _preloadImages();
    setState(() {
      isLoaded = true;
    });
  }

  Future<void> _preloadImages() async {
    final cache = DefaultCacheManager();
    for (final dog in dogList) {
      String url = await _dogApiService.getRandomBreedImage(dog.breed);
      // ignore: avoid_print
      print(url);
      dogsImageUrls[dog.breed] = url;
      try {
        await cache.downloadFile(url);
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    }
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
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      return Scaffold(
        body: Center(
          child: Image.asset(
            ImageConstants.instance.splashIcon,
          ),
        ),
      );
    }
    return CustomTabBar(dogList: dogList, dogsImageUrls: dogsImageUrls,);
  }
}
