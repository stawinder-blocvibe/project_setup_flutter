import 'package:base_project/presentation/modules/authentication/models/data_model/user_data_model.dart';
import 'package:base_project/presentation/modules/home/models/my_match_model.dart';
import 'package:get/get.dart';

import '../../../../app/export.dart';
import '../../../../main.dart';

class MyMatchesController extends GetxController {
  // Add any logic or variables for MyMatchesScreen here


  Rx<UserDataModel?> user = Rxn();
  handleUserData() async {
    await preferenceManger.getSavedLoginData().then((value){
      user.value = value;
      user.refresh();
      debugPrint("user=====>${user.value?.toJson()}");
    });



    @override
    void onReady() {
      handleUserData();
      // handleArgument();
      hitMyMatchesApi();

      super.onReady();
    }
}

RxList<MyMatchModel> myMatchList = RxList();
   hitMyMatchesApi() async {
    await handleUserData();
  repository.myPredictedMatchesApi(userId: user.value?.id).then((value){

    if(value!=null && value['data']!=null){
      var list =  value['data'] as List;

      myMatchList.value = list.map((e)=>MyMatchModel.fromJson(e)).toList();
      myMatchList.refresh();
    }
  });}
}

