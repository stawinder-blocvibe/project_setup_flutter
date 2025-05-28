/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:base_project/app/export.dart';

class ChatController extends GetxController {
  TextEditingController messageTextController = TextEditingController();
  FocusNode messageFocusNode = FocusNode();

  Timer? timer;

  final PreferenceManger _preferenceManger = Get.find();

  ScrollController scrollController = ScrollController();

  Rx<LoadChatResponseModel> loadChatResponseModel = LoadChatResponseModel().obs;
  RxList<ChatList> chatList = <ChatList>[].obs;

  Rx loginDataModel = UserDataModel().obs;

  RxString userImage = "".obs;

  bool isSendingMessage = false;

  var fromId;
  var orderID;
  RxString userName = "".obs;

  var customerId, restaurantId, driverId, isDriver;


  @override
  void onInit() {
    if (Get.arguments != null) {
      fromId = int.tryParse(Get.arguments[argUserNameId].toString()) ?? 0;
      orderID = int.tryParse(Get.arguments[argOrderId].toString()) ?? 0;
      userName.value = Get.arguments[argUserName];
      customerId = int.tryParse(Get.arguments[customerIdKey].toString()) ?? 0;
      driverId = int.tryParse(Get.arguments[driverIdKey].toString()) ?? 0;
      restaurantId = int.tryParse(Get.arguments[restaurantIdKeyNew].toString()) ?? 0;
      isDriver = Get.arguments[isDriverKey] ?? false;

      debugPrint("Received arguments: ${Get.arguments}");
      debugPrint('FromID-----$fromId');
      debugPrint(
          'object=====> orderID :- ${orderID ?? ""}?? customerId :- ${customerId ?? ""}>> restaurantId:- ${restaurantId ?? ""}>> driverId :-${driverId ?? ""},>> userName.value:- ${userName.value}');
    }
    super.onInit();
  }
  FocusNode focusNode = FocusNode();

  @override
  void onReady() {
    debugPrint('PrderIUd------=====$orderID');
    hitLoadChatApiCall(isFirst: true);
    getProfileData();
    startTimer();
    super.onReady();
  }

  getProfileData() async {
    _preferenceManger.getSavedLoginData().then((value) {
      if (value != null) {
        loginDataModel.value = value;
      }
    });
  }

  void startTimer() {
    timer = new Timer.periodic(Duration(seconds: 3), (value) {
      getNewMessage();
    });
  }

  hitLoadChatApiCall({isFirst = false}) {
    debugPrint("hitLoadChatApiCall isDriver ${isDriver}");
    debugPrint("hitLoadChatApiCall driverId ${driverId}");
    debugPrint("hitLoadChatApiCall restaurantId ${restaurantId}");
    debugPrint("hitLoadChatApiCall orderID ${orderID}");

    repository
        .loadChatApiCall(
            userId: isDriver ? driverId : restaurantId, orderID: orderID)
        .then((value) async {
      customLoader.hide();
      if (value != null) {
        loadChatResponseModel.value = value;
        if (loadChatResponseModel.value.list != null) {
          chatList.value = loadChatResponseModel.value.list!;
        }
        if (isFirst == true) scrollToBottom();
      }
      chatList.refresh();
      update();
    }).onError((error, stackTrace) {
      debugPrint('Error---$error');
      debugPrint('Error---$stackTrace');
      customLoader.hide();
      showInSnackBar(message: error.toString());
    });
  }
  // Received arguments: {argUserNameId: 257, argUserName: Gill shubham, argUserProfile: null, driverIdKey: 257, customerIdKey: 280, argOrderId: 650, isDriverKey: true}
  // real
  // Received arguments: {argUserNameId: 257, argUserName: Gill Shubham, argUserProfile: null, argOrderId: 650, customerIdKey: 280, restaurantIdKeyNew: 301, driverIdKey: 257, isDriverKey: true}
  //
  // new
  // Received arguments: {argUserNameId: 257, argUserName: Gill shubham, argUserProfile: null, argOrderId: 650, customerIdKey: 280, driverIdKey: 257,   isDriverKey: true}





  getNewMessage() async {
    debugPrint('getNewMessage fromId=-=-===$fromId');
    debugPrint('getNewMessage fromId=-=-===$orderID');
    APIRepository()
        .loadNewMessageApiCall(userId: fromId, orderID: orderID)
        .then((value) {
      if (value != null) {
        loadChatResponseModel.value = value;
        if (loadChatResponseModel.value.list!.isNotEmpty) {
          loadChatResponseModel.value.list!.forEach(
            (element) {
              chatList.insert(0, element);
              // scroll();
            },
          );
        }
      }
    }).onError((error, stackTrace) {
      debugPrint('Error--$error');
      debugPrint('Error--$stackTrace');
    });
  }

  scrollToBottom() {
    if (scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 500)).then((value) {
        scrollController.animateTo(
          scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
        );
      });
    }
  }
  Future hitSendMessageApiCall() async {
    debugPrint(
        "hitSendMessageApiCall ${"isDriver   $isDriver" "driverId   $driverId" + "restaurantId $restaurantId" + "orderID $orderID"}");
    if (isSendingMessage == false) {
      if (messageTextController.text.trim().isEmpty) {
        return Future.error(keyEnterValidMesg.tr);
      }
      isSendingMessage = true;

      var requestModel = AuthRequestModel.sendMessageReq(
          message: messageTextController.text.trim(),
          toID: isDriver
              ? (int.tryParse(driverId.toString()) ?? 0)
              : (int.tryParse(restaurantId.toString()) ?? (int.tryParse(driverId.toString()) ?? 0)),
          orderID: int.tryParse(orderID.toString()) ?? 0
      );

      await repository.sendMessageApiCall(dataBody: requestModel).then((value) async {
        customLoader.hide();
        if (value != null) {
          isSendingMessage = false;
          messageTextController.clear();
          hitLoadChatApiCall(isFirst: true);
        }
      }).onError((error, stackTrace) {
        isSendingMessage = false;
        customLoader.hide();
        showInSnackBar(message: error.toString());
      });
    }
  }

/*  Future hitSendMessageApiCall() async {
    debugPrint(
        "hitSendMessageApiCall ${"isDriver   $isDriver" "driverId   $driverId" + "restaurantId $restaurantId" + "orderID $orderID"}");
    if (isSendingMessage == false) {
      if (messageTextController.text.trim().isEmpty) {
        return Future.error(keyEnterValidMesg.tr);
      }
      isSendingMessage = true;

      var requestModel = AuthRequestModel.sendMessageReq(
          message: messageTextController.text.trim(),
          toID: isDriver ? driverId : restaurantId??driverId,
          orderID: orderID);
      await repository
          .sendMessageApiCall(dataBody: requestModel)
          .then((value) async {
        customLoader.hide();
        if (value != null) {
          isSendingMessage = false;
          messageTextController.clear();
          hitLoadChatApiCall(isFirst: true);
        }
      }).onError((error, stackTrace) {
        isSendingMessage = false;
        customLoader.hide();
        showInSnackBar(message: error.toString());
      });
    }
  }*/


  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete {
    timer?.cancel();
    return super.onDelete;
  }
}

class LoadChatResponseModel {
  List<ChatList>? list;
  Links? lLinks;
  Meta? mMeta;
  dynamic datecheck;
  dynamic copyrights;

  LoadChatResponseModel(
      {this.list, this.lLinks, this.mMeta, this.datecheck, this.copyrights});

  LoadChatResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <ChatList>[];
      json['list'].forEach((v) {
        list!.add(new ChatList.fromJson(v));
      });
    }
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    mMeta = json['_meta'] != null ? new Meta.fromJson(json['_meta']) : null;
    datecheck = json['datecheck'];
    copyrights = json['copyrights'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    if (this.mMeta != null) {
      data['_meta'] = this.mMeta!.toJson();
    }
    data['datecheck'] = this.datecheck;
    data['copyrights'] = this.copyrights;
    return data;
  }
}

class ChatList {
  dynamic id;
  dynamic message;
  dynamic fromId;
  dynamic fromName;
  dynamic toName;
  dynamic toId;
  dynamic readers;
  dynamic requestId;
  dynamic createdOn;
  dynamic isRead;
  dynamic stateId;
  dynamic fromUserProfileFile;
  dynamic toUserProfileFile;
  bool? messageStatus;
  dynamic typeId;
  dynamic notifiedUsers;
  dynamic sendOn;

  ChatList(
      {this.id,
      this.message,
      this.fromId,
      this.fromName,
      this.toName,
      this.toId,
      this.readers,
      this.requestId,
      this.createdOn,
      this.isRead,
      this.stateId,
      this.fromUserProfileFile,
      this.toUserProfileFile,
      this.messageStatus,
      this.typeId,
      this.notifiedUsers,
      this.sendOn});

  ChatList.fromJson(Map json) {
    id = json['id'];
    message = json['message'];
    fromId = json['from_id'];
    fromName = json['from_name'];
    toName = json['to_name'];
    toId = json['to_id'];
    readers = json['readers'];
    requestId = json['request_id'];
    createdOn = json['created_on'];
    isRead = json['is_read'];
    stateId = json['state_id'];
    fromUserProfileFile = json['from_user_profile_file'];
    toUserProfileFile = json['to_user_profile_file'];
    messageStatus = json['message_status'];
    typeId = json['type_id'];
    notifiedUsers = json['notified_users'];
    sendOn = json['send_on'];
  }

  Map toJson() {
    final Map data = new Map();
    data['id'] = this.id;
    data['message'] = this.message;
    data['from_id'] = this.fromId;
    data['from_name'] = this.fromName;
    data['to_name'] = this.toName;
    data['to_id'] = this.toId;
    data['readers'] = this.readers;
    data['request_id'] = this.requestId;
    data['created_on'] = this.createdOn;
    data['is_read'] = this.isRead;
    data['state_id'] = this.stateId;
    data['from_user_profile_file'] = this.fromUserProfileFile;
    data['to_user_profile_file'] = this.toUserProfileFile;
    data['message_status'] = this.messageStatus;
    data['type_id'] = this.typeId;
    data['notified_users'] = this.notifiedUsers;
    data['send_on'] = this.sendOn;
    return data;
  }
}

class Links {
  Self? self;
  Self? first;
  Self? last;

  Links({this.self, this.first, this.last});

  Links.fromJson(Map json) {
    self = json['self'] != null ? new Self.fromJson(json['self']) : null;
    first = json['first'] != null ? new Self.fromJson(json['first']) : null;
    last = json['last'] != null ? new Self.fromJson(json['last']) : null;
  }

  Map toJson() {
    final Map data = new Map();
    if (this.self != null) {
      data['self'] = this.self!.toJson();
    }
    if (this.first != null) {
      data['first'] = this.first!.toJson();
    }
    if (this.last != null) {
      data['last'] = this.last!.toJson();
    }
    return data;
  }
}

class Self {
  dynamic href;

  Self({this.href});

  Self.fromJson(Map json) {
    href = json['href'];
  }

  Map toJson() {
    final Map data = new Map();
    data['href'] = this.href;
    return data;
  }
}

class Meta {
  dynamic totalCount;
  dynamic pageCount;
  dynamic currentPage;
  dynamic perPage;

  Meta({this.totalCount, this.pageCount, this.currentPage, this.perPage});

  Meta.fromJson(Map json) {
    totalCount = json['totalCount'];
    pageCount = json['pageCount'];
    currentPage = json['currentPage'];
    perPage = json['perPage'];
  }

  Map toJson() {
    final Map data = new Map();
    data['totalCount'] = this.totalCount;
    data['pageCount'] = this.pageCount;
    data['currentPage'] = this.currentPage;
    data['perPage'] = this.perPage;
    return data;
  }
}
