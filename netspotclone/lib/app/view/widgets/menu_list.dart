import 'package:flutter/material.dart';
import 'package:netspotclone/app/utils/app_colors.dart';
import 'package:netspotclone/app/utils/enums.dart';
import 'package:netspotclone/app/view/widgets/disappear_animation.dart';
import 'package:netspotclone/app/view/widgets/showup_animation.dart';

import 'package:sizer/sizer.dart';

class MenuList extends StatelessWidget {
  const MenuList({
    super.key,
    required this.showUp,
  });
  final bool showUp;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8500,
      width: 100.w,
      padding: const EdgeInsets.only(top: 150),
      color: const Color.fromARGB(255, 3, 10, 15).withOpacity(0.99),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MenuItem(
            text: "Home",
            delay: 0,
            startIn: showUp,
          ),
          MenuItem(
            text: "Solutions",
            delay: 100,
            startIn: showUp,
          ),
          MenuItem(
            text: "Partners",
            delay: 200,
            startIn: showUp,
          ),
          MenuItem(
            text: "About Us",
            delay: 300,
            startIn: showUp,
          ),
          MenuItem(
            text: "Careers",
            delay: 400,
            startIn: showUp,
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.text,
    required this.delay,
    this.startIn = true,
  });
  final String text;
  final int delay;
  final bool startIn;
  @override
  Widget build(BuildContext context) {
    return startIn
        ? ShowUpAnimation(
            delayStart: const Duration(milliseconds: 0),
            animationDuration: Duration(milliseconds: 300 + delay),
            curve: Curves.bounceIn,
            direction: Direction.horizontal,
            offset: 0.1,
            child: _itemContainer(),
          )
        : DisapperAnimation(
            delayStart: Duration(milliseconds: 100 + delay),
            animationDuration: const Duration(milliseconds: 1000),
            curve: Curves.easeOut,
            direction: Direction.vertical,
            offset: 0,
            child: _itemContainer(),
          );
  }

  Container _itemContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: 100.w,
      decoration: const BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: AppColors.secondaryTextColor, width: 0.2))),
      child: Text(text,
          style: const TextStyle(
            fontSize: 20,
            color: AppColors.primaryTextColor,
          )),
    );
  }
}
