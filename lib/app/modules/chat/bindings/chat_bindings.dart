/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

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
