

import 'package:base_project/app/export.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingColor: appColor,
      ),
      body: Column(
        children: [
          ScreenHeading(title: keyChangePassword.tr),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(
                () => Column(
                  children: [
                    _form(),
                    MaterialButtonWidget(
                      minHeight: height_45,
                      buttonColor: applyFilterColor,
                      buttonRadius: radius_10,
                      onPressed: () {
                        if (controller.changePasswordGlobalKey.currentState!.validate()) {
                          controller.changePassword();
                        }
                      },
                      buttonText: keySave.tr,
                    ).marginOnly(top: margin_25)
                  ],
                ).marginAll(margin_15),
              ),
            ),
          )
        ],
      ),
    );
  }

  _form() => Form(
        key: controller.changePasswordGlobalKey,
        child: Column(
          children: [_passwordTextField(), _confirmPasswordTextField()],
        ),
      );

  Widget _passwordTextField() => TextFieldWidget(
        hint: keyEnterNewPassword.tr,
        labelText: keyNewPassword.tr,
        borderEnabled: true,
        isBorderColor: true,
        isShadow: false,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(horizontal: margin_15, vertical: margin_13),
        textController: controller.passwordTextController,
        focusNode: controller.passwordFocusNode,
        inputType: TextInputType.visiblePassword,
        maxLength: 35,
        formatter: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
        validate: (data) => Validator.validateNewPassword(data),
        obscureText: controller.viewPassword.value,
        suffixIcon: GetInkWell(
          onTap: () => controller.showOrHidePasswordVisibility(),
          child: AssetImageWidget(controller.viewPassword.value ? iconsIcHide : iconsIcShow).marginOnly(right: margin_8),
        ),
        inputAction: TextInputAction.next,
      ).paddingOnly(bottom: margin_15);

  _confirmPasswordTextField() => GetInkWell(
        onTap: () => controller.showOrHideConfirmPasswordVisibility(),
        child: TextFieldWidget(
          hint: keyEnterConfirmPassword.tr,
          labelText: keyConfirmPassword.tr,
          borderEnabled: true,
          isBorderColor: true,
          isShadow: false,
          fillColor: Colors.transparent,
          contentPadding: EdgeInsets.symmetric(horizontal: margin_15, vertical: margin_13),
          validate: (data) => Validator.validateConfirmPasswordMatch(password: controller.passwordTextController.text.trim(), value: data),
          textController: controller.confirmPasswordTextController,
          focusNode: controller.confirmPasswordFocusNode,
          inputType: TextInputType.visiblePassword,
          obscureText: controller.confirmViewPassword.value,
          suffixIcon: GetInkWell(
            onTap: () => controller.showOrHideConfirmPasswordVisibility(),
            child: AssetImageWidget(controller.confirmViewPassword.value ? iconsIcHide : iconsIcShow).marginOnly(right: margin_8),
          ),
          inputAction: TextInputAction.done,
        ).paddingOnly(bottom: margin_10),
      );
}
