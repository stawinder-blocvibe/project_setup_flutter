import 'package:base_project/app/export.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            AssetImageWidget(onboardingScreenBackground, imageWidth: Get.width, imageHeight: Get.height,imageFitType: BoxFit.cover,),
            Column(
              children: [


                topWidget(),
                Spacer(),
                bottomWidget(),
              ],
            ).paddingSymmetric(horizontal: margin_0, vertical: margin_20),
          ],
        ),
      ),
    );
  }

  Widget topWidget() {
    return Column(
      children: [
       AssetImageWidget(ballStreetLogo,imageHeight: height_100,imageWidth: Get.width*0.7,),
        SizedBox(
          height: height_100,
          child: PageView(
            controller: controller.pageController,
            onPageChanged: controller.onSwipePage,
            children: controller.pages,
          ),
        ),
      ],
    ).marginOnly(top: margin_80);
  }

  Widget titleWidget() {
    return SizedBox(
      width: 316,
      child: Text(
        'Welcome back to Ball Street',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'TAN - SONGBIRD',
          fontWeight: FontWeight.w400,
          height: 2.25,
          letterSpacing: 1.60,
        ),
      ),
    );
  }

  Widget subTitleWidget() {
    return SizedBox(
      width: 316,
      child: Text(
        'Predict matches, earn rewards & climb the leaderboard!',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Maleah',
          fontWeight: FontWeight.w700,
          letterSpacing: 0.16,
        ),
      ),
    );
  }

  Widget bottomWidget() {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            int nextPage = controller.selectedPageIndex.value + 1;
            if (nextPage < controller.pages.length) {
              controller.pageController.animateToPage(
                nextPage,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {


              // debugPrint('Navigating to login route');
              // return ;
              await preferenceManger.firstLaunch(true);
              debugPrint(
                  'firstLaunch-->${await preferenceManger.getStatusFirstLaunch()}');
            Get.toNamed(AppRoutes.loginRoute);
              // TODO: Navigate to next screen after onboarding
            }
          },
          child: appButton(buttonText: "Next"),
        ),
        SizedBox(height: 12),
        skipButtonWidget(buttonText: "Skip"),
      ],
    );
  }

  Widget appButton({required String buttonText}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AssetImageWidget(yellowButtonBg, imageHeight: height_40),
        Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF014426),
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget skipButtonWidget({required String buttonText}) {
    return GestureDetector(
      onTap: ()async {
        // Get.toNamed(AppRoutes.loginRoute);
        await preferenceManger.firstLaunch(true);
        debugPrint(
            'firstLaunch-->${await preferenceManger.getStatusFirstLaunch()}');
        Get.toNamed(AppRoutes.loginRoute);
        },
      child: Container(
        width: Get.width,
        margin: EdgeInsets.symmetric(horizontal: height_35,),
        padding: EdgeInsets.symmetric(vertical: height_10,),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              color: const Color(0xFFD27D08),
            ),
            borderRadius: BorderRadius.circular(146),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: const Color(0xFFFFCB3C),
            fontSize: 16,
            fontFamily:fontFamily,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
