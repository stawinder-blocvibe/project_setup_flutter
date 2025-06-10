import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:base_project/app/export.dart';

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
    await Future.delayed(Duration(milliseconds: 1500));
    handleRouting();
    // Get.offAllNamed(AppRoutes.onBoardingRoute);
  }
}

handleRouting() async  {
  var token = await preferenceManger.getAuthToken();
  bool? isFirstLaunched = await preferenceManger.getStatusFirstLaunch();
  debugPrint("isFirstLaunched--->$token>>$isFirstLaunched");
  if (isFirstLaunched != null && isFirstLaunched) {
    if (token != null) {
      Get.offAllNamed(AppRoutes.mainParentRoute);
    } else {
      Get.offAllNamed(AppRoutes.loginRoute);
    }
  } else {
    Get.offAllNamed(AppRoutes.onBoardingRoute);
  }
}
