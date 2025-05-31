

import '../../../../app/export.dart';
import '../controllers/main_parent_controller.dart';

class MainParentBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainParentController>(
      () => MainParentController(),
    );
  }
}
