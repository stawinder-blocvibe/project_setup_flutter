

import 'package:base_project/app/export.dart';

import '../models/data_model/user_data_model.dart';

class OtpVerificationController extends GetxController {
  final GlobalKey<FormState> otpVerifyFormGlobalKey = GlobalKey<FormState>();
  TextEditingController otpTextController = TextEditingController();
  FocusNode otpFocusNode = FocusNode();

  final PreferenceManger _preferenceManger = Get.find<PreferenceManger>();
  UserDataModel userData = UserDataModel();
  dynamic phone, countryDialCode, email;
  Timer? timer;
  bool fromForgetPassword = false;
  bool isFromLogin = false;
  bool isResendLoading = false;
  RxInt start = 30.obs;
  RxString secondsStr = '00:30'.obs;

  TextEditingController mobileNumberTextController = TextEditingController();
  Rx<Country>? selectedCountry = Country(
    name: "India",
    flag: "🇮🇳",
    code: "IN",
    dialCode: "+91",
    minLength: 10,
    maxLength: 10,
  ).obs;
  FocusNode mobileNumberFocusNode = FocusNode();

  @override
  void onInit() {
    startTimer();
    getArguments();
    super.onInit();
  }

  @override
  void onReady() {
    otpFocusNode.requestFocus();
    getLoggedInUserData();
    super.onReady();
  }

  getArguments() {
    if (Get.arguments != null) {
      isFromLogin = Get.arguments[argIsFromLogin] ?? false;
      debugPrint('isFromLogin${isFromLogin}');
      fromForgetPassword = Get.arguments[fromForgetPasswordKey] ?? false;
      phone = Get.arguments[phoneKey] != null ? Get.arguments[phoneKey] : "";
      email = Get.arguments[emailKey] != null ? Get.arguments[emailKey] : "";
      countryDialCode = Get.arguments[countryDialCodeekey] != null
          ? Get.arguments[countryDialCodeekey]
          : "";
      debugPrint(countryDialCode);
    }
  }

  getLoggedInUserData() async {
    userData = await _preferenceManger.getSavedLoginData();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
          secondsStr.value = '00:' + (start.value).toString().padLeft(2, '0');
        }
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  validateData() {
    if (otpVerifyFormGlobalKey.currentState!.validate()) {
      verification();
    }
  }

  verification() {
    Map<String, dynamic> data = AuthRequestModel.verifyOtpRequestModel(
        otp: otpTextController.text.trim(),
        contactNo: userData.contactNo ?? phone ?? null,
        email: email ?? null,
        countryCode: userData.countryCode?.toString().replaceFirst("++", "+") ??
            "$countryDialCode" ??
            null);

    debugPrint('data--->${data.toString()}');
    APIRepository().verifyOtp(data).then((value) {
      if (value != null) {
        currentUserDataModel.value = value;
        if (fromForgetPassword) {
          Get.toNamed(AppRoutes.changePasswordRoute, arguments: {
            fromForgetPasswordKey: true,
            phoneKey: phone,
            emailKey: email,
            countryDialCodeekey:
                countryDialCode.toString().replaceFirst("++", "+")
          });
        } else {
          Get.offAllNamed(
            AppRoutes.customerProfileSetup,
            arguments: {
              "fromOtp": true,
              "contact_no":
                  currentUserDataModel.value.detail?.contactNo.toString(),
              "country_code": currentUserDataModel.value.detail?.countryCode
                  .toString()
                  .replaceFirst("++", "+"),
            },
          );
        }
        showInSnackBar(message: currentUserDataModel.value.message.toString());
        /*else if (userResponseModel.detail?.roleId.toString() == roleCustomer.toString() && userResponseModel.detail?.otpVerify == 1) {
          preferenceManger.saveAuthToken(userResponseModel.token ?? "");
          preferenceManger.saveRole(userResponseModel.detail?.roleId ?? 0);
          preferenceManger.saveRegisterData(userResponseModel.detail);

          Get.offAllNamed(AppRoutes.customerMainScreen);
          showInSnackBar(message: keySignupSuccessful.tr);
        }*/
        // else if (userResponseModel.detail?.roleId.toString() == roleDriver.toString() && userResponseModel.detail?.isDefault == 0) {
        //   saveData(userResponseModel);
        //   Get.offAllNamed(AppRoutes.driverProfileSetupRoute);
        // } else if (userResponseModel.detail?.roleId.toString() == roleDriver.toString() && userResponseModel.detail?.isDefault == 1) {
        //   saveData(userResponseModel);
        //   Get.offAllNamed(AppRoutes.driverMainRoute);
        // } else if (userResponseModel.detail?.roleId.toString() == roleRestaurant.toString() && userResponseModel.detail?.isAdded == 0) {
        //   saveData(userResponseModel);
        //   Get.offAllNamed(AppRoutes.addRestaurantRoute);
        // } else if (userResponseModel.detail?.roleId.toString() == roleRestaurant.toString() && userResponseModel.detail?.isAdded == 1) {
        //   saveData(userResponseModel);
        // } else {
        //   Get.offAllNamed(AppRoutes.loginRoute);
        // }
        saveData(currentUserDataModel.value);
      }
    }).onError((error, stackTrace) {
      showInSnackBar(message: error.toString());
    });
  }

  saveData(userResponseModel) {
    preferenceManger.saveAuthToken(userResponseModel.token ?? "");
    preferenceManger.saveRole(userResponseModel.detail?.roleId ?? 0);
    preferenceManger.saveRegisterData(userResponseModel.detail);
  }

  resendOtp() {
    Map<String, dynamic> data = AuthRequestModel.resendOtpRequestModel(
        contactNo: userData.contactNo ?? phone ?? null,
        email: email ?? null,
        countryCode: userData.countryCode ?? "+${countryDialCode}" ?? null);
    repository.resendOtpApiCall(data).then((value) {
      if (value != null) {
        otpTextController.clear();
        showInSnackBar(message: "${value.message} ${value.detail.otp}");
      }
    }).onError((error, stackTrace) {
      showInSnackBar(message: error.toString());
    });
  }
}
