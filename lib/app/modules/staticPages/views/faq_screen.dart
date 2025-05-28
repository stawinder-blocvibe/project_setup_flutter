

import 'package:base_project/app/export.dart';

class FAQScreen extends GetView<FaqController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          localStorage.read(PreferenceManger.roleId) == roleCustomer ||
                  localStorage.read(PreferenceManger.roleId) == roleRestaurant
              ? Colors.white
              : bgColor,
      appBar: CustomAppBar(
        leadingColor: appColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          localStorage.read(PreferenceManger.roleId) == roleCustomer
              ? TextView(keyFAQ.tr,
                      textStyle:
                          textStyleHeadlineMedium().copyWith(color: appColor))
                  .marginSymmetric(horizontal: margin_15, vertical: margin_5)
              : ScreenHeading(
                  title: keyFAQs.tr,
                ),
          Expanded(
              child: Obx(
            () => ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) =>
                  _tileItems(index),
              itemCount: controller.faqItemsList.length,
              separatorBuilder: (BuildContext context, int index) => Divider(
                thickness: width_1,
                color: Colors.grey.withOpacity(0.2),
              ),
            ).paddingOnly(top: margin_20),
          )),
        ],
      ),
    );
  }

  Widget _tileItems(int index) => Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: Obx(
        () => ExpansionTile(
          childrenPadding: EdgeInsets.symmetric(horizontal: width_22),
          tilePadding: EdgeInsets.symmetric(horizontal: width_20),
          backgroundColor: bgColor,
          onExpansionChanged: (value) {
            controller.faqItemsList[index].isExpanded = value;
            controller.faqItemsList.refresh();
          },
          trailing: AnimatedRotation(

              /// you can use different widget for animation
              turns: (controller.faqItemsList[index].isExpanded ?? false)
                  ? 0.25
                  : 0,
              duration: Duration(microseconds: 1000),
              child: Icon(
                Icons.keyboard_arrow_right_rounded,
                color: appColor,
                size: width_25,
              ) // your svgImage here
              ),
          title: Text(
            controller.faqItemsList[index].title ?? '',
            style: textStyleHeadingSmall()
                .copyWith(fontSize: font_13, fontWeight: FontWeight.w600),
          ),
          children: <Widget>[
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                controller.faqItemsList[index].description ?? '',
                style: textStyleBodyMedium().copyWith(
                    color: Colors.grey.shade500, fontWeight: FontWeight.w400),
              ).marginOnly(bottom: margin_10),
            ),
          ],
        ),
      ));
}
