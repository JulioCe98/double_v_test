import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class AuthBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.shader = ui.Gradient.linear(const Offset(0, 0), Offset(size.width, 0), [Colors.blue.shade600, Colors.blue.shade800]);
    paint.style = PaintingStyle.fill;

    Path path = Path();
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.4, size.height * 0.4, size.width * 0.7, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.13, size.width * 0.93, size.height * 0.12);
    path.arcToPoint(Offset(size.width * 0.88, size.height * 0.05), radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.7, size.height * 0.08, size.width * 0.6, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
