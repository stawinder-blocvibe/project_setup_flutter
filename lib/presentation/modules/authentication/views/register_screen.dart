

import 'package:base_project/app/core/utils/helper_function.dart';
import 'package:base_project/app/export.dart';

import '../../../../app/core/widget/country_picker.dart';
import '../../../../app/core/widget/custom_input_field.dart';
import '../controllers/login_controller.dart';
import '../controllers/register_controller.dart';



class RegisterScreen extends GetView<RegisterController> {
 final controller = Get.put(RegisterController());
 final _formKey = GlobalKey<FormState>();
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
                  top: height_15,
                  child: AssetImageWidget(ballStreetLogo,imageWidth: Get.width*0.7,imageHeight: Get.height*0.15).marginOnly(top: height_50)),

              titleSubtitleWidget().paddingAll(margin_20).marginOnly(bottom: margin_60)
            ],
          ),
        ));
  }

  Widget titleSubtitleWidget(){
    return Column(
      spacing: 12,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello! Register to\nget started',
          style: TextStyle(
            color: Colors.white,
            fontSize:30,
             fontWeight: FontWeight.w600,
            height: 1.0,

          ),
        ),

        Form(
            key: _formKey,
            child:
            Column(
              spacing: 12,
          children:[
              TextFieldWidget(
              hint: 'Enter Your Full Name',
              textController: controller.nameController,
              focusNode: controller.nameFocus,
              validate: (data)=>Validator.fieldChecker(value: data, message: "First name".tr),
              inputType: TextInputType.name,
              contentPadding:  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              fillColor: Colors.transparent,
              prefixIcon: const Icon(CupertinoIcons.profile_circled, color: Colors.white,size: 20,).marginOnly(left: 15),
              style: const TextStyle(color: Colors.white),
              hintStyle: const TextStyle(color: Colors.white70),
              inputAction: TextInputAction.next,
            ),

            TextFieldWidget(
              hint: 'Enter Your Mobile Number',
              validate: (data) =>
                  Validator.validatePhoneNumber(value: data, selectedCountry
                      : controller.selectedCountry.value),
              textController: controller.phoneController,
              maxLength: idMaxLength,
              focusNode: controller.phoneFocus,
              inputType: TextInputType.phone,
              contentPadding:  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              prefixIcon: const Icon(Icons.phone_android, color: Colors.white,size: 20,).marginOnly(left: 15),
              formatter: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),              ],
              inputAction: TextInputAction.next,
              style: const TextStyle(color: Colors.white),
              hintStyle: const TextStyle(color: Colors.white70),
            ),
            TextFieldWidget(
              hint: 'Enter Your Date of Birth',
              textController: controller.dobController,
              focusNode: controller.dobFocus,
              validate: (data)=>Validator.fieldChecker(value: data, message: "Date of birth".tr),
              inputType: TextInputType.datetime,
              contentPadding:  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),              fillColor: Colors.transparent,
              prefixIcon: const Icon(Icons.calendar_month, color: Colors.white,size: 20,).marginOnly(left: 15),
              style: const TextStyle(color: Colors.white),
              hintStyle: const TextStyle(color: Colors.white70),
              inputAction: TextInputAction.next,
              readOnly: true,
              onTap: (){
                controller.pickDate();
              },
            ),


          ],
        )).marginOnly(top: margin_5),

        appButton(
          onTap: () async {
            validate();
            // Get.toNamed(AppRoutes.otpVerificationRoute);
          },
          child:const Text(
          'Next',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF004225),
            fontSize: 18,
            fontWeight: FontWeight.w800,
            letterSpacing: 2,
          ),
        ),).marginOnly(top: margin_15),
        registerNow().marginOnly(top: margin_5),
      ],
    );
  }






  Widget registerNow(){
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: const Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Already registered ? ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: 'Login now',
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
      ),
    );
  }


  void validate(){
    if (_formKey.currentState?.validate() ?? false) {
      // Proceed with validated data
      final name = controller.nameController.text.trim();
      final phone = controller.phoneController.text.trim();
      final dob = controller.dobController.text.trim();

      // For demonstration:
      print("Name: $name");
      print("Phone: $phone");
      print("DOB: $dob");
      
      showInSnackBar(message: "Great! You have successfully registered. $name");
      controller.handleSubmit();
    }
  }
}
