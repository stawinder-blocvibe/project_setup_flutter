

import 'package:base_project/app/export.dart';

import '../../../core/widget/country_picker.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white),
      child: DoubleBack(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              width: Get.width,
              height: Get.height,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _form(),
                          loginButton(),
                          _loginWithText(),
                          _socialIcons(),
                          SizedBox(
                            height: height_30,
                          ),
                          _signup()
                        ],
                      ).paddingSymmetric(horizontal: margin_20),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  _form() => Form(
        key: controller.loginFormGlobalKey,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: TextView(
                  textAlign: TextAlign.center,
                  keyLogo.tr,
                  textStyle: textStyleBody1().copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: font_27),
                ),
              ),
              SizedBox(
                height: height_40,
              ),
              welcomeBack(),
              SizedBox(
                height: height_30,
              ),
              localStorage.read(PreferenceManger.roleId) == roleRestaurant
                  ? _merchantIdTextField()
                  : phoneNo(),
              localStorage.read(PreferenceManger.roleId) == roleDriver
                  ? _riderIdTextField()
                  : _passwordTextField(),
              localStorage.read(PreferenceManger.roleId) == roleDriver
                  ? _passwordTextField()
                  : Container(),
              _rememberMeForgotPassword()
            ],
          ).paddingOnly(top: margin_70, bottom: margin_10),
        ),
      );

  Widget welcomeBack() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          textAlign: TextAlign.center,
          keyWelcomeBack.tr,
          textStyle: textStyleBody1().copyWith(
              color: applyFilterColor,
              fontWeight: FontWeight.w600,
              fontSize: font_22),
        ),
        SizedBox(
          height: height_5,
        ),
        TextView(
          textAlign: TextAlign.center,
          keyLoginYourAccount.tr,
          textStyle: textStyleBody1().copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: font_13),
        ),
      ],
    );
  }

  phoneNo() {
    return Obx(
      () => CountryPickerr(
        onChange: (phone) {
          if (phone.number == "0") {
            controller.mobileNumberTextController.text = "";
          }
        },
        prefixIcon: true,
        borderColor: true,
        selectedCountry: controller.selectedCountry?.value,
        textController: controller.mobileNumberTextController,
        countryController: controller.mobileNumberTextController,
        focusNode: controller.mobileNumberFocusNode,
        onCountryChanged: (country) {
          controller.selectedCountry?.value = country;
          controller.selectedCountry?.refresh();
        },
      ),
    );
  }

  _merchantIdTextField() => TextFieldWidget(
        hint: keyEnterMerchantId.tr,
        labelText: keyMerchantID.tr,
        validate: (data) =>
            Validator.idChecker(value: data, message: keyMerchantID.tr),
        maxLength: idMaxLength,
        textController: controller.merchantIdTextController,
        focusNode: controller.merchantIdFocusNode,
        inputType: TextInputType.phone,
        inputAction: TextInputAction.next,
      ).paddingOnly(bottom: margin_15);

  _riderIdTextField() => TextFieldWidget(
        hint: keyEnterYourId.tr,
        labelText: keyRiderID.tr,
        validate: (data) =>
            Validator.idChecker(value: data, message: keyRiderID.tr),
        maxLength: idMaxLength,
        textController: controller.riderIdTextController,
        focusNode: controller.riderIdFocusNode,
        inputType: TextInputType.phone,
        inputAction: TextInputAction.done,
      ).paddingOnly(bottom: margin_15);

  _passwordTextField() => TextFieldWidget(
        isShadow: false,
        fillColor: Colors.transparent,
        hint: keyEnterPassword.tr,
        borderEnabled: true,
        isBorderColor: true,
        contentPadding:
            EdgeInsets.symmetric(horizontal: margin_15, vertical: margin_13),
        labelText: keyPassword.tr,
        validate: (data) =>
            Validator.fieldChecker(value: data, message: keyPassword.tr),
        textController: controller.passwordTextController,
        focusNode: controller.passwordFocusNode,
        maxLength: 35,
        formatter: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
        inputType: TextInputType.visiblePassword,
        obscureText: controller.viewPassword.value,
        suffixIcon: GetInkWell(
          onTap: () => controller.showOrHidePasswordVisibility(),
          child: AssetImageWidget(
                  controller.viewPassword.value ? iconsIcHide : iconsIcShow)
              .paddingOnly(bottom: margin_4, right: margin_10),
        ),
        inputAction: TextInputAction.next,
      ).paddingOnly(bottom: margin_10, top: margin_3);

  _rememberMeForgotPassword() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_rememberMeCheck(), _forgotPassword()],
      ).paddingOnly(bottom: margin_5);

  _rememberMeCheck() => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
                visualDensity: VisualDensity(horizontal: -4, vertical: 0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(radius_5),
                )),
                activeColor: applyFilterColor,
                side: BorderSide(color: applyFilterColor, width: width_2),
                value: controller.isRemembered.value,
                onChanged: (value) => controller.rememberMe(value)),
            SizedBox(width: margin_3),
            TextView(
              keyRememberMe.tr,
              textStyle: textStyleBody1().copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: font_13),
            )
          ]);

  _forgotPassword() => GetInkWell(
      onTap: () => Get.toNamed(AppRoutes.forgotPasswordOption),
      child: TextView(
        keyForgotPasswordQ.tr,
        textStyle: textStyleBody1().copyWith(
            color: applyFilterColor,
            fontWeight: FontWeight.w500,
            fontSize: font_13),
      ));

  Widget loginButton() {
    return GestureDetector(
      onTap: () async {
        showInSnackBar(message: "message");
        controller.validateData();
      },
      child: Container(
        width: Get.width,
        height: height_50,
        decoration: BoxDecoration(
          color: applyFilterColor,
          borderRadius: BorderRadius.circular(radius_10),
        ),
        child: Center(
          child: TextView(
            keySignIn.tr,
            textStyle: textStyleBodyMedium()
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _loginWithText() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              color: textFieldColor,
              thickness: width_0point3,
            ),
          ),
          TextView(keyOr.tr,
                  textStyle: textStyleBodyMedium().copyWith(color: greyColor))
              .paddingSymmetric(horizontal: margin_10),
          Expanded(
            child: Divider(
              color: textFieldColor,
              thickness: width_0point3,
            ),
          ),
        ],
      ).paddingOnly(top: margin_40, bottom: margin_15);

  Widget _socialIcons() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              await controller.handleAlreayLogin();
            },
            child: Container(
              width: width_70,
              padding: EdgeInsets.symmetric(vertical: margin_8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius_5),
                  border:
                      Border.all(color: lightGreyColor, width: width_0point8)),
              child: AssetImageWidget(
                iconsIcGoogle,
                imageHeight: height_20,
              ),
            ),
          ),
          SizedBox(
            width: margin_10,
          ),
          Container(
            width: width_70,
            padding: EdgeInsets.symmetric(vertical: margin_8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius_5),
                border:
                    Border.all(color: lightGreyColor, width: width_0point8)),
            child: AssetImageWidget(
              iconsIcFb,
              imageHeight: height_20,
            ),
          ),
          Visibility(
            visible: Platform.isIOS,
            child: Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: margin_8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius_5),
                    border: Border.all(
                        color: lightGreyColor, width: width_0point8)),
                child: AssetImageWidget(
                  iconsIcApple,
                  imageHeight: height_20,
                ),
              ).marginOnly(left: margin_10),
            ),
          ),
        ],
      );

  Widget _signup() => Text.rich(
        TextSpan(
            text: keyDoNotHaveAnAccount.tr,
            style: textStyleTitleSmall()
                .copyWith(color: Colors.grey, fontWeight: FontWeight.w300),
            children: [
              TextSpan(text: ' '),
              TextSpan(
                  text: keyRegister.tr,
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      controller.navigateToSignup();
                    },
                  style: textStyleTitleSmall().copyWith(
                      fontWeight: FontWeight.w600, color: applyFilterColor)),
            ]),
      ).paddingOnly(bottom: margin_25);
}
