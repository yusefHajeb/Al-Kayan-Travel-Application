import 'dart:ui';

import 'package:flutter/material.dart';

class TravelClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // يبدأ من النقطة السفلية اليسرى
    path.lineTo(0, size.height - 60);

    // منحنيات سلسة تتجه إلى الأعلى
    path.quadraticBezierTo(
        size.width / 4, size.height + 20, size.width / 2, size.height - 40);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height - 80, size.width, size.height - 30);

    // الخط العلوي
    path.lineTo(size.width, 0);
    path.close(); // إغلاق الشكل

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
