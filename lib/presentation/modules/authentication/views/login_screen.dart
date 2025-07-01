

import 'package:base_project/app/core/utils/helper_function.dart';
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
          backgroundColor: Colors.black,
          resizeToAvoidBottomInset: false,
          body: Stack(
            alignment: Alignment.center,
            children: [
              AssetImageWidget(stadiumBgAsset??stadiumBullBall,imageWidth: Get.width,imageHeight: Get.height,imageFitType: BoxFit.cover,),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Verify your phone number',
          style: TextStyle(
            color: Colors.white,
            fontSize:font_22,
            fontWeight: FontWeight.w600,
            height: 1.0,

          ),
        ),
         Text(
          'We have send you an One Time Password(OTP) on this mobile Number',
          style: TextStyle(
            color: Colors.white,
            fontSize:font_12point5,
            fontWeight: FontWeight.w700,
          ),
        ),
        buildPhoneNumberField(
          textController: controller.mobileNumberTextController,
          errorText: controller.errorTextNotifier.value,
          focusNode: controller.mobileNumberFocusNode,
          onChanged: (_) => controller.validatePhoneNumber(),
        ).marginOnly(top: margin_8)??
        phoneNo(),
        appButton(
          onTap: () async {

            if(controller.mobileNumberTextController.text.trim().isEmpty){
              controller.errorTextNotifier.value = "Please enter your mobile number";
              return;
            }
            else if(controller.errorTextNotifier.value==null){
              controller.sendApiCall();
            }

            // Get.toNamed(AppRoutes.otpVerificationRoute);
          },
          child: Text(
          'GET OTP',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF004225),
            fontSize: font_16,
            fontWeight: FontWeight.w800,
            letterSpacing: 2,
          ),
        ),).marginOnly(top: margin_15),
        if(false)
        registerNow().marginOnly(top: margin_5),
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


  Widget buildPhoneNumberField({
    required TextEditingController textController,
    required String? errorText,
    required Function(String) onChanged,
    required FocusNode focusNode,
  }) {
    return ValueListenableBuilder<String?>(
      valueListenable: controller.errorTextNotifier,
      builder: (BuildContext context, value, Widget? child) {
        return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1D3B1D),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: focusNode.hasFocus ? Colors.yellow : Colors.yellow.shade700,
                  width: 1.5,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                children: [
                  const Icon(Icons.phone_android, color: Colors.white,size: 20,),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: textController,
                      focusNode: focusNode,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(color: Colors.white),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],

                      decoration: const InputDecoration(

                        hintText: 'Enter Your Mobile Number',
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,

                      ),
                      onChanged: onChanged,
                    ),
                  ),
                ],
              ),
            ),
            if (value != null && value.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 12),
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.redAccent, fontSize: 13),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget registerNow(){
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.signupRoute);
      },
      child: const Text.rich(
        TextSpan(
          children: [
        TextSpan(
        text: 'Dont registered Yet ? ',
        style: TextStyle(
        color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      TextSpan(
        text: 'Registered Now',
        style: TextStyle(
          color: const Color(0xFFFF4E4E),
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      ],
          ),
          textAlign: TextAlign.center,
          ),
    );
  }

}
