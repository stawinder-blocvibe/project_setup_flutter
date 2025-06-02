/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

/*========================Email Validator==============================================*/
import '../../export.dart';
import '../values/app_strings.dart';

class Validator {
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return keyEmailEmpty.tr;
    } else if (!GetUtils.isEmail(value.trim())) {
      return keyInvalidEmail.tr;
    }
    return null;
  }

  static String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return keyPasswordEmpty.tr;
    } else {
      if (!regex.hasMatch(value)) {
        return keyInvalidPassword.tr;
      } else {
        return null;
      }
    }
  }

  static String? validateNewPassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return keyNewPasswordEmpty.tr;
    } else {
      if (!regex.hasMatch(value)) {
        return keyInvalidPassword.tr;
      } else {
        return null;
      }
    }
  }

  static String? validateConfirmPasswordMatch(
      {String? value, String? password}) {
    if (value!.isEmpty) {
      return keyCPasswordEmpty.tr;
    } else if (value.length < 8) {
      return keyInvalidPassword.tr;
    } else if (value != password) {
      return keyPasswordMatc.tr;
    }
    return null;
  }

  static String? validatePhoneNumber({required String value, Country? selectedCountry}) {
    if (value == '') {
      return keyPhoneEmEmpty.tr;
    } else if (selectedCountry != null) {
      if (value.length < selectedCountry.minLength) {
        return keyPhoneNumberInvalid.tr;
      }
    } else if (!GetUtils.isPhoneNumber(value.trim())) {
      return keyPhoneNumberInvalid.tr;
    }
    return null;
  }

  static String? idChecker({required String value, required message}) {
    if (value.toString().trim().isEmpty) {
      return "$message ${keyCannotBeEmpty.tr}";
    }
    if (value.toString().length < 5 || value.toString().length > 10) {
      return "$message ${keyIdValidation.tr}";
    }
    return null;
  }

  static String? fieldChecker({
    required String value,
    required message,
  }) {
    if (value.toString().trim().isEmpty) {
      return "$message ${keyCannotBeEmpty.tr}";
    }
    return null;
  }

  static String? fieldPinChecker({required String value, required message}) {
    if (value.toString().trim().isEmpty) {
      return "$message ${keyCannotBeEmpty.tr}";
    } else if (value.toString().trim().length < 5 ||
        value.toString().trim().length > 6) {
      return "Enter valid pin code";
    }
    return null;
  }

  static String? zeroChecker({required String value, required message}) {
    if (value.toString().trim().isEmpty) {
      return "$message ${keyCannotBeEmpty.tr}";
    }
    if (int.parse(value.toString().trim()) <= 0) {
      return "$message ${keyCannotBeZero.tr}";
    }

    return null;
  }

  static bool validateStrongPassword(value) {
    var pattern =
        "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,}\$";
    RegExp regex = new RegExp(pattern);
    return (regex.hasMatch(value)) ? false : true;
  }
}

/*================================================== Password Validator ===================================================*/

class PasswordFormValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return keyPasswordEmpty.tr;
    } else if (value.length < 8) {
      return keyInvalidPassword.tr;
    }
    return null;
  }

  static String? validateConfirmPasswordMatch(
      {String? value,
      String? password,
      String? message,
      String? valueMessage}) {
    if (value!.isEmpty) {
      return valueMessage ?? strRepeatPasswordEmpty;
    } else if (value != password) {
      return message ?? strRepeatPasswordMatch;
    }
    return null;
  }

  static String? validatePasswordMatch(
      {String? value, String? confirmPassword}) {
    if (value!.isEmpty) {
      return keyCPasswordEmpty.tr;
    } else if (value.length < 8) {
      return keyInvalidPassword.tr;
    } else if (value != confirmPassword) {
      return keyPasswordMatc.tr;
    }
    return null;
  }

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
}

/*================================================== Phone Number Validator ===================================================*/

class PhoneNumberValidate {
  static String? validateMobile(String value) {
    if (value.isEmpty) {
      return keyPhoneEmEmpty.tr;
    } else if (value.length < 8 || value.length > 15) {
      return keyPhoneNumberInvalid.tr;
    } else if (!validateNumber(value)) {
      return keySpecialCharacter.tr;
    }
    return null;
  }

  static String? validatePhoneNumber(String value, Country? selectedCountry) {
    if (value == '') {
      return "Mobile number Cannot be empty";
    } else if (selectedCountry != null) {
      if (value.length < selectedCountry.minLength) {
        return "Please enter a Phone number between 8-15 digits";
      }
    } else if (!GetUtils.isPhoneNumber(value.trim())) {
      return "Please enter a Phone number between 8-15 digits";
    } else {}
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
  static String? fieldChecker(String? value, message) {
    if (value == null || value.toString().trim().isEmpty) {
      return "$message ${keyCannotBeEmpty.tr}";
    }
    return null;
  }
}
