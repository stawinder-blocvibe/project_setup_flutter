

import 'package:base_project/app/export.dart';
import 'package:base_project/presentation/modules/splash/controllers/onboarding_gif_sceen_controller.dart';

import '../controllers/splash_controller.dart';

class OnboardingGifScreen extends GetView<OnboardingGifScreenController> {
  final controller = Get.put(OnboardingGifScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // body: AssetImageWidget(splashScreen,imageHeight: Get.height,imageWidth: Get.width,imageFitType: BoxFit.cover,),
      body: AssetImageWidget(onBoardingGifAsset,imageHeight: Get.height,imageWidth: Get.width,imageFitType: BoxFit.cover,),
    );
  }
}
