import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:base_project/app/export.dart';

import '../views/onboarding_gif_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startSplashFlow();
  }

  void _startSplashFlow() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Get.snackbar('No Internet', 'Please check your connection.');
      return;
    }
    await Future.delayed(const Duration(seconds: 2));
    handleRouting();
    // Get.offAllNamed(AppRoutes.onBoardingRoute);
  }
}

/*handleRouting() async  {

  // Get.off(OnboardingGifScreen());
  // Get.offAllNamed(
  //   AppRoutes.onboardingGifScreenRoute,
  //   transition: Transition.fadeIn,
  // );
  Get.offAll(
     OnboardingGifScreen(),
    transition: Transition.fadeIn,
    duration: const Duration(milliseconds: 10),
  );

  return;

  var token = await preferenceManger.getAuthToken();
  bool? isFirstLaunched = await preferenceManger.getStatusFirstLaunch();
  debugPrint("isFirstLaunched--->$token>>$isFirstLaunched");
  if (isFirstLaunched != null && isFirstLaunched) {
    if (token != null) {
      Get.offAllNamed(AppRoutes.mainParentRoute);
      Get.to(OnboardingGifScreen());
    } else {
      Get.offAllNamed(AppRoutes.loginRoute);
    }
  } else {
    Get.offAllNamed(AppRoutes.onBoardingRoute);
  }
}*/

handleRouting() async  {
  var token = await preferenceManger.getAuthToken();
  bool? isFirstLaunched = await preferenceManger.getStatusFirstLaunch();
  debugPrint("isFirstLaunched--->$token>>$isFirstLaunched");
  // if (isFirstLaunched != null && isFirstLaunched) {
  if (token != null) {
    Get.offAllNamed(AppRoutes.mainParentRoute);
  } else {
    Get.offAllNamed(AppRoutes.loginRoute);
  }
  // } else {
  //   Get.offAllNamed(AppRoutes.loginRoute);
  //   // Get.offAllNamed(AppRoutes.onBoardingRoute);
  // }
}
