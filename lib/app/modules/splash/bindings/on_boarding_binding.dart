

import 'package:base_project/app/export.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(
      () => OnBoardingController(),
    );
  }
}
