

import 'package:base_project/app/export.dart';
import 'package:base_project/app/modules/chat/controllers/life_needs_chat_list_controller.dart';

class LifeNeedsChatListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LifeNeedsChatListController>(
      () => LifeNeedsChatListController(),
    );
  }
}
