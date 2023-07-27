import 'package:get/instance_manager.dart';
import 'package:netspotclone/app/controllers/main_page_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainPageController());
  }
}
