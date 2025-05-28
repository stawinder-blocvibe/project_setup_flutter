

import 'package:base_project/app/export.dart';

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
    pages.add(OnBoardingWidget(
      imageUrl: iconsIcOnBoarding1,
      topImage: iconsIcPlaceholder,
      label: keyChooseYourCravings.tr,
      bodyText: keyChooseYourCravingsDesc.tr,
    ));
    pages.add(OnBoardingWidget(
      imageUrl: iconsIcOnBoarding2,
      topImage: iconsIcPlaceholder,
      label: keyFoodOver.tr,
      bodyText: keyChooseYourCravingsDesc.tr,
    ));
    pages.add(OnBoardingWidget(
      imageUrl: iconsIcOnBoarding3,
      topImage: iconsIcPlaceholder,
      label: keyYourDoor.tr,
      bodyText: keyChooseYourCravingsDesc.tr,
    ));
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
