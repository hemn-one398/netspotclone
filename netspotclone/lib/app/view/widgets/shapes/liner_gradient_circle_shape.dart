import 'package:flutter/material.dart';
import 'package:netspotclone/app/utils/app_colors.dart';

class LinerGradientCircleShape extends StatelessWidget {
  const LinerGradientCircleShape(
      {super.key, required this.size, required this.opacity});
  final double size, opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, -30),
              blurRadius: 30,
              spreadRadius: 20,
            )
          ],
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.lightBlueColor,
          ),
          gradient: LinearGradient(
              colors: [
                AppColors.lightBlueColor.withOpacity(opacity),
                const Color(0XFF05121C),
              ],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
              stops: const [
                0.03,
                0.3,
              ]),
        ),
      ),
    );
  }
}
