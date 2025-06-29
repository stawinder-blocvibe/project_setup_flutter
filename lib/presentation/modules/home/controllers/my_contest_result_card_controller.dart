

import 'package:base_project/presentation/modules/home/models/home_api_response.dart';

import '../../../../app/export.dart';

class MyContestResultCardController extends GetxController {

  @override
  void onReady() {

    handleArguments();
    super.onReady();
  }
  Rx<LiveMatches?> liveMatch = Rxn();

  void handleArguments() {
    var args = Get.arguments;
    if(args['liveMatch']!=null){
      liveMatch.value = args['liveMatch'] as LiveMatches;
    } else {
      debugPrint("No live match data found in arguments");
    }
  }


}