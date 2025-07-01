import 'package:base_project/app/export.dart';
import 'package:base_project/presentation/modules/splash/controllers/onboarding_gif_sceen_controller.dart';

class OnboardingGifScreen extends GetView<OnboardingGifScreenController> {
  final controller = Get.put(OnboardingGifScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AssetImageWidget(
        onBoardingGifAsset,
        imageHeight: Get.height,
        imageWidth: Get.width,
        imageFitType: BoxFit.cover,
      ),
    );
  }
}
