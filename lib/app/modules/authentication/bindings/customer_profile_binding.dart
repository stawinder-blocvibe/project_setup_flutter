import 'package:base_project/app/export.dart';
import 'package:base_project/app/modules/authentication/controllers/customer_profile_setup_controller.dart';

class CustomerProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerProfileSetupController>(
      () => CustomerProfileSetupController(),
    );
  }
}
