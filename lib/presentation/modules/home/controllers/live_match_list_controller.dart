
import '../../../../app/export.dart';
import '../models/home_api_response.dart';

class LiveMatchListController extends GetxController {

  List<String> ballList= [
    "W",
    "6",
    "4",
    "6",
    "NB",
    "0","NB",
    "0",
  ];

  RxList<LiveMatches> liveMatches = RxList();
  @override
  void onReady() {
    // TODO: implement onReady
    handleArguments();
    super.onReady();
  }

  void handleArguments() {
    var args = Get.arguments;
    if(args!=null && args['liveMatches'] != null) {
      List<LiveMatches> matches = args['liveMatches'];
      liveMatches.value = matches;
      liveMatches.refresh();
    } else {
      debugPrint("No live matches found in arguments");
    }
  }
}