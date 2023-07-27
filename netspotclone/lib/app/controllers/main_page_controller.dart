import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MainPageController extends GetxController {
  bool showBottomBorder = false;
  ScrollController scrollController = ScrollController();
  bool showMenu = false;
  bool isMenuClosing = false;

  bool showBackgroundEffects = false;

  GlobalKey circleShapeKey = GlobalKey();
  double currCircleYposition = 0.0;

  bool showFirstCircle = false;
  @override
  void onReady() {
    _showUpStartBackgroundAnimation();
    geCirclePosition();
    super.onReady();
  }

  @override
  void onInit() {
    scrollController.addListener(_scrollingListner);

    super.onInit();
  }

  _showUpStartBackgroundAnimation() async {
    showBackgroundEffects = true;
    update(["show_background_effect"]);
  }

  void _scrollingListner() {
    final double position = scrollController.position.pixels;
    if (position > 350 && !showBottomBorder) {
      showBottomBorder = !showBottomBorder;
      update(["appbar_bottom_border"]);
    } else if (position < 350 && showBottomBorder) {
      showBottomBorder = !showBottomBorder;
      update(["appbar_bottom_border"]);
    }

    if (position >= currCircleYposition) {
      showFirstCircle = true;
      update(["show_widget_up_aniamtion"]);
    }
  }

  void geCirclePosition() {
    RenderBox? renderBox =
        circleShapeKey.currentContext!.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      Offset offset = renderBox.localToGlobal(Offset.zero);
      currCircleYposition = currCircleYposition + offset.dy - 300;

      update(["show_background_effect"]);
    }
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollingListner);
    scrollController.dispose();
    super.onClose();
  }

  void menuToggle() async {
    isMenuClosing = !isMenuClosing;
    update(["menu_toggle"]);
    if (showMenu) await Future.delayed(const Duration(milliseconds: 600));
    showMenu = !showMenu;
    update(["menu_toggle"]);
  }
}
