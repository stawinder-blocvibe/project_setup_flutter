

import 'package:base_project/app/export.dart';

import '../widgets/on_boarding_widget.dart';

class OnBoardingController extends GetxController {
  RxInt selectedPageIndex = 0.obs;

  List<OnBoardingWidget> pages = [];
  PageController pageController = PageController();

  @override
  void onInit() {
    addData();
    super.onInit();
  }

  addData() {
    pages.clear();
    pages.add(OnBoardingWidget());
    pages.add(OnBoardingWidget());
    pages.add(OnBoardingWidget());
  }

  movePageAction() {
    if (selectedPageIndex.value < pages.length - 1) {
      selectedPageIndex.value++;
      pageController.animateToPage(selectedPageIndex.value,
          curve: Curves.decelerate,
          duration:
              Duration(milliseconds: 300)); // for animated jump. Requires a cu
    } else {
      moveToRoleSelection();
    }
  }

  onSwipePage(index) {
    selectedPageIndex.value = index;
  }

  moveToRoleSelection() async {
    await preferenceManger.firstLaunch(true);
    debugPrint(
        'firstLaunch-->${await preferenceManger.getStatusFirstLaunch()}');
    Get.offAllNamed(AppRoutes.loginRoute);
  }

  @override
  void refresh() {
    addData();
    super.refresh();
  }
}
