import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:netspotclone/app/utils/app_colors.dart';
import 'package:netspotclone/app/utils/app_constants.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.icon,
    required this.text,
    this.ontap,
    this.height,
    this.width,
  });
  final Widget? icon;
  final String text;
  final Callback? ontap;
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 100.w,
      height: height ?? 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primaryTextColor,
        borderRadius: AppConstants.buttonBorderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: AppConstants.buttonBorderRadius,
          onTap: ontap,
          child: SizedBox(
            height: height ?? 50,
            width: width ?? 100.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: icon,
                      )
                    : const SizedBox.shrink(),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
