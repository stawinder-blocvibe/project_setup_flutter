

import 'package:base_project/app/export.dart';

class StaticPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StaticPageController>(
      () => StaticPageController(),
    );
  }
}
