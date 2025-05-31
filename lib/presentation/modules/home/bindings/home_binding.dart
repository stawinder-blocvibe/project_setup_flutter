import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../controllers/live_match_list_controller.dart';
import '../controllers/upcoming_match_list_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<LiveMatchListController>(() => LiveMatchListController());
    Get.lazyPut<UpcomingMatchListController>(() => UpcomingMatchListController());
  }
}

