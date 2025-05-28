/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:base_project/app/export.dart';

/*========================Email Validator==============================================*/

class EmailValidator {
  static String? validateEmail(String value, {FocusNode? focusNode}) {
    if (value.isEmpty) {
      if (focusNode != null) {
        focusNode.unfocus();
        focusNode.requestFocus();
      }
      return keyEmailEmpty.tr;
    } else if (!GetUtils.isEmail(value.trim())) {
      if (focusNode != null) {
        focusNode.unfocus();
        focusNode.requestFocus();
      }
      return keyInvalidEmail.tr;
    }
    return null;
  }

  static String? validateEmptyEmail(String value) {
    if (!GetUtils.isEmail(value.trim()) && value.isNotEmpty) {
      return keyInvalidEmail.tr;
    }
    return null;
  }
}

/*================================================== Password Validator ===================================================*/

class PasswordFormValidator {
  static String? validatePassword(String value) {
    var pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return keyPasswordEmpty.tr;
    } else if (value.length < 8) {
      return keyInvalidPassword.tr;
    } else if (!regExp.hasMatch(value)) {
      return keyPasswordNotSecure.tr;
    }
    return null;
  }

  static String? validateConfirmPasswordMatch(String? value, String? password) {
    if (value!.isEmpty) {
      return keyCPasswordEmpty.tr;
    } else if (value.length < 8) {
      return keyInvalidPassword.tr;
    } else if (value != password) {
      return keyPasswordMatch.tr;
    }
    return null;
  }
}

/*================================================== Phone Number Validator ===================================================*/

class PhoneNumberValidate {
  static String? validatePhoneNumber(String value, Country? selectedCountry) {
    if (value == '') {
      return "Mobile number cannot be empty";
    } else if (selectedCountry != null) {
      if (value.length < selectedCountry.minLength) {
        return "Please enter a Phone number between 8-15 digits";
      }
    } else if (!GetUtils.isPhoneNumber(value.trim())) {
      return "Please enter a Phone number between 8-15 digits";
    } else {}
    return null;
  }

  static String? validateMobile(String value, {FocusNode? focusNode}) {
    if (value.isEmpty) {
      if (focusNode != null) {
        focusNode.unfocus();
        focusNode.requestFocus();
      }
      return keyPhoneEmEmpty.tr;
    } else if (value.length < 8 || value.length > 15) {
      if (focusNode != null) {
        focusNode.unfocus();
        focusNode.requestFocus();
      }
      return keyPhoneNumberInvalid.tr;
    } else if (!validateNumber(value)) {
      if (focusNode != null) {
        focusNode.unfocus();
        focusNode.requestFocus();
      }
      return keySpecialCharacter.tr;
    }
    return null;
  }
}

bool validateNumber(String value) {
  var pattern = r'^[0-9]+$';
  RegExp regex = RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}

/*===============================Field Checker=================================================*/
class FieldChecker {
  static String? fieldChecker(String? value, message, {FocusNode? focusNode}) {
    if (value == null || value.toString().trim().isEmpty) {
      if (focusNode != null) {
        focusNode.unfocus();
        focusNode.requestFocus();
      }
      return "$message cannot be empty";
    }
    return null;
  }
}

class PriceFieldChecker {
  static String? fieldChecker(String? value, message, {FocusNode? focusNode}) {
    if (value == null || value.toString().trim().isEmpty) {
      if (focusNode != null) {
        focusNode.unfocus();
        focusNode.requestFocus();
      }
      return '$message cannot be empty';
    } else if (value.toString().trim().startsWith('0')) {
      if (focusNode != null) {
        focusNode.unfocus();
        focusNode.requestFocus();
      }
      return '$message cannot start with 0';
    }
    return null;
  }
}
