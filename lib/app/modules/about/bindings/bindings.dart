

import 'package:base_project/app/export.dart';


import '../controllers/about_us_controller.dart';

class AboutUsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutUsController>(
      () => AboutUsController(),
    );
  }
}
