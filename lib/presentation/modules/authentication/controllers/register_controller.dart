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


class RegisterController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void dispose() {
    phoneController.dispose();
    nameController.dispose();
    dobController.dispose();
    nameFocus.dispose();
    phoneFocus.dispose();
    dobFocus.dispose();
   super.dispose();
  }

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();

  final nameFocus = FocusNode();
  final phoneFocus = FocusNode();
  final dobFocus = FocusNode();


  Future<void> pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked != null) {
      dobController.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }
  Rx<Country> selectedCountry = const Country(
    name: "India",
    flag: "🇮🇳",
    code: "IN",
    dialCode: "+91",
    minLength: 10,
    maxLength: 10,
  ).obs;

  void handleSubmit() {

  }

}
