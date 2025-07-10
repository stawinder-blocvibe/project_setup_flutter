
import 'package:base_project/app/export.dart';
import 'package:base_project/presentation/modules/my_matches/presentations/my_match_kuruk_contest.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../authentication/models/data_model/user_data_model.dart';
import '../../home/models/home_api_response.dart';
import '../../home/models/pool_model.dart';

class MyMatchKurukContestController extends GetxController {
  // This controller is currently empty, but you can add methods and properties as needed.

  Rx matchId = Rxn();

  @override
  void onInit() {



    handleUserData(onComplete: (){
      hitPredictedPool(userId: user.value?.id, matchId: matchId.value);
    });
    super.onInit();
  }

  Rx<UserDataModel?> user = Rx<UserDataModel?>(null);
  handleUserData({required onComplete}) async {

    var args = await Get.arguments;

    if(args!=null && args['matchId']!=null){
      matchId.value = args['matchId'];
    }

     if(args!=null && args['liveMatch']!=null){
      liveMatch.value  = args['liveMatch'];
      liveMatch.refresh();
      debugPrint("liveMatches.value===>${liveMatch.value?.toJson()}");
    }
    preferenceManger.getSavedLoginData().then((value) {
      user.value = value;
      user.refresh();
      debugPrint("userFinal=====>${user.value?.id}==>${matchId.value}");
      onComplete();
    });
  }
  RxList<PoolModel> predictedPoolList = RxList();
  hitPredictedPool({matchId, userId}) {
    repository.getPredictedPoolApi(matchId: matchId,userId: userId).then((value){
      if(value!=null && value['data']!=null && value['data'] is List){
        predictedPoolList.value = (value['data'] as List).map((e) => PoolModel.fromJson(e)).toList();
      }


      predictedPoolList.refresh();
    debugPrint("predictedPoolList====>${predictedPoolList.length}");
    }).onError((error, stackTrace) {
      debugPrint("error====>$error");
    });
  }


  Rx<LiveMatches?> liveMatch = Rxn();


}