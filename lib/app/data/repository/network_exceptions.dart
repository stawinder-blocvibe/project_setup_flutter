/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:base_project/app/export.dart';

import '../../core/values/app_strings.dart';

class NetworkExceptions {
  static String messageData = "";

  static getDioException(error, stackTrace, endPoint) {
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              return messageData = strRequestCancelled;
            case DioExceptionType.connectionTimeout:
              return messageData = strConnectionTimeOut;
            case DioExceptionType.unknown:
              Get.find<PreferenceManger>().clearLoginData();
              List<String>? dateParts = error.message?.split(":");
              List<String> message = dateParts![2].split(",");

              if (message[0].trim() == strConnectionRefused) {
                return messageData = strServerUnderMaintance;
              } else if (message[0].trim() == strNetworkUnReachable) {
                return messageData = strNetworkUnReachable;
              } else if (dateParts[1].trim() == strFalidToHostLookup) {
                return messageData = strNoInternetConnection;
              } else {
                return messageData = dateParts[1];
              }
            case DioExceptionType.receiveTimeout:
              return messageData = strTimeOut;
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case 400:
                  Map<String, dynamic> data = error.response?.data;
                  if (data.values.elementAt(0).runtimeType == String) {
                    reportCrash(
                        "'Error message : ${data.values.elementAt(0)}.'" +
                            "\n" +
                            "Api url: ${baseUrl + endPoint}" +
                            "\n" +
                            error.toString(),
                        stackTrace);
                    return messageData = data.values.elementAt(0);
                  } else {
                    Map<String, dynamic> datas = data.values.elementAt(0);
                    if (data.values.elementAt(0) == null) {
                      var dataValue =
                          MessageResponseModel.fromJson(error.response?.data)
                              .message;
                      reportCrash(
                          "'Error message : $dataValue.'" +
                              "\n" +
                              "Api url: ${baseUrl + endPoint}" +
                              "\n" +
                              error.toString(),
                          stackTrace);
                      return dataValue == null
                          ? messageData = strUnauthorizedRequest
                          : messageData = dataValue;
                    } else {
                      reportCrash(
                          "'Error message : ${datas.values.first[0]}.'" +
                              "\n" +
                              "Api url: ${baseUrl + endPoint}" +
                              "\n" +
                              error.toString(),
                          stackTrace);
                      return messageData = datas.values.first[0];
                    }
                  }
                case 401:
                  Get.find<PreferenceManger>().clearLoginData();
                  try {
                    messageData = error.response?.data['message'] ??
                        strUnauthorizeException;
                    _crashReport(
                        messageData: messageData,
                        error: error,
                        endPoint: endPoint,
                        stackTrace: stackTrace);
                    return messageData = error.response?.data['message'] ??
                        strUnauthorizeException;
                  } catch (err) {
                    messageData = strUnauthorizeException;
                    _crashReport(
                        messageData: messageData,
                        error: error,
                        endPoint: endPoint,
                        stackTrace: stackTrace);
                    return messageData = strUnauthorizeException;
                  }
                case 403:
                  PreferenceManger().clearLoginData();
                  Get.offAllNamed(AppRoutes.loginRoute);
                  messageData = error.response?.data['message'] ?? strForbidden;
                  _crashReport(
                      messageData: messageData,
                      error: error,
                      endPoint: endPoint,
                      stackTrace: stackTrace);
                  return "Session expired";
                case 404:
                  return messageData = strNotFound;
                case 408:
                  messageData = strRequestTimeOut;
                  _crashReport(
                      messageData: messageData,
                      error: error,
                      endPoint: endPoint,
                      stackTrace: stackTrace);
                  return messageData;
                case 500:
                  messageData = strInternalServerError;
                  _crashReport(
                      messageData: messageData,
                      error: error,
                      endPoint: endPoint,
                      stackTrace: stackTrace);
                  return messageData;
                case 503:
                  messageData = strServiceUnavailable;
                  _crashReport(
                      messageData: messageData,
                      error: error,
                      endPoint: endPoint,
                      stackTrace: stackTrace);
                  return messageData;
                default:
                  return messageData = strSomethingWorg;
              }
            case DioErrorType.sendTimeout:
              return messageData = strTimeOut;
            case DioErrorType.badCertificate:
              return messageData = strBadCertificate;
            case DioErrorType.connectionError:
              return messageData = strConnectionError;
          }
        } else if (error is SocketException) {
          return messageData = strSocketExceptions;
        } else {
          return messageData = strUnExceptedExption;
        }
      } on FormatException catch (_) {
        return messageData = strFormetException;
      } catch (_) {
        return messageData = strUnExceptedExption;
      }
    } else {
      return error.toString().contains(strNotSubType)
          ? messageData = strUnableToProcessData
          : messageData = strUnExceptedExption;
    }
  }
}

_crashReport({messageData, error, endPoint, stackTrace}) {
  reportCrash(
      "Error message :$messageData" +
          "\n" +
          "API url: ${baseUrl + endPoint}" +
          "\n" +
          error.toString(),
      stackTrace);
}
