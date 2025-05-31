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
      // Optionally show a no internet screen or dialog
      Get.snackbar('No Internet', 'Please check your connection.');
      return;
    }
    // Simulate splash delay
    await Future.delayed(Duration(milliseconds: 1500));
    // Navigate to onboarding screen
    Get.offAllNamed(AppRoutes.onBoardingRoute);
  }
}
