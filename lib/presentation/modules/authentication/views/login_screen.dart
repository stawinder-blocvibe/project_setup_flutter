

import 'package:base_project/app/export.dart';

import '../../../../app/core/widget/country_picker.dart';
import '../controllers/login_controller.dart';



class LoginScreen extends GetView<LoginController> {
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
              AssetImageWidget(stadiumBullBall,imageWidth: Get.width,imageHeight: Get.height,),
              Positioned(
                  top: height_30,
                  child: AssetImageWidget(ballStreetLogo,imageWidth: Get.width*0.7,imageHeight: Get.height*0.15).marginOnly(top: height_50)),


              titleSubtitleWidget().paddingAll(margin_20).marginOnly(bottom: margin_60)
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
          'Verify your phone number',
          style: TextStyle(
            color: Colors.white,
            fontSize:35,
            fontFamily: 'TAN - SONGBIRD',
            fontWeight: FontWeight.w400,
            height: 1.0,
            letterSpacing: 1.60,
          ),
        ),
        Text(
          'We have send you an One Time Password(OTP) on this mobile Number',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Maleah',
            fontWeight: FontWeight.w700,
          ),
        ),
        phoneNo(),
        appButton(
          onTap: (){
            Get.toNamed(AppRoutes.otpVerificationRoute);
          },
          child:Text(
          'GET OTP',
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
}
