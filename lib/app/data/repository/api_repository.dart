/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'dart:developer' as dev;


import 'package:get/get_connect/http/src/multipart/form_data.dart' hide FormData;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../presentation/modules/authentication/models/response_models/user_data_model.dart';

import '../../export.dart';
import 'endpoint.dart';
import 'network_exceptions.dart';

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





  /// New Api Calls

  Future sendOtpApi({phone}) async {

    try {
      final response = await dioClient!.post(
          sendOtpEndPoint,
          data: {
            "phone": phone
          },
      );

      return response;
      // return ResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, sendOtpEndPoint));
    }
  }

  Future verifyOtpApi({phone,otp}) async {
    try {
      final response = await dioClient!.post(
          verifyOtpEndPoint,
          data: {
            "phone": phone,
            "otp": otp
          },
          skipAuth: false);

      return response;
      // return ResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, verifyOtpEndPoint));
    }
  }

  Future completeTransactionApi({userId,amount,type,gatewayTransectionId}) async {
    try {
      final response = await dioClient!.post(
          addPaymentEndPoint,
          data: {
            "userId": userId,
            "amount": amount,
            "type": type,
            // "matchId": matchId,
            "gatewayTransectionId": gatewayTransectionId,
            // "poolId": poolId,
          },
          skipAuth: false);

      return response;
      // return ResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, addPaymentEndPoint));
    }
  }
  Future joinPoolApi({userId,poolId,matchId}) async {
    try {
      final response = await dioClient!.post(
          joinPoolEndPoint,
          data: {
            "userId": userId??"68455ea965ad4b0de2683243",
            "poolId": poolId??"12517",
            "matchId": matchId??"68457bcc25a67b5e80a8d8f6"
          },
          skipAuth: false);

      return response;
      // return ResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, joinPoolEndPoint));
    }
  }


  /// to heavy payload
  Future saveUserPredictionApi({userId,poolId,matchId}) async {
    try {
      final response = await dioClient!.post(
          saveUserPredictionEndPoint,
          data: {
            "userId": userId??"68455ea965ad4b0de2683243",
            "poolId": poolId??"12517",
            "matchId": matchId??"68457bcc25a67b5e80a8d8f6"
          },
          skipAuth: false);

      return response;
      // return ResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, saveUserPredictionEndPoint));
    }
  }

  Future homeScreenApi() async {
    try {
      final response = await dioClient!.get(
          homeEndPoint,
          skipAuth: false);

      return response;
      // return ResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, homeEndPoint));
    }
  }

  Future poolDetailApi({matchId}) async {
    try {
      final response = await dioClient!.get(
          poolDetailsPoint,
          queryParameters: {
            "matchId":matchId
          },
          skipAuth: false);

      return response;
      // return ResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, poolDetailsPoint));
    }
  }

  Future walletDetailApi({userId}) async {
    try {
      final response = await dioClient!.get(
          walletDetailsPoint,
          queryParameters: {
            "userId":userId
          },
          skipAuth: false);

      return response;
      // return ResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, walletDetailsPoint));
    }
  }

  Future transactionDetailApi({userId}) async {
    try {
      final response = await dioClient!.get(
          userTransactionEndPoint,
          queryParameters: {
            "userId":userId
          },
          skipAuth: false);

      return response;
      // return ResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, walletDetailsPoint));
    }
  }
  Future allPredictionApi({userId}) async {
    try {
      final response = await dioClient!.get(
          allPredictionEndPoint,
          queryParameters: {
            "userId":userId
          },
          skipAuth: false);

      return response;
      // return ResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, allPredictionEndPoint));
    }
  }

  Future getUsersMatchPredictionApi({userId,matchId,poolId}) async {
    try {
      final response = await dioClient!.get(
          getUsersMatchPredictionEndPoint,
          queryParameters: {
            "userId":userId,
            "matchId":matchId,
            "poolId":poolId
          },
          skipAuth: false);

      return response;
      // return ResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, getUsersMatchPredictionEndPoint));
    }
  }

}
