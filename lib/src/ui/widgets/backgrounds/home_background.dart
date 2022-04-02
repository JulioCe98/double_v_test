import 'package:flutter/material.dart';

class HomeBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.blue.shade800;
    paint.style = PaintingStyle.fill;

    Path path = Path();

    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width / 2, size.height * 0.4, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
