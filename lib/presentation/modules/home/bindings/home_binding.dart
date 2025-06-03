import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../controllers/live_match_list_controller.dart';
import '../controllers/match_detail_category_controller.dart';
import '../controllers/match_score_controller.dart';
import '../controllers/over_ball_selection_controller.dart';
import '../controllers/upcoming_match_list_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<LiveMatchListController>(() => LiveMatchListController());
    Get.lazyPut<UpcomingMatchListController>(() => UpcomingMatchListController());
    Get.lazyPut<MatchScoreController>(() => MatchScoreController());
    Get.lazyPut<OverBallSelectionController>(() => OverBallSelectionController());
    Get.lazyPut<MatchDetailCategoryController>(() => MatchDetailCategoryController());
  }
}

