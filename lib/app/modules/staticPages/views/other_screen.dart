

import 'package:base_project/app/export.dart';

class OtherScreen extends GetView<OthersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            localStorage.read(PreferenceManger.roleId) == roleCustomer
                ? Colors.white
                : bgColor,
        appBar: CustomAppBar(
          leadingColor: appColor,
          onTap: () {
            Navigator.pop(Get.context!);
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            localStorage.read(PreferenceManger.roleId) == roleCustomer
                ? TextView(keyOthers.tr,
                        textStyle:
                            textStyleHeadlineMedium().copyWith(color: appColor))
                    .marginSymmetric(horizontal: margin_15, vertical: margin_5)
                : ScreenHeading(
                    title: keyOthers.tr,
                  ),
            Obx(() => _othersItemsList())
          ],
        ));
  }

  Widget _othersItemsList() => Flexible(
        child: ListView.separated(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, int index) => GetInkWell(
            onTap: () {
              switch (index) {
                case 0:
                  Get.toNamed(AppRoutes.customerLanguageScreen);
                  break;
                case 1:
                  Get.toNamed(AppRoutes.staticPageRoute,
                      arguments: {argStaticPageType: pageTypeHelp});
                  break;
                case 2:
                  Get.toNamed(AppRoutes.faqRoute);
                  break;
                case 3:
                  Get.toNamed(AppRoutes.staticPageRoute,
                      arguments: {argStaticPageType: pageTypePrivacyPolicy});
                  break;
                case 4:
                  Get.toNamed(AppRoutes.staticPageRoute,
                      arguments: {argStaticPageType: pageTypeTerms});
                  break;
                case 5:
                  Get.toNamed(AppRoutes.staticPageRoute,
                      arguments: {argStaticPageType: pageTypeAboutUs});
                  break;

                case 6:
                  Get.toNamed(AppRoutes.customerContactUsScreen);
                  break;
                case 7:
                  Get.toNamed(AppRoutes.changePasswordRoute);
                  break;
                default:
                  Get.toNamed(AppRoutes.staticPageRoute,
                      arguments: {argStaticPageType: pageTypeHelp});
                  break;
              }
            },
            child: Row(
              children: [
                (controller.othersListIcons[index] is IconData)
                    ? Icon(
                        controller.othersListIcons[index],
                        color: Colors.black,
                      ).paddingOnly(right: margin_10)
                    : AssetImageWidget(
                        controller.othersListIcons[index],
                        imageHeight: height_20,
                        imageWidth: height_20,
                      ).paddingOnly(right: margin_20),
                Expanded(
                    child: TextView(
                  controller.othersListTitle[index],
                  textAlign: TextAlign.start,
                  textStyle: textStyleTitleSmall()
                      .copyWith(fontWeight: FontWeight.w400),
                )),
                AssetImageWidget(
                  localKey == "en" ? iconsIcNextGrey : iconsIcNextGreyRtl,
                  imageHeight: height_18,
                  imageWidth: height_18,
                )
              ],
            ).paddingSymmetric(horizontal: margin_20, vertical: margin_12),
          ),
          separatorBuilder: (context, int index) => Divider(
            color: messageTextFieldColor,
            thickness: margin_0point5,
          ),
          itemCount: localStorage.read(PreferenceManger.roleId) == roleCustomer
              ? controller.othersListTitle.length
              : controller.othersListTitle.length - 1,
        ).paddingSymmetric(vertical: margin_30),
      );
}
