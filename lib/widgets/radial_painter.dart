import 'dart:math';

import 'package:flutter/material.dart';

class RadialPainter extends CustomPainter {
  final Color bgColor;
  final Color lineColor;
  final double percent;
  final double width;

  RadialPainter({
    this.bgColor,
    this.lineColor,
    this.percent,
    this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // (Paint bgLine = Paint();
    // bgLine.color = bgColor;
    // bgLine.strokeCap = StrokeCap.round;)
    // this is equal to:
    Paint bgLine = Paint()
      ..color = bgColor
      //make the beginning and ending of the line as circle.
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint completeLine = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    //draw the grey line
    canvas.drawCircle(center, radius, bgLine);

    double sweepAngle = 2 * pi * percent;
    // draw the amount spent line
    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      //(startAngle)start the circle from the top
      -pi / 2,
      //(sweepAngle) the value in radiant of how far we going to draw the curve
      sweepAngle,
      //(useCenter)if true,the ends of the bar will be connected to the center
      false,
      //paint
      completeLine,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
