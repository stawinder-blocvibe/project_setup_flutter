/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:base_project/app/export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? appBarTitleText;
  final Widget? leadingWidget;
  final Widget? actionWidget;
  final Widget? titleWidget;
  final Color? leadingColor;
  final Color? bgColor;
  final bool? titleInCentre;
  final Function? onTap;
  final double? leadingWidth;
  final bool? isLight;
  final bool showBackButton;
  final bottomMargin;
  final topMargin;

  CustomAppBar(
      {Key? key,
      this.appBarTitleText,
      this.leadingWidget,
      this.leadingColor,
      this.actionWidget,
      this.titleInCentre,
      this.onTap,
      this.titleWidget,
      this.bgColor,
      this.leadingWidth,
      this.isLight,
      this.bottomMargin,
      this.topMargin,
      this.showBackButton = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PreferredSize(
          child: AppBar(
            scrolledUnderElevation: 0.0,
            leadingWidth: leadingWidth,
            backgroundColor: bgColor ?? Colors.white,
            shadowColor: bgColor ?? Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: isLight == true
                  ? Platform.isAndroid
                      ? Brightness.light
                      : Brightness.dark
                  : Platform.isAndroid
                      ? Brightness.dark
                      : Brightness.light,
              statusBarBrightness: isLight == true
                  ? Platform.isAndroid
                      ? Brightness.light
                      : Brightness.dark
                  : Platform.isAndroid
                      ? Brightness.dark
                      : Brightness.light,
            ),
            elevation: 0,
            title: TextView('', textStyle: textStyleHeadingSmall()),
            leading: leadingWidget ??
                (showBackButton
                    ? Padding(
                        padding: EdgeInsets.symmetric(vertical: margin_6),
                        child: GetInkWell(
                            child: AssetImageWidget(
                              localKey == "en" ? iconsIcBack : iconsIcBackRtl,
                              color: leadingColor,
                            ).paddingSymmetric(vertical: margin_10),
                            onTap: () {
                              if (onTap == null) {
                                Get.back(result: true);
                              } else {
                                onTap!();
                              }
                            }),
                      )
                    : SizedBox()),
            centerTitle: titleInCentre ?? true,
            actions: [actionWidget ?? Container()],
          ),
          preferredSize: Size.fromHeight(height_50),
        ).paddingOnly(
            top: topMargin ?? margin_0, bottom: bottomMargin ?? margin_0),
        appBarTitleText == "" || appBarTitleText == null
            ? Container(
                height: margin_0,
                width: margin_0,
              )
            : TextView(appBarTitleText ?? "",
                    textAlign: TextAlign.start,
                    textStyle: textStyleHeadingSmall().copyWith(
                        color: Colors.black87,
                        fontSize: font_20,
                        fontWeight: FontWeight.w700))
                .paddingSymmetric(horizontal: margin_15)
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
