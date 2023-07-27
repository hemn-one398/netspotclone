import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:netspotclone/app/controllers/main_page_controller.dart';
import 'package:netspotclone/app/utils/app_colors.dart';
import 'package:netspotclone/app/view/widgets/custom_button.dart';

import 'package:netspotclone/app/view/widgets/glass_animated_button.dart';
import 'package:netspotclone/app/view/widgets/glassmorphism_container.dart';
import 'package:netspotclone/app/view/widgets/help_card.dart';
import 'package:netspotclone/app/view/widgets/menu_list.dart';
import 'package:netspotclone/app/view/widgets/shapes/background_effect_painter.dart';
import 'package:netspotclone/app/view/widgets/shapes/liner_gradient_circle_shape.dart';
import 'package:netspotclone/app/view/widgets/solution_card.dart';
import 'package:sizer/sizer.dart';

class MainPage extends GetView<MainPageController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      extendBodyBehindAppBar: true,
      body: GetBuilder<MainPageController>(
          id: "menu_toggle",
          builder: (_) {
            return Stack(
              children: [
                GetBuilder<MainPageController>(
                    id: "show_widget_up_aniamtion",
                    builder: (_) {
                      return SingleChildScrollView(
                        physics: controller.showMenu
                            ? const NeverScrollableScrollPhysics()
                            : const ClampingScrollPhysics(),
                        controller: controller.scrollController,
                        child: SizedBox(
                          height: 8500,
                          child: Stack(children: [
                            GetBuilder<MainPageController>(
                                id: "show_background_effect",
                                builder: (context) {
                                  return AnimatedPositioned(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    top: 0,
                                    right: controller.showBackgroundEffects
                                        ? -50
                                        : -100,
                                    child: AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      opacity:
                                          controller.showBackgroundEffects
                                              ? 1
                                              : 0.1,
                                      child: CustomPaint(
                                        painter: BackgroundEffectPainter(),
                                        size: const Size(400, 300),
                                      ),
                                    ),
                                  );
                                }),
                            Positioned(
                              key: controller.circleShapeKey,
                              top: 1700,
                              left: -300,
                              right: -300,
                              child: AnimatedOpacity(
                                curve: Curves.linear,
                                duration: const Duration(seconds: 3),
                                opacity: controller.showFirstCircle ? 1 : 0.0,
                                child: const LinerGradientCircleShape(
                                    size: 1000, opacity: 0.7),
                              ),
                            ),
                            Positioned(
                              top: 1800,
                              left: -300,
                              right: -300,
                              child: AnimatedOpacity(
                                curve: Curves.linear,
                                duration: const Duration(seconds: 6),
                                opacity: controller.showFirstCircle ? 1 : 0.0,
                                child: const LinerGradientCircleShape(
                                    size: 800, opacity: 0.5),
                              ),
                            ),
                            Positioned(
                                top: 1900,
                                left: -300,
                                right: -300,
                                child: AnimatedOpacity(
                                  curve: Curves.linear,
                                  duration: const Duration(seconds: 9),
                                  opacity:
                                      controller.showFirstCircle ? 1 : 0.0,
                                  child: const LinerGradientCircleShape(
                                      size: 600, opacity: 0.3),
                                )),
                            Positioned(
                              top: 200,
                              left: 0,
                              right: 0,
                              child: _contents(),
                            ),
                          ]),
                        ),
                      );
                    }),
                Positioned(
                  child: AnimatedSwitcher(
                      transitionBuilder: (child, animation) {
                        return child;
                      },
                      duration: const Duration(milliseconds: 400),
                      child: controller.showMenu
                          ? MenuList(
                              key: const Key("menuKey"),
                              showUp: controller.isMenuClosing,
                            )
                          : null),
                )
              ],
            );
          }),
    );
  }

  _contents() {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const Text("WE'RE BUILDING",
          style: TextStyle(
              color: AppColors.primaryTextColor,
              fontSize: 22,
              letterSpacing: 8)),
      _space20px(),
      const Text("Cutting Edge\n Solutions",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primaryTextColor,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          )),
      _space20px(),
      const Text(
          "NetSpot provides cutting-edge technology solutions tailored to your business needs, from networking to software development, trust our experts to enhance your digital world.",
          maxLines: 4,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primaryTextColor,
            fontSize: 18,
          )),
      _space20px(),
      CustomButton(
        text: "View The Solutions",
        icon: SvgPicture.asset("assets/svgs/stack.svg"),
      ),
      const SizedBox(
        height: 80,
      ),
      _videoWindow(),
      _space50px(),
      const Text(
        "TRUSTED BY ENTERPRISES",
        style: TextStyle(fontSize: 20, color: AppColors.secondaryTextColor),
      ),
      _space50px(),
      SvgPicture.asset(
        "assets/svgs/microsoft.svg",
        height: 40,
      ),
      _space50px(),
      Image.asset(
        "assets/img/engage.png",
        height: 48,
      ),
      _space50px(),
      SvgPicture.asset(
        "assets/svgs/ngvoice.svg",
        height: 80,
        colorFilter:
            const ColorFilter.mode(AppColors.primaryTextColor, BlendMode.srcIn),
      ),
      const SizedBox(
        height: 240,
      ),
      Text(
        "Enterprise Solutions",
        style: TextStyle(
            color: AppColors.primaryTextColor,
            fontSize: 40,
            shadows: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  blurRadius: 30,
                  spreadRadius: 55,
                  offset: const Offset(3, 5))
            ]),
      ),
      _space20px(),
      Text(
        "Step into a realm of transformative Enterprise\nSolutions through our exclusive portal.\nDiscover our dynamic, adaptable, and visionary\nsolutions that empower businesses to conquer\nthe challenges of the modern competitive\nlandscape.",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.primaryTextColor,
            fontSize: 16,
            shadows: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  blurRadius: 30,
                  spreadRadius: 55,
                  offset: const Offset(3, 5))
            ]),
      ),
      _space20px(),
      CustomButton(
        text: "Learn More",
        width: 90.w,
      ),
      _space100px(),
      const SolutionCard(
        title: "Networking Solutions",
        detail:
            "experts in designing reliable and scalable communication infrastructure,leveraging advanced technologies to optimize performance and enable efficient collaboration.",
        svgPath: "assets/svgs/networking.svg",
      ),
      _space30px(),
      const SolutionCard(
        title: "Fintech Solutions",
        detail:
            "Our digital banking system and seamless payment platform can help you succeed in the future. Our comprehensive system can help you streamline operations and empower your business.",
        svgPath: "assets/svgs/fintech.svg",
      ),
      _space30px(),
      const SolutionCard(
        title: "E-Goverment",
        detail:
            "Our innovative eGovernment Solutions can help you streamline identity management, unleash the potential of OCR technology, and enhance efficiency and security.",
        svgPath: "assets/svgs/e-goverment.svg",
      ),
      _space50px(),
      const Text("How Can We Help",
          style: TextStyle(
            fontSize: 40,
            color: AppColors.primaryTextColor,
          )),
      _space20px(),
      const Text(
          "Experience exponential business growth with Netspot's services. Develop your business like never before with our innovative solutions and expert guidance.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: AppColors.primaryTextColor,
          )),
      _space100px(),
      const HelpCard(
        svgPath: "assets/svgs/composability.svg",
        title: "Composability",
        detail:
            "NetSpot's solutions let you build a flexible and adaptable business with unmatched agility and efficiency.",
      ),
      _space30px(),
      const HelpCard(
        svgPath: "assets/svgs/visibility.svg",
        title: "Visibility",
        detail:
            "NetSpot's advanced visibility solutions give you deep insights into your business operations, empowering you to make better decisions and optimize operations.",
      ),
      _space30px(),
      const HelpCard(
        svgPath: "assets/svgs/scalability.svg",
        title: "Scalability",
        detail:
            "NetSpot's scalable solutions can help your business grow limitlessly by accommodating increased demands.",
      ),
      _space100px(),
      Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.centerLeft,
        child: const Text(
          "Get In Touch With Us",
          style: TextStyle(color: AppColors.primaryTextColor, fontSize: 30),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.centerLeft,
        child: const Text(
          "We value your feedback, questions, and suggestions. Please reach out to us if you have any inquiries or concerns. We are here to help!",
          style: TextStyle(color: AppColors.secondaryTextColor, fontSize: 18),
        ),
      ),
      _space50px(),
      const Divider(
        color: AppColors.primaryTextColor,
        endIndent: 10,
        indent: 10,
      ),
      _space50px(),
      Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.centerLeft,
        child: Row(
          children: const [
            Icon(
              Icons.call_outlined,
              color: AppColors.primaryTextColor,
              size: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "+964 (770) 090 50 43",
              style: TextStyle(color: AppColors.primaryTextColor, fontSize: 22),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.centerLeft,
        child: Row(
          children: const [
            Icon(
              Icons.email_outlined,
              color: AppColors.primaryTextColor,
              size: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "info@netspot.solutions",
              style: TextStyle(color: AppColors.primaryTextColor, fontSize: 22),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.centerLeft,
        child: Row(
          children: const [
            Icon(
              Icons.location_on_outlined,
              color: AppColors.primaryTextColor,
              size: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                "Rizgary Quarter 412, building 70,\nSulaymaniyah, Kurdistan Region, Iraq",
                style:
                    TextStyle(color: AppColors.primaryTextColor, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      _space50px(),
      SizedBox(
        height: 700,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/img/map_falback.png",
                height: 700,
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xff05121C).withOpacity(0.5)),
            )
          ],
        ),
      ),
      const Divider(
        color: AppColors.primaryTextColor,
      ),
      _space50px(),
      Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Main",
              style: TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 24,
              ),
            ),
            _space30px(),
            const Text(
              "Home",
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 20,
              ),
            ),
            _space20px(),
            const Text(
              "Solutions",
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 20,
              ),
            ),
            _space20px(),
            const Text(
              "Partners",
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 20,
              ),
            ),
            _space50px(),
            const Text(
              "Company",
              style: TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 24,
              ),
            ),
            _space20px(),
            const Text(
              "About us",
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 20,
              ),
            ),
            _space20px(),
            const Text(
              "Careers",
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 20,
              ),
            ),
            _space50px(),
            const Text(
              "Follow Us",
              style: TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 24,
              ),
            ),
            _space20px(),
            const Text(
              "Linkedin",
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 20,
              ),
            ),
            _space50px(),
            const Text(
              "Chatbot",
              style: TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 24,
              ),
            ),
            _space20px(),
            Container(
              width: 200,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: const Color(0xff36BF63)),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                SvgPicture.asset(
                  "assets/svgs/whatsapp.svg",
                  height: 30,
                ),
                const Text(
                  "WhatsApp",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ]),
            ),
          ],
        ),
      ),
      _space100px(),
      Row(
        children: [
          const Expanded(
            child: Divider(
              color: AppColors.secondaryTextColor,
              endIndent: 30,
            ),
          ),
          SvgPicture.asset(
            "assets/svgs/netspotLogo.svg",
            height: 50,
          ),
          const Expanded(
            child: Divider(
              indent: 30,
              color: AppColors.secondaryTextColor,
            ),
          ),
        ],
      ),
      _space100px(),
      const Text(
        "© 2023  Netspot Solutions. All rights reserved",
        style: TextStyle(
          color: AppColors.secondaryTextColor,
        ),
      )
    ]);
  }

  SizedBox _space30px() {
    return const SizedBox(
      height: 30,
    );
  }

  SizedBox _space100px() {
    return const SizedBox(
      height: 100,
    );
  }

  SizedBox _space50px() {
    return const SizedBox(
      height: 50,
    );
  }

  Container _videoWindow() {
    return Container(
      height: 500,
      width: 100.w,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0XFF44C8F5), width: 0.2),
      ),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 80,
          decoration: const BoxDecoration(
            color: Color(0xff192636),
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            CircleAvatar(
              radius: 8,
              backgroundColor: Colors.red.shade300,
            ),
            const SizedBox(
              width: 6,
            ),
            CircleAvatar(
              radius: 8,
              backgroundColor: Colors.yellow.shade300,
            ),
            const SizedBox(
              width: 6,
            ),
            CircleAvatar(
              radius: 8,
              backgroundColor: Colors.green.shade300,
            ),
            const Spacer(),
            SvgPicture.asset(
              "assets/svgs/window.svg",
              height: 25,
            ),
            const SizedBox(
              width: 30,
            ),
            const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff4D5E72),
            ),
            const SizedBox(
              width: 20,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff4D5E72),
            ),
          ]),
        ),
        Expanded(
            child: GetBuilder<MainPageController>(
                id: "show_background_effect",
                builder: (context) {
                  return Stack(
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 1000),
                        bottom: controller.showBackgroundEffects ? 20 : -100,
                        left: 0,
                        right: 0,
                        top: 0,
                        child: SvgPicture.asset(
                          "assets/svgs/header_video_bg.svg",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(30),
                          height: 120,
                          width: 180,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 0.4,
                                color: Colors.white,
                              )),
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 600),
                            opacity: controller.showBackgroundEffects ? 1 : 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xff05121C).withOpacity(0.8),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 0.4,
                                    color: Colors.white,
                                  )),
                              child: const Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                                size: 60,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                })),
        Container(
          height: 130,
          decoration: const BoxDecoration(color: Color(0xff05121C), boxShadow: [
            BoxShadow(
                color: Color(0xff05121C), blurRadius: 80, spreadRadius: 100)
          ]),
        )
      ]),
    );
  }

  SizedBox _space20px() {
    return const SizedBox(
      height: 20,
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size(350, 150),
      child: GetBuilder<MainPageController>(
          id: "appbar_bottom_border",
          builder: (_) {
            return GlassContainer(
              decoreation: BoxDecoration(
                border: controller.showBottomBorder
                    ? const Border(
                        bottom: BorderSide(
                            color: AppColors.primaryTextColor, width: 0.2))
                    : null,
              ),
              height: 150,
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(children: [
                  SvgPicture.asset(
                    "assets/svgs/netspotLogo.svg",
                    height: 50,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          width: 160,
                          child: GlassButton(
                              text: "Contact Us", onPressed: () {})),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: controller.menuToggle,
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primaryTextColor,
                              width: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(80),
                          ),
                          child: GetBuilder<MainPageController>(
                              id: "menu_toggle",
                              builder: (context) {
                                return AnimatedSwitcher(
                                  duration: const Duration(seconds: 1),
                                  child: controller.showMenu
                                      ? const Icon(
                                          Icons.close,
                                          size: 28,
                                          color: AppColors.primaryTextColor,
                                        )
                                      : SvgPicture.asset(
                                          "assets/svgs/menu.svg",
                                          height: 34,
                                        ),
                                );
                              }),
                        ),
                      )
                    ],
                  ))
                ]),
              ),
            );
          }),
    );
  }
}
