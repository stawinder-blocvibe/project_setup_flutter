

import 'package:base_project/app/export.dart';
import 'package:base_project/app/modules/chat/controllers/chat_controller.dart';
import 'package:base_project/app/modules/chat/controllers/life_needs_chat_list_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(
      () => ChatController(),
    );
    Get.lazyPut<LifeNeedsChatListController>(
      () => LifeNeedsChatListController(),
    );
  }
}
