

import 'package:base_project/app/export.dart';

class LifeNeedsChatListController extends GetxController {
  ScrollController scrollController = ScrollController();
  int page = 0;

  Rx<ChatListResponseModel> chatListResponseModel = ChatListResponseModel().obs;
  RxList<UserDataModel> chatLists = <UserDataModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    hitChatListAPI(page: 0);
    paginateList();
    super.onReady();
  }

  paginateList() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (page < chatListResponseModel.value.mMeta!.pageCount! - 1) {
          page++;
          hitChatListAPI(
            page: page,
          );
        }
      }
    });
  }

  hitChatListAPI({page}) {
    if (page == 0) {
      customLoader.show(Get.overlayContext);
    }
    repository
        .chatListApiCall(
      page: page,
    )
        .then((value) async {
      customLoader.hide();
      if (value != null) {
        chatListResponseModel.value = value;
        if (page == 0) {
          chatLists.value = chatListResponseModel.value.list!;
        } else {
          if (chatListResponseModel.value.list!.length > 0) {
            chatLists.addAll(chatListResponseModel.value.list!);
          }
        }
        chatLists.refresh();
      }
    }).onError((error, stackTrace) {
      customLoader.hide();
      debugPrint(error.toString());
    });
  }

  void navigateToSingleChatScreen(int index) async {
    await Get.toNamed(AppRoutes.chatRoute, arguments: {
      argUserNameId: chatLists[index].id,
      argUserName: chatLists[index].fullName,
      argUserProfile: chatLists[index].profileFile,
    });
    chatLists[index].unreadMessageCount = null;
  }
}
