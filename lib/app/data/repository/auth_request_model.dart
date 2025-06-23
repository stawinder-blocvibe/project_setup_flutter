  

import '../../export.dart';

class AuthRequestModel {
  /*==================================================Login Request Model==============================================*/
  static loginRequestModel({
    String? countryCode,
    String? contactNo,
    String? id,
    required String? password,
    deviceType,
    deviceName,
    deviceToken,
    androidDeviceInfoDeviceName,
    androidDeviceInfoDeviceId,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["LoginForm[username]"] = contactNo;
    data["LoginForm[country_code]"] = countryCode;
    data["LoginForm[rider_id]"] = id;
    data["LoginForm[role]"] = roleCustomer;
    data["LoginForm[password]"] = password;
    data["LoginForm[device_type]"] = deviceType;
    data["LoginForm[device_name]"] = deviceName;
    data["LoginForm[device_token]"] = deviceToken;
    data["LoginForm[device_name]"] = androidDeviceInfoDeviceName;
    data["LoginForm[device_type]"] = Platform.isIOS ? 2 : 1;
    data["LoginForm[device_udid]"] = androidDeviceInfoDeviceId;
    return data;
  }

  /*==================================================Login Request Model==============================================*/
  static forgotPasswordRequestModel({
    String? email,
    String? contactNo,
    String? countryCode,
    String? merchantId,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (email != null) data["User[email]"] = email;
    if (countryCode != null) data["User[country_code]"] = countryCode;
    if (contactNo != null) data["User[contact_no]"] = contactNo;
    if (merchantId != null) data["User[merchant_id]"] = merchantId;
    return data;
  }

  static socialLoginReq(
      {var userId,
      var email,
      var fullName,
      var username,
      var provider,
      var imgUrl,
      var deviceToken,
      var deviceType,
      dynamic udid,
      var deviceName}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HaLogin[user_id]'] = userId;
    data['HaLogin[email]'] = email;
    data['HaLogin[full_name]'] = fullName;
    data['HaLogin[login_provider]'] = provider;
    data['HaLogin[img_url]'] = imgUrl;
    data['HaLogin[role_id]'] = '2';
    data['LoginForm[device_token]'] = deviceToken;
    data['LoginForm[device_type]'] = deviceType;
    data['LoginForm[device_name]'] = deviceName;
    data['LoginForm[device_udid]'] = udid;

    return data;
  }

/*===================================================Register Request Model==============================================*/
  static registerRequestData({
    //   String? firstName,
    // String? lastName,
    // String? merchantId,
    // int? typeId,
    // String? email,
    String? password,
    String? confirmPassword,
    required String? countryCode,
    required String? contactNumber,
    int? roleId,
    // int? gender,
    // String? dob,
    // var deviceToken,
    // var deviceType,
    // var deviceName
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data["User[first_name]"] = firstName;
    // data["User[last_name]"] = lastName;
    // data["User[merchant_id]"] = merchantId;
    // data["User[type_id]"] = typeId;
    // data["User[email]"] = email;
    data["User[password]"] = password;
    data['confirm_password'] = confirmPassword;
    data["User[country_code]"] = countryCode;
    data["User[contact_no]"] = contactNumber;
    // data['LoginForm[device_token]'] = deviceToken;
    // data['LoginForm[device_type]'] = deviceType;
    // data['LoginForm[device_name]'] = deviceName;
    data["User[role_id]"] = roleId;
    // data["User[gender]"] = gender;
    // data["User[date_of_birth]"] = dob;

    return data;
  }

  /*===================================================Profile creation Request Model==============================================*/
  static profileCreationRequestData({
    required var profileFile,
    required String? fullName,
    required String? email,
    required String? mobileNo,
    required String? currentUtr,
    required String? homeCourt,
    required String? rating,
    required var certification,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["User[profile_file]"] = profileFile;
    data["User[full_name]"] = fullName;
    data["User[email]"] = email;
    data["User[contact_no]"] = mobileNo;
    data["User[current_utr]"] = currentUtr;
    data["User[address]"] = homeCourt;
    data["User[rating]"] = rating;
    data["User[certification]"] = certification;
    return data;
  }

  /*==================================================choose level Request Model==============================================*/
  static chooseLevelRequestModel({
    required var level,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["User[level]"] = level;
    return data;
  }

  /*==================================================Verify Otp Request Model==============================================*/
  static verifyOtpRequestModel({
    required String? otp,
    String? contactNo,
    String? countryCode,
    String? email,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (email != null && email != '') data["User[email]"] = email;
    data["User[otp]"] = otp;
    if (countryCode != null && countryCode != "")
      data["User[country_code]"] = countryCode;
    if (contactNo != null && contactNo != '')
      data["User[contact_no]"] = contactNo;

    return data;
  }

  /*==================================================Resend Otp Request Model==============================================*/
  static resendOtpRequestModel(
      {String? email, String? contactNo, String? countryCode}) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (email != null) data["User[email]"] = contactNo;
    if (contactNo != null) data["User[contact_no]"] = contactNo;
    if (countryCode != null) data["User[country_code]"] = countryCode;
    return data;
  }

  /*====================================================Forgot password Request Model====================================*/
  static changePasswordRequestModel(
      {required String password,
      required String confirmPassword,
      contactNo,
      email,
      countryCode}) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (email != null && email != '') data["User[email]"] = email;
    if (contactNo != null && contactNo != "")
      data["User[contact_no]"] = contactNo;
    if (countryCode != null && contactNo != null)
      data["User[country_code]"] = countryCode;
    data["User[password]"] = password;
    data["User[confirm_password]"] = confirmPassword;
    return data;
  }

  static socialLoginRequestModel({
    required String fullName,
    required String username,
    required String email,
    required String mobileNumber,
    required String deviceType,
    required String deviceName,
    required String deviceToken,
    required String socialId,
    required String socialType,
    required String profileImage,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["full_name"] = fullName;
    data["username"] = username;
    data["email"] = email;
    data["mobile_no"] = mobileNumber;
    data["device_type"] = deviceType;
    data["device_name"] = deviceName;
    data["device_token"] = deviceToken;
    data["social_id"] = socialId;
    data["social_type"] = socialType;
    data["profile_pic"] = profileImage;
    return data;
  }

  static sendMessageReq({
    int? toID,
    int? orderID,
    String? message,
  }) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Chat[message]]'] = message;
    data['Chat[type_id]'] = 0;
    data['Chat[request_id]'] = orderID;
    data['Chat[to_id]'] = toID;
    return data;
  }

  static logCrashErrorReq({
    error,
    packageVersion,
    phoneModel,
    ip,
    stackTrace,
  }) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Log[error]'] = error;
    data['Log[link]'] = packageVersion;
    data['Log[referer_link]'] = phoneModel;
    data['Log[user_ip]'] = ip;
    data['Log[description]'] = stackTrace;
    return data;
  }

  static addVehicleDetail({
    required String vehicleModel,
    required String vehicleName,
    required String vehicleYear,
    required String licensePlate,
    required String vehicleColor,
  }) {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["Vehicle[title]"] = vehicleName;
    data["Vehicle[model]"] = vehicleModel;
    data["Vehicle[year]"] = vehicleYear;
    data["Vehicle[license_plate]"] = licensePlate;
    data["Vehicle[color]"] = vehicleColor;
    return data;
  }

  static uploadProfileRequest(
      {var profileImage,
      var firstName,
      var lastName,
      var email,
      var contactNo,
      var countryCode,
      var dob,
      var gender,
      var licence,
      List? files}) {
    Map<String, dynamic> data = Map<String, dynamic>();
    if (profileImage != null) {
      data['User[profile_file]'] = profileImage;
    }
    data["User[first_name]"] = firstName;
    data["User[last_name]"] = lastName;
    if (email != null) {
      data["User[email]"] = email;
    }
    if (contactNo != null) {
      data["User[contact_no]"] = contactNo;
    }
    if (countryCode != null) {
      data["User[country_code]"] = countryCode;
    }

    data["User[date_of_birth]"] = dob;
    data["User[gender]"] = gender;
    if (licence != null) {
      data["User[license_file]"] = licence;
    }
    if (files != null) {
      files.asMap().forEach((index, value) {
        data["File[key][$index]"] = value;
      });
    }
    return data;
  }

  static contatctUsRequestModel({
    String? name,
    String? phone,
    String? countryCode,
    String? descrption,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["ContactUs[title]"] = name;
    data["ContactUs[contact_no]"] = phone;
    data["ContactUs[country_code]"] = countryCode;
    data["ContactUs[description]"] = descrption;
    return data;
  }
}
