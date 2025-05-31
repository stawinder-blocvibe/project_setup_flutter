

import '../../../../app/export.dart';
import '../../home/views/home_view.dart';

class MainParentController extends GetxController {
  RxInt bottomNavIndex = 0.obs;



  RxList<Widget> homeList = <Widget>[
    HomeScreen(),
    Text("Event"),
    Text("Predict"),
    Text("Ranking"),
    Text("Profile"),

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

    } else if (index == 2) {

    } else if (index == 3) {

    }

  }

  @override
  void onClose() {
    super.onClose();
  }
}
