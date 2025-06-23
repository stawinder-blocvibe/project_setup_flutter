
import 'package:base_project/presentation/modules/home/models/home_api_response.dart';

import '../../../../app/export.dart';
import '../models/live_score_model.dart';

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
      // repository.testApi(matchId:  '684d6cc8854abdd9e5a62758');
      hitliveMatchDetails(matchId: liveMatch.value?.matchId);
    }
    debugPrint("liveMatches.value===>${liveMatch.value?.toJson()}>>${args}");

  }

  Rx<LiveScoreModel?> liveScore = Rxn();
  hitliveMatchDetails({matchId}){
    repository.liveMatchDetails(
      matchId: matchId
    ).then((value){

      if(value is LiveScoreModel){
        liveScore.value = value;
        liveScore.refresh();
      }else{
        liveScore.value = null;
        liveScore.refresh();
      }
    });
  }


  @override
  void onReady() {
    handleArguments();

    super.onReady();
  }
}