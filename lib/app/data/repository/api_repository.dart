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

}
