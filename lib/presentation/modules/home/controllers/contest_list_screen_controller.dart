
import 'package:base_project/presentation/modules/authentication/models/data_model/user_data_model.dart';
import 'package:base_project/presentation/modules/home/models/home_api_response.dart';

import '../../../../app/export.dart';
import '../models/pool_model.dart';

class ContestListScreenController extends GetxController {


  RxList<PoolModel> poolList = RxList();
  RxList<PoolModel> poolList2 = RxList();
  contestListApiCall({matchId}){
    repository.poolDetailApi(matchId: matchId).then((value){
      if(value!=null && value['data']['inning1']!=null){
        var data = value['data']['inning1'] as List;
        poolList.value =  data.map((e)=>PoolModel.fromJson(e)).toList();
        poolList.refresh();
      }

      if(value!=null && value['data']['inning2']!=null){
        var data = value['data']['inning2'] as List;
        poolList2.value =  data.map((e)=>PoolModel.fromJson(e)).toList();
        poolList2.refresh();
      }
    });
  }


  Rx<LiveMatches?> liveMatch = Rxn();
  handleArgument(){
    //"liveMatch":controller.liveMatch.value
    var args = Get.arguments;
    if(args!=null && args['liveMatch']!=null){
      liveMatch.value = args['liveMatch'];
      liveMatch.refresh();

      contestListApiCall(matchId: liveMatch.value?.matchId);
    }
  }

  Rx<UserDataModel?> user = Rxn();

  RxInt selectedTabIndex = 1.obs;


  handleUserData() async {
    preferenceManger.getSavedLoginData().then((value) {
      user.value = value;
      user.refresh();
      debugPrint("user=====>${user.value?.toJson()}");

    });
  }

  @override
  void onReady() {
     handleUserData();
    handleArgument();

    super.onReady();
  }
}