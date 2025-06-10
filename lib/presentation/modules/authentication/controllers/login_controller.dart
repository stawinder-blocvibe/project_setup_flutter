/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../app/export.dart';
import '../models/data_model/user_data_model.dart';
import '../models/request_data_model/RememberMeModel.dart';
import '../models/response_models/user_data_model.dart';


class LoginController extends GetxController {
  RxBool viewPassword = true.obs;
  RxBool isRemembered = false.obs;

  final PreferenceManger preferenceManger = Get.find<PreferenceManger>();
  final GlobalKey<FormState> loginFormGlobalKey = GlobalKey<FormState>();

  TextEditingController mobileNumberTextController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController merchantIdTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController riderIdTextController = TextEditingController();

  FocusNode mobileNumberFocusNode = FocusNode();
  FocusNode merchantIdFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode riderIdFocusNode = FocusNode();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  var userType;

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
    saveType();
    super.onInit();
  }

  saveType() async {
    PreferenceManger().saveRole(roleCustomer);
  }

  @override
  void onReady() {
    getRememberMeData();
    super.onReady();
  }

  getRememberMeData() async {
    userType = await PreferenceManger().getRole();
    if (userType == roleRestaurant) {
      RememberMeModel? rememberMeModel =
          await preferenceManger.getsaveRemeberData(roldId: userType);
      if (rememberMeModel != null) {
        isRemembered.value = true;
        merchantIdTextController.text = rememberMeModel.riderMerchantId ?? "";
        passwordTextController.text = rememberMeModel.password ?? "";
      } else {
        isRemembered.value = false;
      }
    } else if (userType == roleDriver) {
      RememberMeModel? rememberMeModel =
          await preferenceManger.getsaveRemeberData(roldId: userType);
      if (rememberMeModel != null) {
        isRemembered.value = true;
        riderIdTextController.text = rememberMeModel?.riderMerchantId ?? "";
        passwordTextController.text = rememberMeModel?.password ?? "";
        mobileNumberTextController.text = rememberMeModel?.phoneNumber ?? "";
        selectedCountry?.value = Country(
                name: rememberMeModel.name!,
                flag: rememberMeModel.flag!,
                code: rememberMeModel.code!,
                dialCode: rememberMeModel.dialCode!,
                minLength: rememberMeModel.minLength!,
                maxLength: rememberMeModel.maxLength!) ??
            selectedCountry!.value;
        selectedCountry?.refresh();
      } else {
        isRemembered.value = false;
      }
    } else {
      RememberMeModel? rememberMeModel =
          await preferenceManger.getsaveRemeberData(roldId: userType);
      if (rememberMeModel != null) {
        isRemembered.value = true;
        passwordTextController.text = rememberMeModel.password ?? "";
        mobileNumberTextController.text = rememberMeModel.phoneNumber ?? "";
        selectedCountry?.value = Country(
                name: rememberMeModel.name!,
                flag: rememberMeModel.flag!,
                code: rememberMeModel.code!,
                dialCode: rememberMeModel.dialCode!,
                minLength: rememberMeModel.minLength!,
                maxLength: rememberMeModel.maxLength!) ??
            selectedCountry!.value;
        selectedCountry?.refresh();
      } else {
        isRemembered.value = false;
      }
    }
  }

  showOrHidePasswordVisibility() {
    viewPassword.value = !viewPassword.value;
  }

  rememberMe(value) {
    isRemembered.value = value;
  }

  validateData() {
    if (loginFormGlobalKey.currentState!.validate()) {
      showInSnackBar(message: "message_11");
    }
  }

  navigateToSignup() {
    Get.toNamed(
      AppRoutes.signupRoute,
    );
  }





  Future signInWithGoogle() async {
    try {
      var token = "dfdfdfd";//await FirebaseMessaging.instance.getToken();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        debugPrint("Google sign-in failed: user is null");
        return; // Exit early if the user didn't sign in
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        throw Exception(keyGoogleAuthFailed.tr);
      }

      // Create a new credential
      final credential = "";
      // GoogleAuthProvider.credential(
      //   accessToken: googleAuth.accessToken!,
      //   idToken: googleAuth.idToken!,
      // );

      debugPrint("Google User Info:");
      debugPrint("Token: ${googleAuth.idToken!}");
      debugPrint("Email: ${googleUser.email}");
      debugPrint(
          "First Name: ${googleUser.displayName?.split(" ").first ?? ""}");
      debugPrint("Last Name: ${googleUser.displayName?.split(" ").last ?? ""}");
      debugPrint("User ID: ${googleUser.id}");
      debugPrint("Photo URL: ${googleUser.photoUrl}");
      DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;

     /* await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        debugPrint('Successfully signed in: $value');
        // Optionally: Hit your social login API here

        Map<String, dynamic> data = AuthRequestModel.socialLoginReq(
            deviceType: repository.deviceType,
            deviceName: repository.deviceName,
            udid: androidDeviceInfo.id,
            deviceToken: token, //repository.deviceID,
            email: googleUser.email,
            fullName: '${googleUser.displayName?.split(" ").first ?? ""}',
            imgUrl: '${googleUser.photoUrl}',
            userId: '${googleUser.id}',
            username: "${googleUser.email}",
            provider: '1');
        repository.socialLoginUserApi(data).then((value) async {
          if (value != null) {
            customLoader.hide();
            UserResponseModel userResponseModel = value;
            currentUserDataModel.value = userResponseModel;
            preferenceManger.saveAuthToken(userResponseModel.token ?? "");
            preferenceManger.saveRole(userResponseModel.detail?.roleId ?? 0);
            await preferenceManger.saveRegisterData(userResponseModel.detail);
            if (isRemembered.value) {
              remberMeDataSave(userResponseModel.detail);
            } else {
              preferenceManger.clearRememberMeData();
            }

            // debugPrint(
            //     'userResponseModel.detail?.otpVerify-->${userResponseModel.detail?.otpVerify}>>${userResponseModel.detail?.is_profile_setup}');

            debugPrint(
                'userResponseModel.detail?.isSocial----->${userResponseModel.detail?.isSocial}');
            if (userResponseModel.detail?.otpVerify == 1 &&
                userResponseModel.detail?.is_profile_setup == 1) {
              Get.offAllNamed(AppRoutes.customerMainScreen);

              if (userResponseModel.detail?.is_profile_setup == 1) {
                Get.offAllNamed(AppRoutes.customerMainScreen);
              }
            } else if (userResponseModel.detail?.is_profile_setup != 1) {
              Get.toNamed(
                AppRoutes.customerProfileSetup,
                arguments: {
                  "fromOtp": true,
                  "contact_no": userResponseModel.detail?.contactNo.toString(),
                  "country_code":
                      userResponseModel.detail?.countryCode.toString(),
                  "isSocial": userResponseModel.detail?.isSocial
                },
              );
            } else {
              showInSnackBar(message: "${userResponseModel.detail?.otp}");
              Get.toNamed(AppRoutes.otpVerificationRoute);
            }
          }
          customLoader.hide();
        }).onError((error, stackTrace) {
          // showInSnackBar(message: error.toString());
          customLoader.hide();
        });
      }).whenComplete(() {});*/
    } catch (error) {
      debugPrint("Error during sign-in: $error");
      googleSignIn.signOut();
      customLoader.hide();
    }
  }








  /////

   final ValueNotifier<String?> errorTextNotifier = ValueNotifier(null);

  void validatePhoneNumber() {
    final text = mobileNumberTextController.text.trim();

    if (text.isEmpty) {
      errorTextNotifier.value = 'Phone number is required';
    } else if (!RegExp(r'^\d{10}$').hasMatch(text)) {
      errorTextNotifier.value = 'Enter a valid 10-digit number';
    } else {
      errorTextNotifier.value = null; // Valid
    }
  }

  void dispose() {
    mobileNumberTextController.dispose();
    errorTextNotifier.dispose();
  }


    sendApiCall() {
    repository.sendOtpApi(phone: mobileNumberTextController.text).then((value) async {
      debugPrint("Send Otp Response: $value");
      if(value["message"]!=null){
        await showInSnackBar(message: value["message"]);
        Get.toNamed(
            AppRoutes.otpVerificationRoute,
            arguments: {
          "phone": mobileNumberTextController.text,
        });
      }

    });
  }
}
