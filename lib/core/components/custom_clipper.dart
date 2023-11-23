import 'package:flutter/material.dart';

class CustomTrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.01, 0, size.width * 0.1, 0);
    path.lineTo(size.width * 0.1, 0);
    path.lineTo(size.width * 0.9, 0);
    path.quadraticBezierTo(size.width * 0.99, 0, size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}