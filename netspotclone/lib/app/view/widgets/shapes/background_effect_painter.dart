import 'package:flutter/material.dart';
import 'package:netspotclone/app/utils/app_colors.dart';
import 'dart:math' as math;

class BackgroundEffectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const rayCount = 3;
    final raySpacing = size.width / (rayCount + 1);
    final rayWidth = raySpacing / 2;
    final rayHeight = size.height;

    final rayPaint = Paint()
      ..color = AppColors.blueColor
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10.0);

    const rotationAngle = -45;

    for (var i = 1; i <= rayCount; i++) {
      final rayLeft = raySpacing * i - (rayWidth / 2);

      canvas.save();
      canvas.translate(rayLeft, rayHeight);
      canvas.rotate(-rotationAngle * (math.pi / 180.0));

      final path = Path();
      path.moveTo(0, -rayHeight);
      path.lineTo(rayWidth, -rayHeight);
      path.lineTo(rayWidth / 2, 0);
      path.close();

      canvas.drawPath(path, rayPaint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
