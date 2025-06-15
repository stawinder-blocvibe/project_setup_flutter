
import '../../../../app/export.dart';
import '../models/home_api_response.dart';

class UpcomingMatchListController extends GetxController {

  List<String> ballList= [
    "W",
    "6",
    "4",
    "6",
    "NB",
    "0","NB",
    "0",

  ];

  @override
  void onReady() {
    // TODO: implement onReady
    handleArguments();
    super.onReady();
  }


  RxList<UpcomingMatches> upcomingMatchesList = RxList();
  handleArguments() {
    // Handle any arguments passed to this controller
    // For example, you can access route parameters or query parameters
    final arguments = Get.arguments;
    if (arguments != null && arguments['upcomingMatches'] != null) {
      upcomingMatchesList.value = arguments['upcomingMatches'];
      upcomingMatchesList.refresh();
      debugPrint('Arguments received: $arguments');
    }
  }
}