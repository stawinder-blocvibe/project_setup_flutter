

import 'package:base_project/app/export.dart';

class FAQBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaqController>(
      () => FaqController(),
    );
  }
}
