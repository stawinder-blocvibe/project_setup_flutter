

import 'package:base_project/app/export.dart';
import '../controllers/otp_verification_controller.dart';

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
          
          body: Stack(
            alignment: Alignment.center,
            children: [
              AssetImageWidget(stadiumBullBall,imageWidth: Get.width,imageHeight: Get.height,imageFitType: BoxFit.cover,),
              Positioned(
                  top: height_30,
                  child: AssetImageWidget(ballStreetLogo,imageWidth: Get.width*0.7,imageHeight: Get.height*0.15).marginOnly(top: height_50)),


              titleSubtitleWidget().paddingAll(margin_20).marginOnly(bottom: margin_70)
            ],
          ),
        ));
  }
  Widget titleSubtitleWidget(){
    return Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'OTP Verification',
          style: TextStyle(
            color: Colors.white,
            fontSize:35,

            fontWeight: FontWeight.w400,
            height: 1.0,
            letterSpacing: 1.60,
          ),
        ),
        SizedBox(
          width: 316,
          child: Text(
            'Enter the code from the sms we sent \nto ${controller.phone}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,

              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        Obx(()=> controller.start.value.toString()=="0"?SizedBox():timerView()),
        // if(false)
        _otpTextFields(),
        resend(),

        appButton(
          onTap: (){

            if (controller.otpTextController.text != '') {
              if(controller.otpTextController.text.toString()!="777777"){
                showInSnackBar(message: "Wrong OTP !!".tr);
                return;
              }
              controller.validateData();
            } else {
              showInSnackBar(message: "Enter valid otp first !!".tr);
            }
            // Get.toNamed(AppRoutes.mainParentRoute);
          },
          child:Text(
          'Submit',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF004225),
            fontSize: 18,
            fontFamily: 'TAN - SONGBIRD',
            fontWeight: FontWeight.w800,
            letterSpacing: 2,
          ),
        ),),

      ],
    );
 }
  Widget timerView() {
    return Container(
      width: Get.width * 0.86,
      child: Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {},
          child: Text(
            controller.start.value.toString() != "0"
                ? controller.start.value < 10
                ? '00:0${controller.start.value.toString()} ${"Sec".tr}'
                : '00:${controller.start.value.toString()} ${"Sec".tr}'
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
  _otpTextFields() => Form(
    key: controller.otpVerifyFormGlobalKey,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Pinput(
      controller: controller.otpTextController,
      focusNode: controller.otpFocusNode,
      length: 6,
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
        width: height_60,
        height: height_45,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontFamily: 'Maleah',
          fontWeight: FontWeight.w700,
          letterSpacing: 0.22,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(radius_20),
          border: Border.all(color: pinputBorderColor, width: width_1),
        ),
      ),
      showCursor: true,
      validator: (data) =>
          Validator.fieldChecker(value: data ?? " ", message: "keyOtp".tr),
      separator: SizedBox(
        width: margin_5,
      ),
      isCursorAnimationEnabled: true,
      disabledPinTheme: PinTheme(
        width: height_60,
        height: height_45,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontFamily: 'Maleah',
          fontWeight: FontWeight.w700,
          letterSpacing: 0.22,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(radius_20),
          border: Border.all(color: pinputBorderColor, width: width_1),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: height_60,
        height: height_45,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontFamily: 'Maleah',
          fontWeight: FontWeight.w700,
          letterSpacing: 0.22,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(radius_20),
          border: Border.all(color: pinputBorderColor, width: width_1),
        ),
      ),
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
    ).paddingOnly(top: margin_10),
  );
  Widget resend() {
    return  Obx(
          () => controller.start.value == 0
          ? controller.isResendLoading
          ? CircularProgressIndicator(
        color: otpColor,
      ).paddingSymmetric(horizontal: margin_130)
          : Center(

        child: GestureDetector(
          onTap: () {
            controller.start.value = 30;
            controller.startTimer();
            controller.resendOtp();
          },
          child: resendOtp().marginOnly(top: margin_5, left: margin_7),
        ),
      )
          : SizedBox(),
    ).marginOnly(bottom: margin_10);
  }

  Widget resendOtp(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't receive the OTP?",
        textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Maleah',
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          " Resend",
        textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.red,
            fontSize: 18,
            fontFamily: 'Maleah',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

}
