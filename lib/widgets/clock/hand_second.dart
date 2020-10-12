import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_clock_app/config/palette.dart';

class SecondHandPainter extends CustomPainter {
  final Paint secondHandPaint;

  int seconds;

  SecondHandPainter({this.seconds}) : secondHandPaint = Paint() {
    secondHandPaint.color = Palette.primaryRed;
    secondHandPaint.style = PaintingStyle.stroke;
    secondHandPaint.strokeWidth = 4.0;
    secondHandPaint.strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();

    canvas.translate(radius, radius);

    canvas.rotate(2 * pi * this.seconds / 60);

    Path path1 = Path();
    path1.moveTo(0.0, -radius * 0.93);
    path1.lineTo(0.0, radius * 0.1);

    canvas.drawPath(path1, secondHandPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(SecondHandPainter oldDelegate) {
    return this.seconds != oldDelegate.seconds;
  }
}
