

import 'package:base_project/app/export.dart';

class OthersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OthersController>(
      () => OthersController(),
    );
  }
}
