import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/resources/colors.dart';

///  Created by harbey on 8/23/2023.

class DashedLineHorizontal extends StatelessWidget {
  const DashedLineHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomPaint(
        size: Size(double.infinity, 1.5),
        painter: DashedLineHorizontalPainter(),
      ),
    );
  }
}

class DashedLineHorizontalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5, dashSpace = 3, startX = 0;
    final paint = Paint()
      ..color = kGray_CE
      ..strokeWidth = size.height; // Adjust the stroke width for horizontal line

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0), // Start point
        Offset(startX + dashWidth, 0), // End point
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}