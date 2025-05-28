


import '../../../export.dart';
import '../controller/support_chat_controller.dart';

class SupportListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportChatController>(() => SupportChatController());
  }
}
