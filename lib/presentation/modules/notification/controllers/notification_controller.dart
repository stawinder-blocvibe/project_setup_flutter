

import 'package:base_project/app/export.dart';

import '../../authentication/models/data_model/user_data_model.dart';
 import '../models/dataModels/NotificationCell.dart';
import '../models/responseModels/notification_list_response_model.dart';

class NotificationController extends GetxController {
  ScrollController scrollController = ScrollController();
  int page = 0;

  NotificationListResponseModel? notificationListResponseModel;
  RxList<NotificationCell> notificationsList = <NotificationCell>[].obs;

  MessageResponseModel errorMessageResponseModel = MessageResponseModel();

  Rx<UserDataModel> userDataModel = UserDataModel().obs;
  Rx<String> userToken = ''.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      userDataModel.value = await preferenceManger.getSavedLoginData();
      userToken.value = preferenceManger.getAuthToken();
      paginateList();
      hitNotificationsListApiCall(page: 0);
    });

    super.onReady();
  }

  hitNotificationsListApiCall({page}) async {
    customLoader.show(Get.context);

  }

  paginateList() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (page < (notificationListResponseModel?.meta?.pageCount ?? 0) - 1) {
          page++;
          hitNotificationsListApiCall(page: page);
        }
      }
    });
  }

  hitClearAllNotificationAPI() async {

  }

  notificationRedirection(Map<String, dynamic> data) async {
    debugPrint('data--->${data['model_id']}  ${data['type_id']}');
    final typeId = data['type_id'];
    final modelId = data['model_id'];
    final detail = data;
    debugPrint("Model Type: ${detail['model_type']}, Type ID: ${detail['type_id']}");
    // Support Chat Notification ke liye logic add kar raha hoon
    bool isMessageFromAdmin = detail.containsKey('created_by_id') &&
        detail['created_by_id'].toString() == "1";



    if (typeId == constNotifyChatSupport &&
        isMessageFromAdmin &&
        Get.currentRoute != AppRoutes.supportChatScreen) {
      Get.toNamed(AppRoutes.supportChatScreen);
      return;
    }  else
    if (
        (typeId.toString().trim() == constNotifyChat)) {
      _navigateToChatScreen(
        id: int.tryParse(detail['created_by_id'].toString()) ?? 0,
        name: detail['full_name'],
        profilePicUrl: detail['image_file'],
        model_id: int.tryParse(detail['model_id'].toString()) ?? 0,
        to_user_id: int.tryParse(detail['to_user_id'].toString()) ?? 0,
      );
      return;
    }
    switch (typeId) {
         case constNotifyOrderConfirmed:
      case constNotifyOrderRejected:
      case constNotifyOrderPickedUp:
      case constNotifyOrderPlaced:
      case constNotifyOrderDelivered:
      case constNotifyOrderReady:
     /* case constNotifyNewDriverAccepted:
        _navigateToCustomerOrderDetails(modelId);
        break;

      case constNotifyReadyToDispatch:
        _navigateToCustomerCourierDetails(detail['model_id']);
        break;*/

      // case constNotifyOrderPlaced:
      //   _navigateToChatScreen(
      //     id: detail['created_by_id'],
      //     name: detail['full_name'],
      //     profilePicUrl: detail['image_file'],
      //     model_id: detail['model_id'],
      //     to_user_id: detail['to_user_id'],
      //   );
      //   break;

    /*  case constNotifyPostLike:
        _navigateToPostDetailScreen(postId: detail['model_id']);
        break;
      case constNotifyPostComment:
        _navigateToPostDetailScreen(postId: detail['model_id']);
        break;*/

      default:
        // Get.toNamed(AppRoutes.notificationRoute);
        break;
    }
  }

 /* void _navigateToCustomerOrderDetails(dynamic orderId,
      {bool goToDeliveredScreen = false}) async
  {
    if (orderId == null) {
      return;
    }
    orderId = int.parse(orderId);

    debugPrint('orderId1---->${orderId}');
    if (Get.isRegistered<OrderDetailController>()) {
      Get.find<OrderDetailController>().orderId = orderId;
      Get.find<OrderDetailController>().loadOrderDetails(showLoader: false);
    }

    if (Get.currentRoute == AppRoutes.customerMainScreen) {
      if (Get.isRegistered<CustomerMainController>()) {
        Get.find<CustomerMainController>().updateBottomNavIndex(3);
        if (Get.isRegistered<CustomerOrdersController>()) {
          if (goToDeliveredScreen) {
            Get.find<CustomerOrdersController>().selectedTab.value = 1;
          }
          await Get.toNamed(
              goToDeliveredScreen
                  ? AppRoutes.orderDeliveredRoute
                  : AppRoutes.orderDetailsScreen,
              arguments: {idKey: orderId});

          Get.find<CustomerOrdersController>().pageNumber = 0;
          Get.find<CustomerOrdersController>().loadOrders();
        }
      }
      return;
    } else {
      if (Get.isRegistered<CustomerMainController>()) {
        Get.find<CustomerMainController>().updateBottomNavIndex(3);
        if (Get.isRegistered<CustomerOrdersController>()) {
          if (goToDeliveredScreen) {
            Get.find<CustomerOrdersController>().selectedTab.value = 1;
          }
          await Get.toNamed(
              goToDeliveredScreen
                  ? AppRoutes.orderDeliveredRoute
                  : AppRoutes.orderDetailsScreen,
              arguments: {idKey: orderId});

          Get.find<CustomerOrdersController>().pageNumber = 0;
          Get.find<CustomerOrdersController>().loadOrders();
        }
      }
    }
  }*/

 /* void _navigateToCustomerCourierDetails(int? orderId) async {
    if (Get.currentRoute == AppRoutes.legRunningOrderDetailsScreen) {
      if (Get.isRegistered<LegRunningOrderDetailsController>()) {
        Get.find<LegRunningOrderDetailsController>().loadCourierDetails();
      }
      return;
    } else {
      Get.toNamed(AppRoutes.legRunningOrderDetailsScreen,
          arguments: {idKey: orderId});
      if (Get.isRegistered<LegRunningOrderDetailsController>()) {
        Get.find<LegRunningOrderDetailsController>().loadCourierDetails();
      }
    }
  }*/

  void _navigateToChatScreen({
    dynamic? id,
    dynamic name,
    dynamic profilePicUrl,
    dynamic model_id,
    dynamic to_user_id,
  }) {
    if (Get.currentRoute == AppRoutes.chatRoute) {

    } else {
      Get.toNamed(AppRoutes.chatRoute, arguments: {
        argUserNameId: id,
        argUserName: name,
        argUserProfile: profilePicUrl,
        argOrderId: model_id,
        customerIdKey: to_user_id,
        driverIdKey: id,
        isDriverKey: true,
      });
    }
  }

/*  void _navigateToPostDetailScreen({int? postId}) async {
    if (Get.currentRoute == AppRoutes.postDetailScreen ||
        Get.currentRoute == AppRoutes.lifeNeedsCommentScreen) {
      if (Get.isRegistered<PostDetailController>()) {
        Get.find<PostDetailController>().postId = postId;
        Get.find<PostDetailController>().loadPostDetail();
      }
      if (Get.isRegistered<LifeNeedsCommentController>()) {
        Get.find<LifeNeedsCommentController>().postId = postId;
        Get.find<LifeNeedsCommentController>().pageNumber = 0;
        Get.find<LifeNeedsCommentController>().loadComments();
      }
      return;
    } else {
      await Get.toNamed(AppRoutes.postDetailScreen, arguments: {idKey: postId});
      if (Get.isRegistered<MyPostsController>()) {
        Get.find<MyPostsController>().selectedTab.value = 0;
        Get.find<MyPostsController>().loadMyPosts();
      }
      // if (Get.isRegistered<LifeNeedsProfileController>()) {
      //   Get.find<LifeNeedsProfileController>().selectedTab.value = 0;
      //   Get.find<LifeNeedsProfileController>().loadUserDataAndPosts();
      // }
    }
  }*/
}
//remove no data found