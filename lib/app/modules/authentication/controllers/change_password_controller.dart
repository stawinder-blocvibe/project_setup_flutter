/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:base_project/app/export.dart';

class ChangePasswordController extends GetxController {
  RxBool viewPassword = true.obs;
  RxBool confirmViewPassword = true.obs;
  final GlobalKey<FormState> changePasswordGlobalKey = GlobalKey<FormState>();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  dynamic phone, countryDialCode, email;
  Timer? timer;
  bool fromForgetPassword = false;
  Rx<UserDataModel> userData = UserDataModel().obs;

  showOrHidePasswordVisibility() {
    viewPassword.value = !viewPassword.value;
  }

  @override
  void onInit() {
    getArguments();
    super.onInit();
  }

  Future getArguments() async {
    userData.value = await preferenceManger.getSavedLoginData();

    debugPrint('userData.value?.toJson()----->${userData.value.toJson()}');
    fromForgetPassword = true;
    phone = userData.value.contactNo ?? "";
    email = userData.value.email ?? "";
    countryDialCode = userData.value.countryCode;
  }

  showOrHideConfirmPasswordVisibility() {
    confirmViewPassword.value = !confirmViewPassword.value;
  }

  changePassword() {
    debugPrint('countryDialCode>>${countryDialCode}');
    Map<String, dynamic> data = AuthRequestModel.changePasswordRequestModel(
        countryCode: countryDialCode.contains("+")
            ? countryDialCode
            : "+$countryDialCode" ?? null,
        contactNo: phone ?? null,
        email: email ?? null,
        password: passwordTextController.text.trim(),
        confirmPassword: confirmPasswordTextController.text.trim());
    repository
        .changePasswordApiCall(data, fromForgetPassword: true)
        .then((value) {
      if (value != null) {
        CommonMessageResponseModel data = value;
        if (fromForgetPassword) {
          Get.offAllNamed(AppRoutes.loginRoute);
        } else {
          Get.find<PreferenceManger>().clearLoginData();
          Get.offAllNamed(AppRoutes.loginRoute);
        }
        showInSnackBar(message: data.message ?? "");
      }
    }).onError((error, stackTrace) {
      showInSnackBar(message: error.toString());
    });
  }
}
