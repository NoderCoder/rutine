import 'package:flutter/material.dart';

/// class DraStraightline extends CustomPaint
class DrawHorizontallStraightLine extends CustomPainter {
  late Paint _paint;
  DrawHorizontallStraightLine() {
    _paint = Paint();
    _paint.color = Colors.black; //dots color
    _paint.strokeWidth = 3; //dots thickness
    _paint.strokeCap = StrokeCap.square; //dots corner edges
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -300; i < 300; i = i + 1) {
      // 15 is space between dots
      if (i % 3 == 0) {
        canvas.drawLine(Offset(i, 0.0), Offset(i + 1, 0.0), _paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

/// class DrawDottedhorizontalline extends CustomPaint
class DrawDottedhorizontalline extends CustomPainter {
  late Paint _paint;
  DrawDottedhorizontalline() {
    _paint = Paint();
    _paint.color = Colors.black; //dots color
    _paint.strokeWidth = 1; //dots thickness
    _paint.strokeCap = StrokeCap.square; //dots corner edges
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -300; i < 300; i = i + 15) {
      // 15 is space between dots
      if (i % 3 == 0) {
        canvas.drawLine(Offset(i, 0.0), Offset(i + 1, 0.0), _paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

//Horizonatla line painter fir the decoration
class DrawVerticalStraightLine extends CustomPainter {
  late Paint _paint;
  DrawVerticalStraightLine() {
    _paint = Paint();
    _paint.color = Colors.black; //dots color
    _paint.strokeWidth = 2; //dots thickness
    _paint.strokeCap = StrokeCap.square; //dots corner edges
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -26; i < 26; i = i + 1) {
      // 15 is space between dots
      if (i % 3 == 0) canvas.drawLine(Offset(0, i), Offset(0.0, i + 1), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
