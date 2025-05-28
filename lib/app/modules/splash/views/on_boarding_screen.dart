/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:base_project/app/export.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent), child: Scaffold(body: _bodyWidget()));
  }

  Widget _bodyWidget() => Obx(
        () => Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                controller.selectedPageIndex.value == controller.pages.length - 1 ? Container() : Align(alignment: Alignment.centerRight, child: _skipButton()),
                Expanded(
                    child: PageView(
                  children: controller.pages,
                  onPageChanged: (value) {
                    controller.onSwipePage(value);
                  },
                  controller: controller.pageController,
                )),
                SizedBox(
                  height: height_12,
                ),
                _nextButton().paddingOnly(bottom: margin_40),
              ],
            ).paddingSymmetric(horizontal: margin_0, vertical: margin_20),
            Positioned(
              // top: Get.height * .53,
              left: Get.width * .4,
              bottom: 23,
              child: _indicatorWidget(),
            ),
          ],
        ),
      );

  // Widget _indicatorWidget() => SmoothPageIndicator(
  //       controller: controller.pageController,
  //       count: controller.pages.length,
  //       effect: ExpandingDotsEffect(dotHeight: height_5, dotWidth: height_3, spacing: margin_4, activeDotColor: darkGreyColor, dotColor: lightGreyColor, expansionFactor: width_5),
  //     ).paddingOnly(bottom: margin_30);

  _indicatorWidget() {
    return Container(
      width: Get.width,
      height: height_11,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.pages.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            height: height_15,
            width: width_15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: controller.selectedPageIndex.value == index ? appColor : onBoardingColor,
            ),
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: onBoardingColor),
              child: Container(
                decoration: BoxDecoration(color: controller.selectedPageIndex.value == index ? appColor : onBoardingColor, shape: BoxShape.circle),
              ).marginAll(1),
            ).marginAll(1),
          ).marginOnly(right: margin_5);
        },
      ),
    );
  }

  Widget _skipButton() => MaterialButtonWidget(
          onPressed: () {
            controller.moveToRoleSelection();
          },
          buttonText: keySkip.tr,
          buttonRadius: radius_20,
          textColor: Colors.black,
          buttonColor: Colors.grey.shade400,
          buttonTextStyle: textStyleBodyMedium().copyWith(color: Colors.black),
          verticalPadding: margin_1,
          horizontalPadding: margin_10,
          minHeight: height_22,
          minWidth: margin_55)
      .marginOnly(right: margin_15, top: margin_10);

  Widget _nextButton() => MaterialButtonWidget(
        onPressed: () {
          controller.movePageAction();
        },
        buttonColor: applyFilterColor,
        minHeight: height_50,
        buttonRadius: radius_10,
        textColor: Colors.white,
        buttonText: controller.selectedPageIndex.value == controller.pages.length - 1 ? keyGetStarted.tr : keyNext.tr,
      ).paddingSymmetric(horizontal: margin_15);
}
