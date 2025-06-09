

import 'package:base_project/app/export.dart';

import '../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  final controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AssetImageWidget(splashScreen,imageHeight: Get.height,imageWidth: Get.width,imageFitType: BoxFit.cover,),
    );
  }
}
