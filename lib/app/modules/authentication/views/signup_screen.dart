
import 'package:base_project/app/core/widget/country_picker.dart';

import '../../../core/values/app_strings.dart';
import '../../../export.dart';

/// New
class SignUpScreen extends GetView<SignUpController> {
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: Get.width,
            height: Get.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appBar(),
                  localStorage.read(PreferenceManger.roleId) == roleCustomer
                      ? _customerForm()
                      : localStorage.read(PreferenceManger.roleId) ==
                              roleRestaurant
                          ? _restaurantForm()
                          : _driverForm(),
                  _signupButton(),
                  _signupWithText(),
                  _socialIcons(),
                  _login()
                ],
              ).paddingSymmetric(horizontal: margin_15),
            ),
          )),
    );
  }

  Widget appBar() {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Icon(
        Icons.arrow_back,
        size: height_25,
        color: applyFilterColor,
      ),
    ).marginOnly(top: margin_40);
  }

  _customerForm() => Form(
        key: controller.customerFormGlobalKey,
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
                      fontSize: font_20),
                ),
              ),
              SizedBox(
                height: height_30,
              ),
              welcomeBack(),
              SizedBox(
                height: height_20,
              ),
              phoneNo(),
              _passwordTextField(),
              _confirmPasswordTextField(),
              _iAgree()
            ],
          ),
        ),
      );

  Widget welcomeBack() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          textAlign: TextAlign.center,
          keyRegister.tr,
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
          keyCreateYourAccount.tr,
          textStyle: textStyleHeadlineLarge().copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              fontSize: font_14),
        ),
      ],
    ).marginSymmetric(horizontal: margin_4);
  }

  _restaurantForm() => Form(
        key: controller.merchantFormGlobalKey,
        child: Obx(
          () => Column(
            children: [
              _merchantIdTextField(),
              _merchantTypeDropDown(),
              phoneNo(),
              _passwordTextField(),
              _confirmPasswordTextField(),
              _iAgree()
            ],
          ).paddingOnly(top: margin_20, bottom: margin_10),
        ),
      );

  _driverForm() => Form(
        key: controller.driverFormGlobalKey,
        child: Obx(
          () => Column(
            children: [
              _firstNameTextField(),
              _lastNameTextField(),
              phoneNo(),
              _riderIdTextField(),
              _passwordTextField(),
              _confirmPasswordTextField(),
              _iAgree(),
            ],
          ).paddingOnly(top: margin_20, bottom: margin_10),
        ),
      );

  _firstNameTextField() => TextFieldWidget(
        hint: keyEnterYourFirstName.tr,
        labelText: keyFirstName.tr,
        validate: (data) =>
            Validator.fieldChecker(value: data, message: keyFirstName.tr),
        textController: controller.firstNameTextController,
        focusNode: controller.firstNameFocusNode,
        inputType: TextInputType.name,
        inputAction: TextInputAction.next,
      ).paddingOnly(bottom: margin_15);

  _lastNameTextField() => TextFieldWidget(
        hint: keyEnterYourLastName.tr,
        labelText: keyLastName.tr,
        validate: (data) =>
            Validator.fieldChecker(value: data, message: keyLastName.tr),
        textController: controller.lastNameTextController,
        focusNode: controller.lastNameFocusNode,
        inputType: TextInputType.name,
        inputAction: TextInputAction.next,
      ).paddingOnly(bottom: margin_15);

  _merchantIdTextField() => TextFieldWidget(
        hint: keyEnterMerchantId.tr,
        labelText: keyMerchantID.tr,
        validate: (data) =>
            Validator.idChecker(value: data, message: keyMerchantID.tr),
        textController: controller.merchantIdTextController,
        maxLength: idMaxLength,
        focusNode: controller.merchantIdFocusNode,
        inputType: TextInputType.phone,
        formatter: [
          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
        ],
        inputAction: TextInputAction.next,
      ).paddingOnly(bottom: margin_15);

  Widget _merchantTypeDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(keyBusinessType.tr,
                textStyle: textStyleLabelMeduim()
                    .copyWith(color: greyColor, fontWeight: FontWeight.w600))
            .marginOnly(bottom: margin_5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: margin_0),
          width: Get.width,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(radius_5)),
          child: Container(
            padding: EdgeInsets.only(bottom: margin_5),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: textFieldColor))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<CommonItemModel>(
                underline: Divider(
                  color: textFieldColor,
                ),
                isDense: true,
                hint: TextView(
                  keySelect.tr,
                  textStyle:
                      textStyleTitleSmall().copyWith(color: hintTextColor),
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.grey,
                  size: height_22,
                ).paddingOnly(right: margin_1),
                isExpanded: true,
                style: textStyleTitleMedium().copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: font_14),
                value: controller.selectedMerchantType.value,
                items: controller.merchantTypeList.map((CommonItemModel value) {
                  return DropdownMenuItem<CommonItemModel>(
                      value: value, child: Text(value.title.toString()));
                }).toList(),
                onChanged: (CommonItemModel? value) {
                  controller.selectedMerchantType.value = value;
                },
              ),
            ),
          ),
        ),
      ],
    ).paddingOnly(bottom: margin_15);
  }

  _riderIdTextField() => TextFieldWidget(
        hint: keyEnterYourId.tr,
        labelText: keyRiderID.tr,
        validate: (data) =>
            Validator.idChecker(value: data, message: keyRiderID.tr),
        textController: controller.riderIdTextController,
        maxLength: idMaxLength,
        focusNode: controller.riderIdFocusNode,
        inputType: TextInputType.phone,
        inputAction: TextInputAction.done,
      ).paddingOnly(bottom: margin_15);

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
      ).marginOnly(left: margin_0),
    );
  }

  _passwordTextField() => TextFieldWidget(
        hint: keyEnterPassword.tr,
        labelText: keyPassword.tr,
        isShadow: false,
        fillColor: Colors.white,
        validate: (data) => Validator.validatePassword(data),
        textController: controller.passwordTextController,
        focusNode: controller.passwordFocusNode,
        maxLength: 35,
        contentPadding:
            EdgeInsets.symmetric(horizontal: margin_15, vertical: margin_13),
        formatter: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
        inputType: TextInputType.visiblePassword,
        obscureText: controller.viewPassword.value,
        suffixIcon: GetInkWell(
          onTap: () => controller.showOrHidePasswordVisibility(),
          child: AssetImageWidget(
                  controller.viewPassword.value ? iconsIcHide : iconsIcShow)
              .paddingOnly(bottom: margin_4, right: margin_8),
        ),
        inputAction: TextInputAction.next,
      ).paddingOnly(bottom: margin_15);

  _confirmPasswordTextField() => GetInkWell(
        onTap: () => controller.showOrHideConfirmPasswordVisibility(),
        child: TextFieldWidget(
          hint: keyEnterConfirmPassword.tr,
          labelText: keyConfirmPassword.tr,
          isShadow: false,
          fillColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(horizontal: margin_15, vertical: margin_13),
          validate: (value) {
            return PasswordFormValidator.validateConfirmPasswordMatch(
                value: value,
                valueMessage: "$stringRepeatPassword $strCannotBeEmpty",
                password: controller.passwordTextController.text);
          },
          textController: controller.confirmPasswordTextController,
          focusNode: controller.confirmPasswordFocusNode,
          inputType: TextInputType.visiblePassword,
          maxLength: 35,
          formatter: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
          obscureText: controller.confirmViewPassword.value,
          suffixIcon: GetInkWell(
            onTap: () => controller.showOrHideConfirmPasswordVisibility(),
            child: AssetImageWidget(controller.confirmViewPassword.value
                    ? iconsIcHide
                    : iconsIcShow)
                .paddingOnly(bottom: margin_4, right: margin_8),
          ),
          inputAction: TextInputAction.done,
        ).paddingOnly(bottom: margin_10, left: margin_0),
      );

  _iAgree() => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
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
                value: controller.isTermsAccepted.value,
                onChanged: (value) => controller.acceptTerms(value)),
            SizedBox(width: margin_5),
            Expanded(
              child: Text.rich(
                TextSpan(
                    text: keyIAgreeWithAll.tr,
                    style: textStyleBodyMedium().copyWith(color: Colors.black),
                    children: [
                      TextSpan(text: ' '),
                      TextSpan(
                          text: keyTermsNConditions.tr,
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () => Get.toNamed(
                                AppRoutes.staticPageRoute,
                                arguments: {argStaticPageType: pageTypeTerms}),
                          style: textStyleBodyMedium().copyWith(
                              color: applyFilterColor,
                              fontWeight: FontWeight.w600)),
                    ]),
              ),
            ),
          ]).marginOnly(left: margin_0);

  Widget _signupButton() => MaterialButtonWidget(
        onPressed: () {
          controller.validate();
        },
        buttonColor: applyFilterColor,
        minHeight: height_50,
        buttonRadius: radius_10,
        textColor: Colors.white,
        buttonText: keyRegister.tr,
      ).marginOnly(left: margin_0, top: margin_10);

  Widget _signupWithText() => Row(
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
      ).paddingOnly(top: margin_30, bottom: margin_15);

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

  Widget _login() => Center(
        child: Text.rich(
          TextSpan(
              text: keyAlreadyHaveAnAccount.tr,
              style: textStyleTitleSmall()
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
              children: [
                TextSpan(text: ' '),
                TextSpan(
                    text: keyLogin.tr,
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    style: textStyleTitleSmall().copyWith(
                        fontWeight: FontWeight.w600, color: colorAppColor)),
              ]),
        ).paddingOnly(top: margin_20, bottom: margin_20),
      );
}
