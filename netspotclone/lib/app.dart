import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:netspotclone/app/bindings/initial_bindings.dart';
import 'package:netspotclone/app/routes/app_pages.dart';
import 'package:netspotclone/app/routes/app_routes.dart';
import 'package:netspotclone/app/utils/app_colors.dart';
import 'package:sizer/sizer.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
          initialBinding: InitialBindings(),
          getPages: AppPages.pages,
          initialRoute: AppRoutes.MAIN_PAGE,
        );
      },
    );
  }
}
