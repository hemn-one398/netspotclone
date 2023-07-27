import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netspotclone/app/utils/app_colors.dart';
import 'package:sizer/sizer.dart';

class SolutionCard extends StatelessWidget {
  const SolutionCard({
    super.key,
    required this.title,
    required this.detail,
    required this.svgPath,
  });
  final String title;
  final String detail;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 100.w,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryTextColor, width: 0.2),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: AppColors.primaryTextColor, fontSize: 40),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(detail,
                style: const TextStyle(
                  color: AppColors.secondaryTextColor,
                  fontSize: 20,
                )),
            Expanded(child: SvgPicture.asset(svgPath)),
          ]),
    );
  }
}
