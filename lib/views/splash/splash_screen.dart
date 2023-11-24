import 'package:dog_app/core/constants/image/image_constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          ImageConstants.instance.splashIcon,
        ),
      ),
    );
  }
}
