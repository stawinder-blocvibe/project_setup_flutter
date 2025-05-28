/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:flutter_html/flutter_html.dart';
import 'package:base_project/app/export.dart';

class StaticPageScreen extends GetView<StaticPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(leadingColor: appColor),
        body: Obx(
          () => controller.isLoading.value
              ? loadingWidget()
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthenticationScreenHeading(
                          title: controller.pageType.value ==
                                  pageTypePrivacyPolicy
                              ? keyPrivacyPolicy.tr
                              : controller.pageType.value == pageTypeAboutUs
                                  ? keyAboutUs.tr
                                  : controller.pageType.value == pageTypeTerms
                                      ? keyTermsNConditions.tr
                                      : keyHelp.tr),
                      controller.staticPageResponseModel?.value.page == null
                          ? Center(child: Text(keyNoDataFound.tr))
                          : Html(
                              data: controller.staticPageResponseModel?.value
                                      .page?.description ??
                                  '')
                    ],
                  ).paddingSymmetric(horizontal: margin_20),
                ),
        ));
  }
}
