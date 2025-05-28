import 'package:base_project/app/export.dart';
import 'package:base_project/app/modules/authentication/controllers/forgot_password_options_controller.dart';

import '../../../core/widget/country_picker.dart';

class ForgotPasswordOptionScreen extends GetView<ForgotPasswrodOptionController> {
  final GlobalKey<FormState> forgotPasswordFormGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingColor: applyFilterColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: TextView(
              textAlign: TextAlign.center,
              keyLogo.tr,
              textStyle: textStyleHeadlineLarge().copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          AuthenticationScreenHeading(
            title: keyForgotPassword.tr,
            textStyle: textStyleHeadlineLarge().copyWith(color: applyFilterColor, fontSize: font_20),
          ).marginOnly(top: margin_40),
          TextView(keyForgotPasswordDescCustomer.tr, maxLines: 4, textAlign: TextAlign.start, textStyle: textStyleBodyLarge().copyWith(color: greyColor)),
          _form(),
          _continueButton()
        ],
      ).paddingSymmetric(horizontal: margin_20),
    );
  }

  _form() => Form(
        key: forgotPasswordFormGlobalKey,
        child: Column(
          children: [
            phoneNo()
            // Obx(() => controller.isPhone.value == true ? _mobileNumberTextField() : _emailTextField())
            /*localStorage.read(PreferenceManger.roleId) == roleRestaurant
                ? _merchantIdTextField()*/
            /* _riderIdTextField()*/
          ],
        ).paddingOnly(top: margin_20, bottom: margin_10),
      );

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

  _emailTextField() => TextFieldWidget(
        hint: keyEnterEmail.tr,
        labelText: keyEmail.tr,
        validate: (data) => Validator.validateEmail(data),
        textController: controller.emailTextController,
        focusNode: controller.emailFocusNode,
        inputType: TextInputType.emailAddress,
        inputAction: TextInputAction.next,
      ).paddingOnly(bottom: margin_15);

  Widget _continueButton() => MaterialButtonWidget(
        onPressed: () {
          controller.navigateToNextView();
        },
        minHeight: height_45,
        buttonRadius: radius_10,
        textColor: Colors.white,
        buttonColor: applyFilterColor,
        buttonText: keySend.tr,
      ).paddingOnly(top: margin_10);
}
