import 'package:base_project/app/export.dart';

class ForgotPasswrodOptionController extends GetxController {
  RxBool viewPassword = true.obs;
  RxBool isRemembered = false.obs;

  final PreferenceManger preferenceManger = Get.find<PreferenceManger>();
  final GlobalKey<FormState> loginFormGlobalKey = GlobalKey<FormState>();

  TextEditingController mobileNumberTextController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController riderIdTextController = TextEditingController();

  FocusNode mobileNumberFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode riderIdFocusNode = FocusNode();
  var userType;
  RxBool isPhone = false.obs;

  Rx<Country>? selectedCountry = Country(
    name: "India",
    flag: "🇮🇳",
    code: "IN",
    dialCode: "+91",
    minLength: 10,
    maxLength: 10,
  ).obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getArguments();

    super.onReady();
  }

  /*==============================================================================Get arguments====================================================================*/
  getArguments() {
    if (Get.arguments != null) {
      isPhone.value = Get.arguments["type"] == "phone" ? true : false;
    }
  }

  showOrHidePasswordVisibility() {
    viewPassword.value = !viewPassword.value;
  }

  rememberMe(value) {
    isRemembered.value = value;
  }

  void navigateToNextView() {
    forgotPasswordApiCall();
  }

  forgotPasswordApiCall() {
    debugPrint(
        'selectedCountry?.value.dialCode====${selectedCountry?.value.dialCode}');
    Map<String, dynamic> data = AuthRequestModel.forgotPasswordRequestModel(
        countryCode: selectedCountry?.value.dialCode.contains("+") == true
            ? selectedCountry?.value.dialCode
            : '+${selectedCountry?.value.dialCode}',
        contactNo: mobileNumberTextController.text.trim().toString());
    repository.forgetPasswordApiCall(data).then((value) {
      if (value != null) {
        // if (isPhone.value) {
        //   Get.toNamed(AppRoutes.otpVerificationRoute,
        //       arguments: {fromForgetPasswordKey: true, phoneKey: mobileNumberTextController.text.trim(), countryDialCodeekey: selectedCountry?.value.dialCode});
        // } else {
        //   Get.toNamed(AppRoutes.otpVerificationRoute, arguments: {fromForgetPasswordKey: true, emailKey: emailTextController.text.trim()});
        // }
        Get.toNamed(AppRoutes.otpVerificationRoute, arguments: {
          fromForgetPasswordKey: true,
          phoneKey: mobileNumberTextController.text.trim(),
          countryDialCodeekey:
              selectedCountry?.value.dialCode.contains("+") == true
                  ? selectedCountry?.value.dialCode
                  : '+${selectedCountry?.value.dialCode}'
        });
        showInSnackBar(message: "${keyOtpIs.tr} ${value.detail?.otp ?? ""}");
      }
    }).onError((error, stackTrace) {
      showInSnackBar(message: error.toString());
    });
  }
}
