import 'package:flutter/material.dart';

///  Created by harbey on 8/15/2023.

class DashedLineVertical extends StatelessWidget {
  const DashedLineVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        size: Size(1.2, double.infinity), painter: DashedLineVerticalPainter());
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 5, startY = 0;
    final paint = Paint()
      ..color = Color(0xFFCECECE)
      ..strokeWidth = size.width;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
