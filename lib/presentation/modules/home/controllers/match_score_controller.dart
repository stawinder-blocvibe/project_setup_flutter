
import 'package:base_project/presentation/modules/home/models/home_api_response.dart';

import '../../../../app/export.dart';

class MatchScoreController extends GetxController {

  List<String> ballList= [
    "W",
    "6",
    "4",
    "6",
    "NB",
    "0","NB",
    "0",
  ];

  Rx<LiveMatches?> liveMatch = Rxn();

  void handleArguments() {
    var args = Get.arguments;
    if(args!=null && args['liveMatch']!=null){
      liveMatch.value  = args['liveMatch'];
      liveMatch.refresh();

      debugPrint("liveMatches.value===>${liveMatch.value?.toJson()}");
    }
  }


  @override
  void onReady() {
    handleArguments();
    super.onReady();
  }
}