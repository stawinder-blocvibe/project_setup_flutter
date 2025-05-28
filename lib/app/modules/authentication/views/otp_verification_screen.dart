

import 'package:base_project/app/export.dart';

class OtpVerificationScreen extends GetView<OtpVerificationController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          if (Get.previousRoute == AppRoutes.signupRoute) {
            Get.offAllNamed(AppRoutes.loginRoute);
          } else {
            Get.back();
          }
          return Future.value(true);
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
              showBackButton: true,
              leadingColor: applyFilterColor,
              bgColor: Colors.white,
              onTap: () {
                if (Get.previousRoute == AppRoutes.signupRoute) {
                  Get.offAllNamed(AppRoutes.loginRoute);
                } else {
                  Get.back();
                }
              }),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: TextView(
                    keyLogo.tr,
                    textStyle: textStyleBody1()
                        .copyWith(color: Colors.black, fontSize: font_22),
                  ),
                ),
                SizedBox(
                  height: height_50,
                ),
                welcomeBack(),
                _otpTextFields(),
                verifyButton(),
                _resend()
              ],
            ).paddingSymmetric(horizontal: margin_20),
          ),
        ));
  }

  Widget welcomeBack() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          textAlign: TextAlign.center,
          keyVerification.tr,
          textStyle: textStyleBody1().copyWith(
              color: applyFilterColor,
              fontWeight: FontWeight.w600,
              fontSize: font_22),
        ),
        SizedBox(
          height: height_5,
        ),
        TextView(
          maxLines: 2,
          textAlign: TextAlign.start,
          keyOtpText.tr,
          textStyle: textStyleBody1().copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: font_11),
        ),
      ],
    );
  }

  _otpTextFields() => Form(
        key: controller.otpVerifyFormGlobalKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Pinput(
          controller: controller.otpTextController,
          focusNode: controller.otpFocusNode,
          length: 4,
          cursor: Padding(
            padding: EdgeInsets.symmetric(vertical: margin_15),
            child: VerticalDivider(
              color: applyFilterColor,
              thickness: margin_1point2,
            ),
          ),
          pinContentAlignment: Alignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          // androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
          listenForMultipleSmsOnAndroid: true,
          defaultPinTheme: PinTheme(
            width: height_50,
            height: height_50,
            textStyle: textStyleBodyLarge().copyWith(color: Colors.black),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(radius_8),
              border: Border.all(color: Colors.transparent, width: width_1),
            ),
          ),
          showCursor: true,
          validator: (data) =>
              Validator.fieldChecker(value: data ?? " ", message: keyOtp.tr),
          separator: SizedBox(
            width: margin_5,
          ),
          isCursorAnimationEnabled: true,
          disabledPinTheme: PinTheme(
            height: height_50,
            width: height_50,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: textFieldColor, width: width_0point8))),
          ),
          focusedPinTheme: PinTheme(
            width: height_50,
            height: height_50,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(radius_5),
              border: Border.all(color: applyFilterColor, width: width_1),
            ),
          ),
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        ).paddingOnly(top: margin_50),
      );

  Widget verifyButton() {
    return GestureDetector(
      onTap: () {
        if (controller.otpTextController.text != '') {
          controller.validateData();
        } else {
          showInSnackBar(message: keyOtpCantEmpty.tr);
        }
      },
      child: Container(
        width: Get.width,
        height: height_45,
        decoration: BoxDecoration(
          color: applyFilterColor,
          borderRadius: BorderRadius.circular(radius_10),
        ),
        child: Center(
          child: TextView(
            keyVerify.tr,
            textStyle: textStyleBodyMedium()
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ).marginOnly(top: margin_40, left: margin_8, right: margin_8),
    );
  }

  timerView() {
    return Container(
      width: Get.width * 0.86,
      child: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {},
          child: Text(
            controller.start.value.toString() != "0"
                ? controller.start.value < 10
                    ? '00:0${controller.start.value.toString()} ${keySec.tr}'
                    : '00:${controller.start.value.toString()} ${keySec.tr}'
                : '',
            style: textStyleBody1().copyWith(
                color: applyFilterColor,
                fontSize: font_14,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget _resend() {
    return Row(
      children: [
        Obx(
          () => controller.start.value == 0
              ? controller.isResendLoading
                  ? CircularProgressIndicator(
                      color: otpColor,
                    ).paddingSymmetric(horizontal: margin_130)
                  : Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          controller.start.value = 30;
                          controller.startTimer();
                          controller.resendOtp();
                        },
                        child: Text(
                          keyResend.tr,
                          style: TextStyle(
                            decorationColor: Colors.black,
                            color: Colors.grey,
                            fontSize: font_15,
                          ),
                        ).marginOnly(top: margin_5, left: margin_7),
                      ),
                    )
              : timerView(),
        ),
      ],
    ).marginOnly(top: margin_10);
  }
}
