

import 'package:base_project/app/export.dart';

class SplashScreen extends GetView<SplashController> {
  final controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        width: Get.width,
        height: Get.height,
        alignment: Alignment.center,
        child: AssetImageWidget(
          iconsLogo,
          imageHeight: height_90,
          imageWidth: height_90,
        ).animate().slideY(delay: Duration(milliseconds: 100)),
      ),
    );
  }
}
