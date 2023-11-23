import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          height: 50,
          width: 50,
          "assets/image/ic_splash.png",
        ),
      ),
    );
  }
}
