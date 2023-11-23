import 'package:dog_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          height: context.screenHeight * 0.12,
          width: context.screenWidth * 0.12,
          "assets/image/ic_splash.png",
        ),
      ),
    );
  }
}
