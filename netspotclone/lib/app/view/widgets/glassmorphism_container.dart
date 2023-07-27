import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer(
      {super.key,
      this.width,
      this.height,
      required this.child,
      this.decoreation});
  final double? width, height;
  final Widget child;
  final BoxDecoration? decoreation;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 28, sigmaY: 24),
        child: Container(
          decoration: decoreation,
          height: height ?? 100,
          width: width ?? 100.w,
          child: child,
        ),
      ),
    );
  }
}
