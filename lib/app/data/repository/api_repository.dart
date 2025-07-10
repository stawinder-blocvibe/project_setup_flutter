  

import 'dart:developer' as dev;


import 'package:base_project/presentation/modules/home/models/live_score_model.dart';
import 'package:base_project/presentation/modules/home/models/slot_cell.dart';
import 'package:base_project/presentation/modules/home/models/transaction_model.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart' hide FormData;
import 'package:get/get_connect/http/src/request/request.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:win32/winsock2.dart';

import '../../../presentation/modules/authentication/models/response_models/user_data_model.dart';

import '../../../presentation/modules/home/models/match_prediction_model.dart';
import '../../../presentation/modules/home/models/over_model.dart';
import '../../export.dart';
import 'cricket_api_client.dart';
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

  Future completeTransactionApi({userId,amount,type,gatewayTransectionId,matchId}) async {
    try {
      if(amount <1 || amount == null ) {
        return;
      }
      final response = await dioClient!.post(
          addPaymentEndPoint,
          data: {
            "userId": userId,
            "amount": amount,
            "type": type,
            "matchId": matchId,
            "gatewayTransectionId": gatewayTransectionId,
            // "poolId": poolId,
          },
          skipAuth: false);

      debugPrint("addPaymentEndPoint===>${response}");
      return response;
      // return ResponseModel.fromJson(response);
    } catch (e, st) {
      debugPrint("addPaymentEndPoint===>Error${e}>>$st");
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
  Future saveUserPredictionApi({userId,poolId,matchId,compitionType,overPrediction}) async {
    try {
      var data = {
        "userId": userId,
        if(poolId!="")
        "poolId": poolId,
        "matchId": matchId,
        "compitionType": compitionType,
        "overPrediction":overPrediction
      };

      debugPrint("datadatadata=>${data}");


      final response = await dioClient!.post(
          saveUserPredictionEndPoint,
          data: {
            "userId": userId,
            if(poolId!="" && poolId!=null)
            "poolId": poolId,
            "matchId": matchId,
            "compitionType": compitionType,
            "overPrediction":overPrediction
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
      if(userId==null) return;
      final response = await dioClient!.get(
          walletDetailsPoint,
          queryParameters: {
            "userId":userId
          },
          skipAuth: false);

      if(response['data']!=null && response['data']['balance']!=null){
        return response['data']['balance'];
      }
      return response;
      // return ResponseModel.fromJson(response);
    } catch (e, st) {
      walletBalance.value = 0;
      walletBalance.refresh();
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
      if(response['data']!=null && response['data'] is List){
        var list = response['data'] as List;
        return list.map((e)=>TransactionModel.fromJson(e)).toList();
      }

      return response;
      // return ResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, userTransactionEndPoint));
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


  Future myPredictedMatchesApi({userId}) async {
    try {
      final response = await dioClient!.get(
          myPredictedMatchesEndPoint,
          queryParameters: {
            "userId":userId,
          },
          skipAuth: false);

      return response;
      // return ResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, myPredictedMatchesEndPoint));
    }
  }


  Future getUsersMatchPredictionApi({
    required String userId,
    required String matchId,
    required String? poolId,
    bool needKuruk = false,
  }) async {
    try {
      final response = await dioClient!.get(
        getUsersMatchPredictionEndPoint,
        queryParameters: {
          "userId": userId,
          "matchId": matchId,
          if(poolId!=null && poolId!="")
          "poolId": poolId,
        },
        skipAuth: false,
      );

      final data = response['data'] as List;

      if (data.isEmpty) return;

      // Get the first item with the desired compitionType
      final match = data.firstWhere(
            (match) =>
        match['compitionType']?.toString().toLowerCase() ==
            (needKuruk ? 'kuruk' : 'harover'),
        orElse: () => {},
      );

      if (match.isEmpty) return;

      debugPrint("Prediction Match => $match");

      return MatchPredictionModel.fromJson(match);
    } catch (e, st) {
      debugPrint("ERROR => $e\nSTACK => $st");
      return Future.error(
        NetworkExceptions.getDioException(e, st, getUsersMatchPredictionEndPoint),
      );
    }
  }

  Future getMatchResultApi({matchId}) async {
    try {
      final response = await dioClient!.get(
          getMatchResultEndPoint,
          queryParameters: {
            "matchId":matchId,
          },
          skipAuth: false);

      var data = response['data'];
      debugPrint("datadatadatadata6763723__11====>${data['overPrediction']}");
      var innings = ((data['overPrediction']['innings'] as List));
      var overList = innings.first['overs'] as List;

      var list = <Over>[];

      overList.forEach((overCell){

        var ballList = overCell['Input'] as List;

        list.add(
            Over(
                overNumber: overCell['over'],
                firstBall: ballList[0].toString(),
                secondBall: ballList[1].toString(),
                thirdBall: ballList[2].toString(),
                fourthBall: ballList[3].toString(),
                fifthBall: ballList[4].toString(),
                sixthBall: ballList[5].toString()
            )
        );
      });

      debugPrint("list_length==>${list.length}");

      if(list.isNotEmpty) return list;

      return data;
    } catch (e, st) {
      debugPrint("stack_data====>${e}>>$st");
      return Future.error(
          NetworkExceptions.getDioException(e, st, getMatchResultEndPoint));
    }
  }

  Future winingPrizesListApi({matchId}) async {
    try {
      if(matchId==null || matchId.isEmpty) return;
      final response = await dioClient!.get(
          winnerSlotEndPoint,
          queryParameters: {
            "matchId":matchId,
          },
          skipAuth: true);

      var data = response['data'];
      debugPrint("datadatadatadata6763723__11====>${data['slots']}");
      var slotList = ((data['slots']as List));

      if(slotList.isEmpty) return [];
      var finalList = slotList.map((element)=>SlotCell.fromJson(element)).toList();


      return finalList;
    } catch (e, st) {
      debugPrint("stack_data====>${e}>>$st");
      return Future.error(
          NetworkExceptions.getDioException(e, st, winnerSlotEndPoint));
    }
  }

  Future getLiveMatchApi({matchId}) async {
    try {
      if(matchId==null || matchId.isEmpty) return;


      final response = await dioClient!.get(

          getLiveMatchEndPoint,
          queryParameters: {
            "matchId":matchId,
          },
          skipAuth: true);

      var data = response['data'];

if(data==null || data.isEmpty) return null;



      return LiveScoreModel.fromJson(data);
    } catch (e, st) {
      debugPrint("stack_data====>$e>>$st");
      return Future.error(
          NetworkExceptions.getDioException(e, st, winnerSlotEndPoint));
    }
  }


  Future<LiveScoreModel?> liveMatchDetails({required String matchId}) async {
    try {
      final client = CricketApiClient();

      final response = await client.getLiveMatch(matchId);
      debugPrint("testApi response: $response");

      if (response['data'] != null) {
        return LiveScoreModel.fromJson(response['data']);
      } else {
        debugPrint("API Error: ${response['message'] ?? 'Unknown error'}");
        return null;
      }
    } catch (e, st) {
      debugPrint('testApi error: $e\n$st');
      return null;
    }
  }

   Future updateUser({required Map<String, dynamic> data, userId}) async {
    try {
      final response = await dioClient?.put(
          updateProfileEndPoint(userId),
            data: FormData.fromMap(data));
      return response;
    } catch (e, st) {
      debugPrint(e.toString());
      return Future.error(
          NetworkExceptions.getDioException(e, st, signUpEndPoint));
    }
  }

  Future getLeaderBoardApi({matchId,poolId}) async {
    try {
      var data = {
        "matchId":matchId,
    "poolId":poolId
  };

      debugPrint("datadatadata=>isEmptyOrNull===>${(matchId==null || matchId.isEmpty)}");
      if(matchId==null || matchId.isEmpty) return;
      debugPrint("datadatadata=>${data}");
      final response = await dioClient!.get(
          getLeaderBoardEndPoint,
          data: data,
          skipAuth: false);

      return response;
      // return ResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, myPredictedMatchesEndPoint));
    }
  }
  Future getUserDetailsApi({userId}) async {
    try {
      var data = {
        "userId":userId,
      };

      debugPrint("getUserDetailsApi=>isEmptyOrNull===>${(userId==null || userId.isEmpty)}");
      if(userId==null || userId.isEmpty) return;
      debugPrint("getUserDetailsApi=>${data}");
      final response = await dioClient!.get(
          getUserDetailsEndPoint,
          queryParameters: data,
          skipAuth: false);

      return response;
      // return ResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, myPredictedMatchesEndPoint));
    }
  }

  Future getPredictedPoolApi({userId,matchId}) async {
    //PoolModel
    try {
      var data = {
        "userId":userId,
        "matchId":matchId,
      };

      debugPrint("getPredictedPoolApi=>isEmptyOrNull===>${(userId==null || userId.isEmpty)}");
      if(userId==null || userId.isEmpty) return;
      debugPrint("getPredictedPoolApi=>${data}");
      final response = await dioClient!.get(
          predictedPoolEndPoint,
          queryParameters: data,
          skipAuth: false);

      return response;
      // return ResponseModel.fromJson(response);
    } catch (e, st) {
      return Future.error(
          NetworkExceptions.getDioException(e, st, myPredictedMatchesEndPoint));
    }
  }

}
