

import 'package:base_project/app/export.dart';

class ForgotPasswordController extends GetxController {
  RxInt selectedContact = 0.obs;

  final PreferenceManger preferenceManger = Get.find<PreferenceManger>();

  TextEditingController merchantIdTextController = TextEditingController();
  TextEditingController riderIdTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController contactTextController = TextEditingController();
  TextEditingController countryCodeTextController = TextEditingController();

  FocusNode merchantIdFocusNode = FocusNode();
  FocusNode riderIdFocusNode = FocusNode();

  List<String> contactImage = [iconsIcSms, iconsIcEmail];

  List<String> contactText = [keyViaSMS.tr, keyViaEmail.tr];

  forgetPasswordOption() {
    if (localStorage.read(PreferenceManger.roleId) == roleRestaurant) {
      forgotPasswordApiCall();
    } else if (localStorage.read(PreferenceManger.roleId) == roleDriver) {
      forgotPasswordApiCall();
    } else {
      Get.toNamed(AppRoutes.forgotPasswordOption, arguments: {'type': selectedContact.value == 0 ? 'phone' : 'email'});
    }
  }

  forgotPasswordApiCall() {
    Map<String, dynamic> data = AuthRequestModel.forgotPasswordRequestModel(
        merchantId: localStorage.read(PreferenceManger.roleId) == roleRestaurant ? merchantIdTextController.text.trim().toString() : riderIdTextController.text.trim());

    repository.forgetPasswordApiCall(data).then((value) {
      if (value != null) {
        Get.back();
        if (localStorage.read(PreferenceManger.roleId) == roleRestaurant || localStorage.read(PreferenceManger.roleId) == roleDriver) {
          showInSnackBar(message: "${value.message}");
        } else {
          showInSnackBar(message: "${value.message} ${value.detail?.otp ?? ""}");
        }
      }
    }).onError((error, stackTrace) {
      showInSnackBar(message: error.toString());
    });
  }
}
