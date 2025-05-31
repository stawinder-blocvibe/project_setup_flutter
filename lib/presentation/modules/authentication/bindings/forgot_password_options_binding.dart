import 'package:base_project/app/export.dart';

import '../controllers/forgot_password_options_controller.dart';

class ForgotPasswordOptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswrodOptionController>(
      () => ForgotPasswrodOptionController(),
    );
  }
}
