import 'package:get/route_manager.dart';
import 'package:netspotclone/app/routes/app_routes.dart';
import 'package:netspotclone/app/view/pages/main_page.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
        name: AppRoutes.MAIN_PAGE,
        page: () => const MainPage(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 300))
  ];
}
