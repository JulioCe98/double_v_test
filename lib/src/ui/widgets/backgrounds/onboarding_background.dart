import 'package:flutter/material.dart';

class OnboardingBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.blue.shade900;
    paint.style = PaintingStyle.fill;

    Path path = Path();
    path.quadraticBezierTo(size.width * 0.15, size.height * 0.2, size.width / 2, size.height * 0.22);
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.25, size.width, size.height * 0.4);
    path.lineTo(size.width, 0.0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
