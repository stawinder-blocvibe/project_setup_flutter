

import 'package:base_project/app/export.dart';

import '../controllers/onboarding_controller.dart';


class OnboardingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(
      () => OnboardingController(),
    );
  }
}
