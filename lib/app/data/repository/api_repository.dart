/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'dart:developer' as dev;

import 'package:base_project/app/core/base/location_manager.dart';
import 'package:base_project/app/export.dart' hide Links, Meta;
// import 'package:base_project/app/modules/loyality_points/LoyaltyPointResponceModel.dart';
// import 'package:base_project/app/modules/wallet/models/addMoneyResponceModel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../modules/chat/controllers/chat_controller.dart';
// import '../../modules/customer/home/model/AdvertisementModel.dart';
// import '../../modules/customer/home/model/DriverLocationResponceModel.dart';
// import '../../modules/customer/home/model/OfferResponseModel.dart';
// import '../../modules/customer/home/model/response_model/ads_menu_model.dart';
// import '../../modules/wallet/models/WalletListResponceModel.dart';

class APIRepository {
  static late DioClient? dioClient;
  var deviceName, deviceType, deviceID, deviceVersion;

  APIRepository() {
    var dio = Dio();
    dioClient = DioClient(baseUrl, dio);
    getDeviceData();
  }

  getDeviceData() async {
    DeviceInfoPlugin info = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await info.androidInfo;
      deviceName = androidDeviceInfo.model;
      deviceID = androidDeviceInfo.id;
      deviceVersion = androidDeviceInfo.version.release;
      deviceType = "1";
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await info.iosInfo;
      deviceName = iosDeviceInfo.model;
      deviceID = iosDeviceInfo.identifierForVendor;
      deviceVersion = iosDeviceInfo.systemVersion;
      deviceType = "2";
    }
  }

  //*===================================================================== Report Any crashes or errors to logger API Call  ==========================================================*
  Future<MessageResponseModel?> reportCrashLogApiCall({data}) async {
    try {
      final res = await dioClient!
          .post("$baseUrl/log/exception", data: FormData.fromMap(data));
      var response = res.data;
      return MessageResponseModel.fromJson(response);
    } catch (e, st) {
      return null;
    }
  }

  static Future registerUsers(Map<String, dynamic> data) async {
    try {
      final response = await dioClient?.post(signUpEndPoint,
          skipAuth: true, data: FormData.fromMap(data));
      return UserResponseModel.fromJson(response);
    } catch (e, st) {
      debugPrint(e.toString());
      return Future.error(
          NetworkExceptions.getDioException(e, st, signUpEndPoint));
    }
  }

  Future verifyOtp(Map<String, dynamic> data) async {
    try {
      final response = await dioClient?.post(verifyOtpEndPoint,
          data: FormData.fromMap(data));
      return UserResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, verifyOtpEndPoint));
    }
  }

  Future loginUserApi(Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient?.post(loginEndPoint, data: FormData.fromMap(data));
      return UserResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, loginEndPoint));
    }
  }

  Future socialLoginUserApi(Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient?.post(socialLoginUrl, data: FormData.fromMap(data));
      return UserResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, socialLoginUrl));
    }
  }

  Future forgetPasswordApiCall(Map<String, dynamic> data) async {
    try {
      final response = await dioClient?.post(forgetPasswordEndPoint,
          data: FormData.fromMap(data));
      return UserResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, forgetPasswordEndPoint));
    }
  }

  Future resendOtpApiCall(Map<String, dynamic> data) async {
    try {
      final response = await dioClient?.post(resendOtpEndPoint,
          data: FormData.fromMap(data));
      return UserResponseModel.fromJson(response);
    } catch (e, st) {
      Future.error(NetworkExceptions.getDioException(e, st, resendOtpEndPoint));
    }
  }

  Future resetPasswordApiCall(Map<String, dynamic> data) async {
    try {
      final response = await dioClient?.post(userResetPassword,
          data: FormData.fromMap(data));
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      Future.error(NetworkExceptions.getDioException(e, st, userResetPassword));
    }
  }

  Future addRestaurantApiCall(Map<String, dynamic> data) async {
    try {
      final response = await dioClient?.post(addRestaurantEndPoint,
          data: FormData.fromMap(data), skipAuth: false);
      return RestStoreResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, addRestaurantEndPoint));
    }
  }

  /*====================================================================== update Profile  ============================================*/

  static Future profileSetupApiCall({required dataBody}) async {
    try {
      final response = await dioClient!.post(
        profileSetupEndPoint,
        data: FormData.fromMap(dataBody),
        skipAuth: false,
      );
      return UserResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, profileSetupEndPoint));
    }
  }

  Future updateRestaurantApiCall(Map<String, dynamic> data, int? id) async {
    try {
      final response = await dioClient?.post(addRestaurantEndPoint,
          data: FormData.fromMap(data),
          skipAuth: false,
          queryParameters: {idKey: id});
      return RestStoreResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, addRestaurantEndPoint));
    }
  }

  Future deleteImageApiCall(int? id) async {
    try {
      final response = await dioClient?.post(deleteImageEndPoint,
          skipAuth: false, queryParameters: {idKey: id});
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, deleteImageEndPoint));
    }
  }

  Future deleteDocsApiCall(int? id) async {
    try {
      final response = await dioClient?.post(deleteDocsEndPoint,
          skipAuth: false, queryParameters: {idKey: id});
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, deleteDocsEndPoint));
    }
  }

  Future restaurantDetailsApiCall(id) async {
    try {
      final response = await dioClient?.get(restaurantDetailsEndPoint,
          queryParameters: {idKey: id}, skipAuth: false);
      debugPrint('restaurantDetailsEndPoint---->${response}');
      return RestStoreResponseModel.fromJson(response);
    } catch (e, st) {
      debugPrint('restaurantDetailsEndPoint--->$e>>$st');
      return Future.error(
          NetworkExceptions.getDioException(e, st, restaurantDetailsEndPoint));
    }
  }

  Future changePasswordApiCall(Map<String, dynamic> data,
      {bool fromForgetPassword = false}) async {
    try {
      final response = await dioClient?.post(
          fromForgetPassword == true
              ? userResetPassword
              : changePasswordEndPoint,
          data: FormData.fromMap(data),
          skipAuth: fromForgetPassword == true ? true : false);
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(NetworkExceptions.getDioException(
          e,
          st,
          fromForgetPassword == true
              ? userResetPassword
              : changePasswordEndPoint));
    }
  }

  Future checkUserApiCall() async {
    try {
      final response = await dioClient?.get(userCheckEndPoint, skipAuth: false);
      return UserResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, userCheckEndPoint));
    }
  }

  Future logOutApiCall() async {
    try {
      final response =
          await dioClient?.get(userLogOutEndPoint, skipAuth: false);
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, userLogOutEndPoint));
    }
  }

  Future uploadVehicleDetail(Map<String, dynamic> data, {int? id}) async {
    //id for updating vehicle
    try {
      final response = await dioClient?.post(addVehicleDetailEndPoint,
          skipAuth: false,
          data: FormData.fromMap(data),
          queryParameters: id != null ? {idKey: id} : null);
      return VehicleResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, addVehicleDetailEndPoint));
    }
  }

  Future uploadProfileApiCall(Map<String, dynamic> data) async {
    try {
      final response = await dioClient?.post(userProfileUpdateEndPoint,
          skipAuth: false, data: FormData.fromMap(data));
      return UserResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, userProfileUpdateEndPoint));
    }
  }

  Future getStaticPageApiCall(int? type) async {
    try {
      final response = await dioClient?.get(statePageEndPoint,
          skipAuth: true, queryParameters: {typeKey: type});
      return StaticPageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, statePageEndPoint));
    }
  }

  Future getFAQApiCall() async {
    try {
      final response = await dioClient?.get(faqEndPoint, skipAuth: false);
      dev.log(jsonEncode(response));
      return FaqResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, faqEndPoint));
    }
  }

  Future contactUsApiCall({required Map<String, dynamic> data}) async {
    try {
      final response = await dioClient?.post(conatctUsEndPoint,
          data: FormData.fromMap(data), skipAuth: false);
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, conatctUsEndPoint));
    }
  }

  Future uploadDriverDocsApiCall(Map<String, dynamic> data, {int? id}) async {
    //id for updating vehicle
    try {
      final response = await dioClient?.post(userUploadDocEndPoint,
          skipAuth: false,
          data: FormData.fromMap(data),
          queryParameters: id != null
              ? {idKey: id, accessTokenKey: preferenceManger.getAuthToken()}
              : null);
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, userUploadDocEndPoint));
    }
  }

  Future cuisineTypesApiCall() async {
    try {
      final response =
          await dioClient?.get(cuisineTypesEndPoint, skipAuth: false);
      return CommonItemsResponseModel.fromJson(response);
    } catch (e, st) {
      debugPrint("error-> $e $st");
      return Future.error(
          NetworkExceptions.getDioException(e, st, cuisineTypesEndPoint));
    }
  }

  Future restaurantCategoriesListApiCall({page, id}) async {
    try {
      var response;
      if (id != null) {
        response = await dioClient?.get(menuItemCategoriesEndPoint,
            skipAuth: false,
            queryParameters: {pageKey: page, restaurantIdKey: id});
      } else {
        response = await dioClient?.get(menuItemCategoriesEndPoint,
            skipAuth: false, queryParameters: {pageKey: page});
      }
      return CommonItemsResponseModel.fromJson(response);
    } catch (e, st) {
      debugPrint('error  menuItemCategoriesEndPoint->$e,$st');
      return Future.error(
          NetworkExceptions.getDioException(e, st, menuItemCategoriesEndPoint));
    }
  }


  Future storeCategoriesListApiCall() async {
    try {
      final response =
          await dioClient?.get(storeItemCategoriesEndPoint, skipAuth: false);
      return CommonItemsResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(NetworkExceptions.getDioException(
          e, st, storeItemCategoriesEndPoint));
    }
  }

  Future unitsListApiCall() async {
    try {
      final response = await dioClient?.get(unitsEndPoint, skipAuth: false);
      return CommonItemsResponseModel.fromJson(response);
    } catch (e, st) {
      debugPrint("error-> $e $st");
      return Future.error(
          NetworkExceptions.getDioException(e, st, unitsEndPoint));
    }
  }

  Future addPlateApiCall(Map<String, dynamic> data, {int? id}) async {
    try {
      final response = await dioClient?.post(addPlateEndPoint,
          data: FormData.fromMap(data),
          skipAuth: false,
          queryParameters: id != null ? {idKey: id} : null);
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, addPlateEndPoint));
    }
  }

  Future addRecentSearchHistoryApiCall(Map<String, dynamic> data,
      {int? id}) async {
    try {
      final response = await dioClient?.post(addRecentSearchHistory,
          data: FormData.fromMap(data),
          skipAuth: false,
          queryParameters: id != null ? {idKey: id} : null);
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, addRecentSearchHistory));
    }
  }

  Future addPlateItemApiCall(Map<String, dynamic> data, {int? id}) async {
    try {
      final response = await dioClient?.post(addPlateItemEndPoint,
          data: FormData.fromMap(data),
          skipAuth: false,
          queryParameters: id != null ? {idKey: id} : null);
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, addPlateItemEndPoint));
    }
  }

  Future addCouponApiCall(Map<String, dynamic> data, {int? id}) async {
    try {
      final response = await dioClient?.post(addCouponEndPoint,
          data: FormData.fromMap(data),
          skipAuth: false,
          queryParameters: id != null ? {idKey: id} : null);
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, addCouponEndPoint));
    }
  }



  Future couponDeleteApiCall(int? id) async {
    try {
      final response = await dioClient?.post(couponsDeleteEndPoint,
          skipAuth: false, queryParameters: {idKey: id});
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, couponsDeleteEndPoint));
    }
  }





  Future addToCartApiCall(Map<String, dynamic> data, {int? id}) async {
    try {
      final response = await dioClient?.post(addToCartEndPoint,
          data: FormData.fromMap(data),
          skipAuth: false,
          queryParameters: id != null ? {idKey: id} : null);
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, addToCartEndPoint));
    }
  }



  Future updateCartItemApiCall({int? id, int? quantity}) async {
    try {
      final response = await dioClient?.post(updateCartQuantityEndPoint,
          skipAuth: false, queryParameters: {idKey: id, quantityKey: quantity});
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, updateCartQuantityEndPoint));
    }
  }

  Future deleteCartItemsApiCall({int? id}) async {
    // id==null to delete complete cart items
    try {
      final response = await dioClient?.post(deleteCartItemEndPoint,
          skipAuth: false, queryParameters: id != null ? {idKey: id} : null);
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, deleteCartItemEndPoint));
    }
  }



  Future createOrderApiCall(Map<String, dynamic> data) async {
    try {
      final response = await dioClient?.post(createOrderEndPoint,
          data: FormData.fromMap(data), skipAuth: false);
      debugPrint('responseresponseresponse-->>>>>$response');
      if (response['message'] ==
          "Wallet amount is insufficient for this order.") {
        Get.snackbar('Alert', response['message']);
      } else {
        return CommonMessageResponseModel.fromJson(response);
      }
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, createOrderEndPoint));
    }
  }

  //*===================================================================== Date Check API Call  ==========================================================*
  Future dateCheckApiCall() async {
    try {
      final response = await dioClient!.get(
        dateCheckEndPoint,
        skipAuth: true,
      );
      return MessageResponseModel.fromJson(response);
    } catch (e, stack) {
      debugPrint('date_check- error->$e,$stack');
      return Future.error(
          NetworkExceptions.getDioException(e, stack, dateCheckEndPoint));
    }
  }

  Future reOrderApiCall({int? orderId}) async {
    try {
      final response = await dioClient?.post(reOrderEndPoint,
          skipAuth: false, queryParameters: {idKey: orderId});
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, reOrderEndPoint));
    }
  }



  Future changeOrderStateApiCall(Map<String, dynamic> data) async {
    try {
      final response = await dioClient?.post(changeOrderStateEndPoint,
          data: FormData.fromMap(data), skipAuth: false);
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, changeOrderStateEndPoint));
    }
  }







  Future changeDriverStateApiCall({int? state, int? orderId}) async {
    try {
      final response = await dioClient?.post(changeDriverStateEndPoint,
          queryParameters: {idKey: orderId, stateKey: state}, skipAuth: false);
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, changeDriverStateEndPoint));
    }
  }

  /*===================================================================== fav API Call  ==========================================================*/







  /*===================================================================== video Tut API Call  ==========================================================*/





  Future buyCourseApiCall(Map<String, dynamic> dataBody) async {
    try {
      final response = await dioClient!.post(buyCourseEndPoint,
          data: FormData.fromMap(dataBody), skipAuth: false);
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, buyCourseEndPoint));
    }
  }

  Future currentWatchingVideoApiCall(Map<String, dynamic> dataBody) async {
    try {
      final response = await dioClient!.post(setCurrentWatchingEndPoint,
          data: FormData.fromMap(dataBody), skipAuth: false, isLoading: false);
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, setCurrentWatchingEndPoint));
    }
  }

  Future setWatchedDurationApiCall(
      Map<String, dynamic> dataBody, int? lessonId) async {
    try {
      final response = await dioClient!.post(setWatchDurationEndPoint,
          data: FormData.fromMap(dataBody),
          skipAuth: false,
          isLoading: false,
          queryParameters: {idKey: lessonId});
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, setWatchDurationEndPoint));
    }
  }

  Future markVideoCompletedApiCall(int? lessonId) async {
    try {
      final response = await dioClient!.post(markLessonCompleteEndPoint,
          skipAuth: false,
          queryParameters: {idKey: lessonId},
          isLoading: false);
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, markLessonCompleteEndPoint));
    }
  }

  /*===================================================================== login API Call  ==========================================================*/
  Future addAddressApiCall({Map<String, dynamic>? dataBody, recordId}) async {
    try {
      final response = await dioClient!.post(
          queryParameters: {recordIdKey: recordId},
          addAddressEndPoint,
          data: FormData.fromMap(dataBody!),
          skipAuth: false);
      return ResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, addAddressEndPoint));
    }
  }



  Future deleteAddressApiCall({
    Map<String, dynamic>? dataBody,
  }) async {
    try {
      final response = await dioClient!.get(deleteAddressEndPoint,
          queryParameters: dataBody, skipAuth: false);
      return ResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, deleteAddressEndPoint));
    }
  }

  Future setDefaultAddressApiCall({int? addressId}) async {
    try {
      final response = await dioClient!.post(setDefaultAddressEndPoint,
          queryParameters: {addressIdKey: addressId}, skipAuth: false);
      return ResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, setDefaultAddressEndPoint));
    }
  }








  Future postCategoryListApiCall() async {
    try {
      final response =
          await dioClient?.get(postCategoriesEndPoint, skipAuth: false);
      return CommonItemsResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, postCategoriesEndPoint));
    }
  }

  Future uploadPostApiCall(
      {required Map<String, dynamic> data, int? id}) async {
    try {
      final response = await dioClient?.post(postUploadEndPoint,
          data: FormData.fromMap(data),
          skipAuth: false,
          queryParameters: {idKey: id});
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, postUploadEndPoint));
    }
  }







  Future addCommentApiCall(
      {required Map<String, dynamic> data, required int? postId}) async {
    try {
      final response = await dioClient?.post(addCommentEndPoint,
          data: FormData.fromMap(data),
          skipAuth: false,
          queryParameters: {idKey: postId});
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, addCommentEndPoint));
    }
  }


  Future deletePostApiCall(int? id) async {
    try {
      final response = await dioClient?.post(deletePostEndPoint,
          skipAuth: false, queryParameters: {idKey: id});
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, deletePostEndPoint));
    }
  }

  Future userProfilePostsApiCall(int? userid) async {
    try {
      final response = await dioClient?.get(userProfileAndPostsEndPoint,
          skipAuth: false, queryParameters: {idKey: userid});
      return UserResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(NetworkExceptions.getDioException(
          e, st, userProfileAndPostsEndPoint));
    }
  }


  Future makeCourierPaymentApiCall(int? courierId) async {
    try {
      final response = await dioClient?.post(makeCourierPaymentEndPoint,
          skipAuth: false, queryParameters: {idKey: courierId});
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, makeCourierPaymentEndPoint));
    }
  }



  Future markShowDispatchButton({int? orderId}) async {
    try {
      final response = await dioClient?.post(showDispatchButtonEndPoint,
          queryParameters: {idKey: orderId}, skipAuth: false);
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, showDispatchButtonEndPoint));
    }
  }

  Future setDriverCurrentLocation(
      {double? lat, double? long, var address}) async {
    try {
      final response = await dioClient?.post(setDriverCurrentLocEndPoint,
          queryParameters: {latKey: lat, lngKey: long, 'address': address},
          skipAuth: false);
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(NetworkExceptions.getDioException(
          e, st, setDriverCurrentLocEndPoint));
    }
  }





  Future addCardApiCall({Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient?.post(
        addCardEndPoint,
        data: FormData.fromMap(dataBody!),
        skipAuth: false,
      );
      return MessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, addCardEndPoint));
    }
  }

  Future addAccountApiCall({Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient?.post(
        addAccountEndPoint,
        data: FormData.fromMap(dataBody!),
        skipAuth: false,
      );
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, addAccountEndPoint));
    }
  }

  Future deletePaymentCardApiCall(cardId) async {
    try {
      final response = await dioClient!.post(deleteCardEndPoint,
          skipAuth: false, queryParameters: {cardIdKey: cardId});
      return MessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, deleteCardEndPoint));
    }
  }

  /*======================================================== load chat api call   =============================================================*/

  Future loadChatApiCall({userId, orderID}) async {
    try {
      final response = await dioClient?.get(
        loadChatEndPoint,
        queryParameters: {'from_id': userId, "request_id": orderID},
        skipAuth: false,
      );
      return LoadChatResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, loadChatEndPoint));
    }
  }

  /*======================================================== load chat api call   =============================================================*/
  Future loadNewMessageApiCall({userId, orderID}) async {
    try {
      final response = await dioClient?.get(
        loadNewMessageApiUrl,
        queryParameters: {'from_id': userId, "request_id": orderID},
        skipAuth: false,
      );
      return LoadChatResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, loadChatEndPoint));
    }
  }




  Future cartItemTotalPrize({dynamic page, dynamic restaurantId}) async {
    try {
      final response = await dioClient?.get(
        totalPriceApiUrl,
        skipAuth: false,
      );
      debugPrint('totalPriceApiUrl---->${response['total_price']}');
      return response['total_price'];
    } catch (e, st) {
      debugPrint('bestSellingItemsApiUrl--->${e}>>$st');
      return Future.error(
          NetworkExceptions.getDioException(e, st, loadChatEndPoint));
    }
  }

  /*======================================================== chat list api call   =============================================================*/

  Future chatListApiCall({page}) async {
    try {
      final response = await dioClient?.get(
        chatListEndPoint,
        queryParameters: {
          'page': page,
        },
        skipAuth: false,
      );
      return ChatListResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, chatListEndPoint));
    }
  }

  /*======================================================== send message api call   =============================================================*/

  Future sendMessageApiCall({Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient?.post(sendMessageEndPoint,
          data: FormData.fromMap(dataBody!), skipAuth: false, isLoading: false);
      return response;
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, sendMessageEndPoint));
    }
  }

  /*======================================================== chat list api call   =============================================================*/

  // Future ratingsListApiCall({page, int? restId}) async {
  //   //sending rest id to load rest ratings
  //   try {
  //     final response = await dioClient?.get(
  //       ratingsListEndPoint,
  //       queryParameters: {pageKey: page, idKey: restId},
  //       skipAuth: false,
  //     );
  //     return RatingsListResponseModel.fromJson(response);
  //   } catch (e, st) {
  //     return Future.error(
  //         NetworkExceptions.getDioException(e, st, ratingsListEndPoint));
  //   }
  // }



  /*======================================================== send message api call   =============================================================*/

  Future addRatingApiCall({Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient?.post(addRatingsEndPoint,
          data: FormData.fromMap(dataBody!), skipAuth: false);
      return CommonMessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, addRatingsEndPoint));
    }
  }

  //*======================================================== notification list api call   =============================================================*
  static Future notificationListCall({page}) async {
    try {
      final response = await dioClient!.get(notificationsListEndPoint,
          queryParameters: {pageKey: page}, skipAuth: false);
      return NotificationListResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, notificationsListEndPoint));
    }
  }

  //*======================================================== clear all notification api call   =============================================================*

  static Future clearAllNotificationCall() async {
    try {
      final response =
          await dioClient!.get(clearAllNotificationsEndPoint, skipAuth: false);
      return MessageResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(NetworkExceptions.getDioException(
          e, st, clearAllNotificationsEndPoint));
    }
  }

  Future switchNotificationsOnOff() async {
    try {
      final response = await dioClient?.post(
        notificationToggleEndPoint,
        skipAuth: false,
      );
      return UserResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, notificationToggleEndPoint));
    }
  }


}

reportCrash(error, stackTrace) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String version = packageInfo.version;
  CustomLoader customLoader = CustomLoader();
  var req = AuthRequestModel.logCrashErrorReq(
      error: packageInfo.packageName,
      packageVersion: version,
      phoneModel: Get.find<APIRepository>().deviceName ?? "",
      ip: Get.find<APIRepository>().deviceVersion ?? "",
      stackTrace: error.toString() + stackTrace.toString());

  await APIRepository().reportCrashLogApiCall(data: req).then((value) async {
    customLoader.hide();
    if (value != null) {}
  }).onError((error, stackTrace) {
    customLoader.hide();
    initApp();
    debugPrint(error.toString());
  });
}


class CommonItemsResponseModel {
  List<CommonItemModel>? list;
  Links? lLinks;
  Meta? mMeta;
  String? copyrighths;

  CommonItemsResponseModel(
      {this.list, this.lLinks, this.mMeta, this.copyrighths});

  CommonItemsResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <CommonItemModel>[];
      json['list'].forEach((v) {
        list!.add(new CommonItemModel.fromJson(v));
      });
    }
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    mMeta = json['_meta'] != null ? new Meta.fromJson(json['_meta']) : null;
    copyrighths = json['copyrighths'];
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
    data['copyrighths'] = this.copyrighths;
    return data;
  }
}
