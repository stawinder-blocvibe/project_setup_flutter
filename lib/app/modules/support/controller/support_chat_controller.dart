import 'dart:isolate';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:base_project/app/modules/support/data_mdoel/load_chat_response_model.dart'
    as LoadChat;

import '../../../export.dart';
import '../data_mdoel/load_new_message_response_model.dart';
import '../data_mdoel/message_data_model.dart';
import '../data_mdoel/send_message_response_model.dart';

class SupportChatController extends GetxController {
  TextEditingController messageController = TextEditingController();
  FocusNode messageFocusNode = FocusNode();
  SendMessageResponseModel sendMessageResponseModel =
      SendMessageResponseModel();
  LoadChat.LoadChatResponseModel loadChatResponseModel =
      LoadChat.LoadChatResponseModel();
  LoadNewChatResponseModel loadNewChatResponseModel =
      LoadNewChatResponseModel();
  RxBool isLoading = true.obs;
  Timer? timer;
  RxBool isNotification = false.obs;
  var wsUrl;
  var channel;
  var userId;
  ScrollController scrollController = ScrollController();
  late Isolate? isolate;
  int page = 0;

  final Connectivity connectivity = Connectivity();
  ConnectivityResult? result;

  @override
  void onInit() {
    initApi();
    getCurrentUserData();
    getArgument();

    ontToOnePagination();

    super.onInit();
  }

  final PreferenceManger preferenceManager = Get.find<PreferenceManger>();
  UserDataModel userDataModel = UserDataModel();

  getCurrentUserData() async {
    userDataModel = await preferenceManager.getSavedLoginData();
  }

  getArgument() {
    if (Get.arguments != null) {
      isNotification.value = Get.arguments['is_notification'] ?? false;
    }
  }

  DioClient? dioClient;

  initApi() async {
    dioClient = DioClient(baseUrl, Dio());
    loadChatList(page: 0);
  }

  onReady() {
    chatIsolate();
    super.onReady();
  }

  ontToOnePagination() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (isLoading.value == false) {
          if (page < (loadChatResponseModel.mMeta?.pageCount?.toInt() ?? 0)) {
            page++;
            loadChatList(page: page);
          }
        }
      } else {
        isLoading.value = false;
        update();
      }
    });
  }

  hitSendMessageApiCall() async {
    try {
      var reqBody = {
        "Chat[message]": messageController.text.trim(),
        'Chat[type_id]': 0
      };
      final response = dioClient!.post(
        "/chat/send-message",
        data: FormData.fromMap(reqBody),
        skipAuth: false,
      );
      sendMessageResponseModel =
          SendMessageResponseModel.fromJson(await response);
      chatList.insert(0, sendMessageResponseModel.detail!);
      scrollToBottom();
      messageController.clear();
    } catch (e, str) {
      customLoader.hide();
      NetworkExceptions.getDioException(e, str, "/chat/send-message");
    }
  }

  void scroll() {
    scrollController.animateTo(0.0,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  RxList<MessageDataModel> chatList = <MessageDataModel>[].obs;

  getNewMessage() async {
    try {
      final response = dioClient!
          .post("/chat/load-new-message", skipAuth: false, isLoading: false);
      loadNewChatResponseModel =
          LoadNewChatResponseModel.fromJson(await response);
      if (loadNewChatResponseModel.list!.isNotEmpty) {
        loadNewChatResponseModel.list!.forEach(
          (element) {
            chatList.insert(0, element);
            scroll();
          },
        );
      }
    } catch (e, str) {
      Future.error(
          NetworkExceptions.getDioException(e, str, "/chat/load-new-message"));
    }
  }

  loadChatList({page}) async {
    try {
      final response = dioClient!.get("/chat/load-chat",
          skipAuth: false, queryParameters: {'page': page});
      loadChatResponseModel = LoadChat.LoadChatResponseModel.fromJson(await response);
      if (page == 0) {
        chatList.clear();
        chatList.value = loadChatResponseModel.list ?? [];
      } else {
        chatList.addAll(loadChatResponseModel.list ?? []);
      }
      isLoading.value = false;
      isLoading.refresh();
      chatList.refresh();
    } catch (e, str) {
      isLoading.value = false;
      isLoading.refresh();
      Future.error(
          NetworkExceptions.getDioException(e, str, "/chat/load-chat"));
      // toast(NetworkExceptions.messageData);
    }
  }

  scrollToBottom() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      scrollController.animateTo(
        scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeOut,
      );
    });
  }

  chatIsolate() {
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      getNewMessage();
    });
  }

  void stopIsolate() {
    try {
      timer?.cancel();
      isolate?.kill();
      isolate = null;
    } catch (e) {}
  }

  RxBool isLoad = true.obs;

  paginateItemList() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // debugPrint(scrollController.position.pixels);
      }
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    stopIsolate();
    super.onClose();
  }

  @override
  void dispose() {
    timer?.cancel();
    stopIsolate();
    super.dispose();
  }

  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete {
    timer?.cancel();
    return super.onDelete;
  }
}
