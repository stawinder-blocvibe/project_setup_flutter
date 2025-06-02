// import 'package:firebase_messaging/firebase_messaging.dart';

import '../export.dart';


class PushNotificationsManager {
  static final PushNotificationsManager _instance =
      PushNotificationsManager._internal();

  factory PushNotificationsManager() => _instance;

  PushNotificationsManager._internal();

  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();
  // static const MethodChannel _platform = MethodChannel('custom_notification');

  var comingFromNotification = false;
  var userToken;
  // UserDataModel? userDataModel;

  Future init() async
  {}

  /*{
    // await _firebaseMessaging.requestPermission();
    // await _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    // await _firebaseMessaging.getToken().then((value) {
    //   deviceToken = value;
    //   debugPrint("Firebase Messaging token $value");
    //   PreferenceManger().saveFcmToken(value);
    // });

    _configureMethodChannel();

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   debugPrint('onMessage: ${message.data}');
    //   customNotificationPopup(message.data);
    //   return;
    // });

*//*
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('onMessageOpenedApp: ${message.data}');
      final messageData = message.data;
      final String typeId = messageData["type_id"]?.toString() ?? "0";
      debugPrint('onMessageOpenedApp: ${message.data}');

      orderPlaceRoute(typeId: typeId, detail: messageData);
    });
*//*

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   debugPrint('onMessageOpenedApp: ${message.data}');
    //
    //   final messageData = message.data;
    //   final String typeId = messageData["type_id"]?.toString() ?? "0";
    //
    //   if (typeId == constNotifyChatSupport || typeId == constNotifyChat) {
    //     _navigateToChatScreen(
    //       id: int.tryParse(messageData['created_by_id'] ?? '0'),
    //       name: messageData['full_name'],
    //       profilePicUrl: messageData['image_file'],
    //       to_user_id: int.tryParse(messageData['to_user_id'] ?? '0') ?? 0,
    //       orderId: messageData['model_id'],
    //     );
    //   } else {
    //     orderPlaceRoute(typeId: typeId, detail: messageData);
    //   }
    // });

    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        debugPrint('getInitialMessage: ${message.data}');

        final messageData = message.data;
        final String typeId = messageData["type_id"]?.toString() ?? "0";

        if (typeId == constNotifyChatSupport || typeId == constNotifyChat) {
          _navigateToChatScreen(
            id: int.tryParse(messageData['created_by_id'] ?? '0'),
            name: messageData['full_name'],
            profilePicUrl: messageData['image_file'],
            to_user_id: int.tryParse(messageData['to_user_id'] ?? '0') ?? 0,
            orderId: messageData['model_id'],
          );
        } else {
          orderPlaceRoute(typeId: typeId, detail: messageData);
        }
      }
    });

    *//*   _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        debugPrint('getInitialMessage: ${message.data}');

        final messageData = message.data;
        final String typeId = messageData["type_id"]?.toString() ?? "0";

        orderPlaceRoute(
          typeId: typeId,
          detail: messageData,
        );
      }
    });*//*
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('onMessageOpenedApp: ${message.data}');

      final messageData = message.data;
      final String typeId = messageData["type_id"]?.toString() ?? "0";

      if (typeId.toString() == constNotifyChatSupport.toString() ||
          typeId.toString() == constNotifyChat.toString()) {
        _navigateToChatScreen(
          id: int.tryParse(messageData['created_by_id'] ?? '0'),
          name: messageData['full_name'],
          profilePicUrl: messageData['image_file'],
          to_user_id: int.tryParse(messageData['to_user_id'] ?? '0') ?? 0,
          orderId: messageData['model_id'],
        );
      } else {
        orderPlaceRoute(typeId: typeId, detail: messageData);
      }
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }*/

  void _configureMethodChannel() {
    // platform.setMethodCallHandler((call) async {
    //   if (call.method == 'onNotificationClick') {
    //     Map notificationData = Map.from(call.arguments);
    //
    //     debugPrint('Notification Clicked Data2: $notificationData');
    //
    //     final String typeId = notificationData['typeId']?.toString() ?? '0';
    //
    //     orderPlaceRoute(
    //       typeId: typeId,
    //       detail: notificationData,
    //     );
    //   }
    // });
  }

/*  static Future _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async
  {
    debugPrint('Background Message: ${message.data}');
  }*/

  Future customNotificationPopup(Map notification) async {
    String formattedTime = notification["estimated_delivery_time"] != null
        ? "${notification["estimated_delivery_time"]}"
        : "";
    var data = {
      'title': notification["title"] ?? "No Title",
      'status': notification["full_name"] ?? "No Name",
      'time': formattedTime,
      'image_file': notification["image_file"] ?? "iconProfile",
      'message': notification["description"] ?? "",
      'typeId': notification["type_id"]?.toString() ?? "0",
      'model_id': notification['model_id']?.toString() ?? '0',
      'model_type': notification['model_type'] ?? '',
      'full_name': notification['full_name'] ?? 'Admin',
      'to_user_id': int.tryParse(notification['to_user_id'] ?? '0') ?? 0,
      'created_by_id': int.tryParse(notification['created_by_id'] ?? '0') ?? 0,
    };

    debugPrint('Sending data to AndroidSetMethodCallHandler native --> $data');
    await showCustomNotificationWithData(data);
  }

  Future showCustomNotificationWithData(Map data) async {
    // try {
    //   final result =
    //       await _platform.invokeMethod('showCustomNotification', data);
    //   debugPrint('Custom Notification Result: $result');
    // } on PlatformException catch (e) {
    //   debugPrint("Failed to show notification: '${e.message}'.");
    // }
  }

  void orderPlaceRoute({
    required String typeId,
    dynamic detail,
  }) {
    debugPrint('messageData---->$detail');
    bool isMessageFromAdmin = detail.containsKey('created_by_id') &&
        detail['created_by_id'].toString() == "1";

    if (typeId == constNotifyChatSupport &&
        isMessageFromAdmin &&
        Get.currentRoute != AppRoutes.supportChatScreen) {
      Get.toNamed(AppRoutes.supportChatScreen);
    } else if (typeId == constNotifyChatSupport &&
        isMessageFromAdmin &&
        Get.currentRoute == AppRoutes.supportChatScreen) {
      if (Get.isRegistered()) {
        Get.find().onReady();
      } else {
        // Get.put(SupportChatController()).onReady();
      }
    } else if (typeId == constNotifyOrderConfirmed ||
        typeId == constNotifyOrderRejected ||
        typeId == constNotifyOrderPickedUp ||
        typeId == constNotifyOrderReady ||
        typeId == constNotifyOrderPlaced ||
        typeId == constNotifyOrderDelivered) {
      debugPrint('Order Placed !!');
      debugPrint('Order Placed im am here !!');
      debugPrint('modelID ${detail}');
      if (detail['model_id'] == null) {
        return;
      }
      int orderId = int.tryParse(detail['model_id'].toString()) ?? 0;
      debugPrint('Navigating to OrderDetailsScreen with orderId: $orderId');
      handleOrderRouteData(detail: detail);
    } else if (typeId == constNotifyChat) {
      if (Get.currentRoute != AppRoutes.chatRoute) {
        debugPrint('created_by_id---->${detail['created_by_id']}');
        debugPrint('full_name---->${detail['full_name']}');
        debugPrint('image_file---->${detail['image_file']}');
        debugPrint('model_id---->${detail['model_id']}');
        _navigateToChatScreen(
            id: detail['created_by_id'],
            name: detail['full_name'],
            profilePicUrl: detail['image_file'],
            to_user_id: detail['to_user_id'],
            orderId: detail['model_id']);
      }
    } else if (typeId == constNotifyPostLike ||
        typeId == constNotifyPostComment) {
      _navigateToPostDetailScreen(postId: int.tryParse(detail['model_id']));
    } else if (typeId == constNotifyReadyToDispatch.toString() ||
        typeId == constNotifyCourierPickup ||
        typeId == constNotifyCourierDeliver) {
      _navigateToCustomerCourierDetails(int.tryParse(detail['model_id']));
    } else if (typeId.toString() == constNotifyRatingReceived.toString()) {
      Get.toNamed(AppRoutes.notificationRoute);
    } else {
      debugPrint('notificationRoute-->$typeId  !!');
      Get.toNamed(AppRoutes.notificationRoute);
    }
  }

  void _navigateToCustomerCourierDetails(int? orderId) async {
    if (Get.currentRoute == AppRoutes.legRunningOrderDetailsScreen) {
      if (Get.isRegistered()) {
        Get.find().loadCourierDetails();
      }
      return;
    } else {
      Get.toNamed(AppRoutes.legRunningOrderDetailsScreen,
          arguments: {idKey: orderId});
      if (Get.isRegistered()) {
        Get.find().loadCourierDetails();
      }
      debugPrint('Get.currentRoute----->${Get.currentRoute}');
    }
  }

  void _navigateToChatScreen(
      {int? id,
      var name,
      var profilePicUrl,
      String? orderId,
      required to_user_id}) {
    if (Get.currentRoute == AppRoutes.chatRoute) {
      if (Get.isRegistered()) {
        if (Get.find().fromId == id) {
          return;
        } else {
          Get.find().fromId = id;
          Get.find().userName.value = name;
          Get.find().userImage.value = profilePicUrl;
          Get.find().hitLoadChatApiCall(isFirst: true);
        }
      }
      return;
    } else {
      Map<String, dynamic> arguments = {
        argUserNameId: id,
        argUserName: name,
        argUserProfile: profilePicUrl,
        driverIdKey: id,
        customerIdKey: to_user_id,
        argOrderId: orderId,
        isDriverKey: true,
      };
      debugPrint(
          "Navigating to ${AppRoutes.chatRoute} with arguments: $arguments");
      Get.toNamed(AppRoutes.chatRoute, arguments: arguments);
    }
  }

  void _navigateToPostDetailScreen({int? postId}) async {
    if (Get.currentRoute == AppRoutes.postDetailScreen ||
        Get.currentRoute == AppRoutes.lifeNeedsCommentScreen) {
      if (Get.isRegistered()) {
        Get.find().postId = postId;
        Get.find().loadPostDetail();
      }
      if (Get.isRegistered()) {
        Get.find().postId = postId;
        Get.find().pageNumber = 0;
        Get.find().loadComments();
      }
      return;
    } else {
      await Get.toNamed(AppRoutes.postDetailScreen, arguments: {idKey: postId});
      if (Get.isRegistered()) {
        Get.find().selectedTab.value = 0;
        Get.find().loadMyPosts();
      }
    }
  }

  void handleOrderRouteData({dynamic detail}) {
    if (Get.currentRoute == AppRoutes.orderDetailsScreen) {
      var controller = Get.find();
      if (controller.orderId != null &&
          controller.orderId == int.tryParse(detail['model_id'])) {
        Get.find().onReady();
      }
      Get.find().onReady();
    } else if (Get.currentRoute == AppRoutes.customerTrackOrderScreen) {
    } else {
      Get.toNamed(AppRoutes.orderDetailsScreen,
          arguments: {idKey: int.tryParse(detail['model_id'])});
    }
  }
}
