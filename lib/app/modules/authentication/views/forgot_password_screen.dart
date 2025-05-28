/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:base_project/app/export.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  final GlobalKey<FormState> forgotPasswordFormGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthenticationScreenHeading(
              title: keyForgotPassword.tr,
              textStyle: textStyleHeadlineLarge(),
            ).marginOnly(top: margin_10),
            TextView(
                localStorage.read(PreferenceManger.roleId) == roleCustomer
                    ? keyForgotPasswordDescCustomer.tr
                    : localStorage.read(PreferenceManger.roleId) == roleRestaurant
                        ? keyForgotPasswordDescRestaurant.tr
                        : localStorage.read(PreferenceManger.roleId) == roleDriver
                            ? keyForgotPasswordDescDriver.tr
                            : "",
                maxLines: 4,
                textAlign: TextAlign.start,
                textStyle: textStyleBodyLarge().copyWith(color: greyColor)),
            localStorage.read(PreferenceManger.roleId) == roleCustomer ? _contactList() : _form(),
            _continueButton()
          ],
        ).paddingSymmetric(horizontal: margin_20),
      ),
    );
  }

  _form() => Form(
        key: forgotPasswordFormGlobalKey,
        child: Column(
          children: [localStorage.read(PreferenceManger.roleId) == roleRestaurant ? _merchantIdTextField() : _riderIdTextField()],
        ).paddingOnly(top: margin_20, bottom: margin_10),
      );

  _merchantIdTextField() => TextFieldWidget(
        hint: keyEnterMerchantId.tr,
        labelText: keyMerchantID.tr,
        validate: (data) => Validator.idChecker(value: data, message: keyMerchantID.tr),
        maxLength: idMaxLength,
        textController: controller.merchantIdTextController,
        focusNode: controller.merchantIdFocusNode,
        inputType: TextInputType.phone,
        inputAction: TextInputAction.next,
      ).paddingOnly(bottom: margin_15);

  _riderIdTextField() => TextFieldWidget(
        hint: keyEnterYourId.tr,
        labelText: keyRiderID.tr,
        validate: (data) => Validator.idChecker(value: data, message: keyRiderID.tr),
        maxLength: idMaxLength,
        textController: controller.riderIdTextController,
        focusNode: controller.riderIdFocusNode,
        inputType: TextInputType.phone,
        inputAction: TextInputAction.done,
      ).paddingOnly(bottom: margin_15);

  _contactList() => ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, int index) => GetInkWell(
                onTap: () => controller.selectedContact.value = index,
                child: Obx(
                  () => Container(
                    padding: EdgeInsets.symmetric(vertical: margin_20, horizontal: margin_20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(radius_12),
                        border: Border.all(color: controller.selectedContact.value == index ? appColor : Colors.transparent, width: width_1point5),
                        boxShadow: [BoxShadow(color: controller.selectedContact.value == index ? Colors.transparent : Colors.grey.shade200, blurRadius: 2, spreadRadius: 2)]),
                    child: Row(
                      children: [
                        AssetImageWidget(
                          controller.contactImage[index],
                          imageHeight: height_50,
                          imageWidth: height_50,
                        ).paddingOnly(right: margin_20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(controller.contactText[index], textStyle: textStyleTitleMedium().copyWith(color: darkGreyColor)),
                              TextView(index == 0 ? keyForgotPassSmsSample.tr : keyForgotPassEmailSample.tr, textStyle: textStyleBodyLarge().copyWith(color: lightGreyColor))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
          separatorBuilder: (context, int index) => SizedBox(
                height: height_20,
              ),
          itemCount: 2)
      .paddingSymmetric(vertical: margin_20);

  Widget _continueButton() => MaterialButtonWidget(
        onPressed: () {
          controller.forgetPasswordOption();
        },
        textColor: Colors.white,
        buttonText: localStorage.read(PreferenceManger.roleId) == roleCustomer ? keyContinue.tr : keySubmit.tr,
      ).paddingOnly(top: margin_10);
}
