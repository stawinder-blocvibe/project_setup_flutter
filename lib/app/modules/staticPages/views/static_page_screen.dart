

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
