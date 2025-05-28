/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../export.dart';

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
      loginUser();
    }
  }

  navigateToSignup() {
    Get.toNamed(
      AppRoutes.signupRoute,
    );
  }

  loginUser() async {
    String? token = await FirebaseMessaging.instance.getToken();
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    Map<String, dynamic> data = AuthRequestModel.loginRequestModel(
        password: passwordTextController.text.trim(),
        // id: localStorage.read(PreferenceManger.roleId) == roleCustomer ? merchantIdTextController.text.trim() : riderIdTextController.text.trim(),
        deviceType: repository.deviceType,
        deviceName: repository.deviceName,
        deviceToken: token, //repository.deviceID,
        countryCode: selectedCountry?.value.dialCode.contains("+") == true
            ? selectedCountry?.value.dialCode
            : "+${selectedCountry?.value.dialCode}",
        contactNo: mobileNumberTextController.text.trim(),
        androidDeviceInfoDeviceId: androidDeviceInfo.id,
        androidDeviceInfoDeviceName: androidDeviceInfo.device);
    repository.loginUserApi(data).then((value) async {
      if (value != null) {
        customLoader.hide();
        UserResponseModel userResponseModel = value;
        currentUserDataModel.value = userResponseModel;

        debugPrint('tokenBhej---->${userResponseModel.token ?? "111"}');
        preferenceManger.saveAuthToken(userResponseModel.token ?? "");

        preferenceManger.saveRole(userResponseModel.detail?.roleId ?? 0);
        await preferenceManger.saveRegisterData(userResponseModel.detail);
        if (isRemembered.value) {
          remberMeDataSave(userResponseModel.detail);
        } else {
          preferenceManger.clearRememberMeData();
        }
        if (userResponseModel.detail?.otpVerify == 1) {
          if (userResponseModel.detail?.is_profile_setup == 1) {
            Get.offAllNamed(AppRoutes.customerMainScreen);
          } else {
            Get.offAllNamed(
              AppRoutes.customerProfileSetup,
              arguments: {
                "fromOtp": true,
                "contact_no": userResponseModel.detail?.contactNo.toString(),
                "country_code":
                    userResponseModel.detail?.countryCode.toString(),
              },
            );
          }
        } else {
          showInSnackBar(message: "${userResponseModel.detail?.otp}");
          Get.toNamed(AppRoutes.otpVerificationRoute);
        }
        // if (userResponseModel.detail?.otpVerify == null || userResponseModel.detail?.otpVerify == 0) {
        //   showInSnackBar(message: "${userResponseModel.detail?.otp}");
        //   Get.toNamed(AppRoutes.otpVerificationRoute);
        // } else {
        //   if (userResponseModel.detail?.roleId.toString() == roleCustomer.toString()) {
        //     Get.offAllNamed(AppRoutes.customerMainScreen);
        //   }
        //   if (isRemembered.value == true) {
        //     remberMeDataSave(userResponseModel.detail);
        //   } else {
        //     if (localStorage.read(PreferenceManger.roleId) == roleCustomer) {
        //       localStorage.remove(PreferenceManger.rememberMe);
        //     }
        //   }
        // }
      }
    }).onError((error, stackTrace) {
      showInSnackBar(message: error.toString());
    });
  }

  remberMeDataSave(UserDataModel? detail) {
    if (detail?.roleId.toString() == roleRestaurant.toString()) {
      preferenceManger.saveRemeberMeData(
          RememberMeModel(
              roleId: roleRestaurant,
              riderMerchantId: detail?.merchantId ?? "",
              password: passwordTextController.text.toString()),
          roleId: detail?.roleId);
    } else if (detail?.roleId.toString() == roleDriver.toString()) {
      preferenceManger.saveRemeberMeData(
          RememberMeModel(
              roleId: roleDriver,
              name: selectedCountry?.value.name ?? "",
              flag: selectedCountry?.value.flag ?? "",
              code: selectedCountry?.value.code ?? "",
              dialCode: selectedCountry?.value.dialCode ?? "",
              minLength: selectedCountry?.value.minLength ?? 0,
              maxLength: selectedCountry?.value.maxLength ?? 0,
              riderMerchantId: detail?.merchantId,
              password: passwordTextController.text.toString(),
              phoneNumber: detail?.contactNo),
          roleId: detail?.roleId);
    } else {
      preferenceManger.saveRemeberMeData(
          RememberMeModel(
              roleId: roleCustomer,
              name: selectedCountry?.value.name ?? "",
              flag: selectedCountry?.value.flag ?? "",
              code: selectedCountry?.value.code ?? "",
              dialCode: selectedCountry?.value.dialCode ?? "",
              minLength: selectedCountry?.value.minLength ?? 0,
              maxLength: selectedCountry?.value.maxLength ?? 0,
              password: passwordTextController.text.toString(),
              phoneNumber: detail?.contactNo),
          roleId: detail?.roleId);
    }
  }

  dynamic userCredential;

  Future logInGoogle() async {
    try {
      userCredential = await signInWithGoogle();
    } catch (e) {
      googleSignIn.signOut();
      customLoader.hide();
      debugPrint("google error $e");
    }
  }

  Future signInWithGoogle() async {
    try {
      var token = await FirebaseMessaging.instance.getToken();
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
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken!,
        idToken: googleAuth.idToken!,
      );

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

      await FirebaseAuth.instance
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
      }).whenComplete(() {});
    } catch (error) {
      debugPrint("Error during sign-in: $error");
      googleSignIn.signOut();
      customLoader.hide();
    }
  }

  Future handleAlreayLogin() async {
    GoogleSignInAccount? currentUser = googleSignIn.currentUser;

    await googleSignIn.signOut();
    await logInGoogle();
    /*  if (currentUser != null) {
      debugPrint("User is signed in: ${currentUser.displayName}");
      await googleSignIn.signOut();
      await logInGoogle();
    } else {
      await logInGoogle();
      debugPrint("No user is signed in.");
    }*/
  }
}
