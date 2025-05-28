/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

// import 'crash_screen.dart';

// import 'package:flutter_share/flutter_share.dart';
import 'package:in_app_review/in_app_review.dart';

import '../../../export.dart';
import '../controllers/about_us_controller.dart';

class AboutUsScreen extends StatelessWidget {
  final controller = Get.put(AboutUsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      appBar: CustomAppBar(
        bgColor: appColor,
        leadingColor: Colors.white,
      ),
      body: Stack(
        children: [
          TextView(
            keyAboutApp.tr,
            textAlign: TextAlign.start,
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: font_20,
                fontWeight: FontWeight.w500),
          ).marginOnly(left: margin_18),
          Container(
              width: Get.width,
              height: Get.height,
              margin: EdgeInsets.only(top: margin_50),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [tileList()],
              ).marginOnly(top: margin_0)),
        ],
      ),
    );

    /*AnnotatedRegionWidget(
      statusBarColor: colorAppColors,
      statusBarBrightness: Brightness.light,
      child: Scaffold(
        appBar: CustomAppBar(

          iconColor: Colors.white,
          appBarTitleText: strAboutApp,
          titleColor: Colors.white,
          bgColor: colorAppColors,
        ),
        backgroundColor: colorLightYellow,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: tileList(),
        ),
      ),
    );*/
  }

  tileList() => Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            versionWidget(),
            Divider(
              color: Colors.grey,
            ),
            _listTileIconView(
                label: keyRateApp.tr,
                // https://play.google.com/store/apps/details?id=com.wisely
                // leadingIcon: iconsDelete,
                onSeeAllTap: () async {
                  final InAppReview inAppReview = InAppReview.instance;
                  if (await inAppReview.isAvailable()) {
                    inAppReview.requestReview();
                  }
                },
                description: ""),
            _listTileIconView(
                label: keyShareApp.tr,
                // leadingIcon: iconsDelete,
                onSeeAllTap: () async {
                  // final String appLink =
                  //     'https://play.google.com/store/apps/details?id=com.forge';
                  //
                  // final String message = keyCheckOutThisApp.tr + appLink;
                  // await FlutterShare.share(
                  //     title: keyShareApp.tr, linkUrl: appLink, text: message);
                },
                description: ""),
            _listTileIconView(
                label: keyMoreApp.tr,
                // onSeeAllTap: () async {
                //   await launchUrl(Uri.parse("https://play.google.com/store/apps/details?id=${controller.packageName.value}"));
                // },
                description: keyCheckOtherApps.tr),
            _listTileIconView(
              label: keyServer.tr,
              description:
                  "${baseUrl.replaceAll("-api", "").replaceFirst('/api', '')}",
            ),
            /*_listTileIconView(
              label: "Logger",
              onSeeAllTap: () {
                Get.to(CrashReportScreen());
              },
              // description: "Not crashed yet.",
            ),*/
            Visibility(
              visible: kDebugMode,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: margin_18, vertical: margin_5),
                child: MaterialButtonWidget(
                  buttonText: keyForceCrash.tr,
                  onPressed: () {
                    throw Exception(keyInternationalCrash.tr);
                  },
                ),
              ),
            ).paddingOnly(top: margin_50)
          ],
        ).marginOnly(
          top: margin_20,
        ),
      );

  versionWidget() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              keyVersion.tr ?? '',
              textStyle: textStyleBodyMedium().copyWith(
                color: Colors.black,
                fontSize: font_15,
                fontWeight: FontWeight.w500,
              ),
            ).marginOnly(bottom: margin_5),
            TextView(
              controller.versionNumber.value.toString(),
              textStyle: textStyleBodyMedium().copyWith(
                color: Colors.black,
                fontSize: font_14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    ).paddingSymmetric(vertical: margin_16, horizontal: margin_15);
  }

  Widget _listTileIconView(
          {label, leadingIcon, onSeeAllTap, icon, description}) =>
      InkWell(
        onTap: onSeeAllTap ?? () {},
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    (leadingIcon != null)
                        ? AssetImageWidget(
                            leadingIcon,
                            imageFitType: BoxFit.cover,
                            imageHeight: height_25,
                          ).marginOnly(right: margin_12)
                        : SizedBox(),
                    (icon != null)
                        ? Icon(
                            icon,
                            color: Colors.yellow,
                            size: height_25,
                          ).marginOnly(right: margin_12)
                        : SizedBox(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          label ?? '',
                          textStyle: textStyleBodyMedium().copyWith(
                            color: Colors.black,
                            fontSize: font_15,
                            fontWeight: FontWeight.w500,
                          ),
                        ).marginOnly(bottom: margin_5),
                        description != null
                            ? TextView(
                                description,
                                textStyle: textStyleBodySmall().copyWith(
                                  color: Colors.black,
                                  fontSize: font_15,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ],
                ),
                Visibility(
                    visible: onSeeAllTap != null,
                    child: Icon(Icons.chevron_right))
              ],
            ).paddingSymmetric(vertical: margin_16, horizontal: margin_15),
            Divider(
              color: Colors.grey,
            ),
          ],
        ),
      );
}
