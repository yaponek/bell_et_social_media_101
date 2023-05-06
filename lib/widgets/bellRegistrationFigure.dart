/*
 * © 2023 Yared Kassa - LDS. All rights reserved.
 * This code is protected by copyright law and may not be reproduced or distributed without permission.
 */

import 'package:flutter/material.dart';
import '../constants/coors.dart';

class bellRegistrationFigure extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintGreen = Paint()..color = bellBlue;

    final pathGreen = Path();
    pathGreen.moveTo(size.width, size.height);
    pathGreen.lineTo((size.width / 1.5), size.height);
    pathGreen.lineTo(size.width, size.height / 1.5);
    pathGreen.close();

    // canvas.drawPath(pathOrange, paintOrange);
    canvas.drawPath(pathGreen, paintGreen);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
