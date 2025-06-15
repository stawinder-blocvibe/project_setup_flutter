import 'package:base_project/presentation/modules/home/controllers/my_matches_controller.dart';

import '../../../../app/export.dart';
import '../../home/views/home_view.dart';
import '../../home/views/my_matches_screen.dart';
import '../../home/views/profile_screen.dart';

class MainParentController extends GetxController {
  RxInt bottomNavIndex = 0.obs;

  RxList<Widget> homeList = <Widget>[
    HomeScreen(),
    MyMatchesScreen(),

    Text("Predict"),
    Text("Ranking"),
    ProfileScreen(),
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  updateBottomNavIndex(int index) {
    bottomNavIndex.value = index;
    if (index == 0) {
    } else if (index == 1) {
      Get.find<MyMatchesController>().hitMyMatchesApi(

      );
    } else if (index == 2) {
    } else if (index == 3) {
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
