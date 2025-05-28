

import 'package:base_project/app/export.dart';

class PreferenceManger {
  static const String isFirstLaunch = "isFirstLaunch";
  static const String isServicesFirstLaunchProvinces =
      "isServicesFirstLaunchProvinces";
  static const String authToken = "authToken";
  static const String roleId = "roleId";
  static const String loginResponseModel = "loginResponseModel";
  static const String staticResponseModel = "staticResponseModel";
  static const String rememberMe = "rememberMe";
  static const String rememberMeDriver = "rememberMeDriver";
  static const String rememberMeMerchant = "rememberMeMerchant";
  static const String isNotification = "isNotification";
  static const String email = "email";
  static const String password = "password";
  static const String rememberMeTeacher = "rememberMeTeacher";
  static const String notificationOn = "notificationOn";
  static const String restaurantModel = "restaurantModel";
  static const String defaultLanguage = "defaultLanguage";
  static const String fcmToken = "";

  firstLaunch(bool? isFirstCheck) {
    localStorage
        .write(isFirstLaunch, isFirstCheck)
        .onError((error, stackTrace) {
      debugPrint(error.toString());
      return false;
    });
    localStorage.read(
      isFirstLaunch,
    );
  }

  setFirstLaunchProvinces(bool? state) {
    localStorage
        .write(isServicesFirstLaunchProvinces, state)
        .onError((error, stackTrace) {
      debugPrint(error.toString());
      return false;
    });
    localStorage.read(
      isServicesFirstLaunchProvinces,
    );
  }

  saveAuthToken(String? token) async {
    localStorage.write(authToken, token);
  }

  getAuthToken() {
    return localStorage.read(authToken);
  }

  saveFcmToken(String? token) async {
    localStorage.write(fcmToken, token);
  }

  getFcmToken() {
    return localStorage.read(fcmToken);
  }

  saveRole(int? role) {
    localStorage.write(roleId, role);
  }

  saveLanguage(String languageCode) {
    debugPrint("languageCode:::${languageCode}");
    localStorage.write(defaultLanguage, languageCode);
  }

  Future getDefaultLanguage() async {
    return await localStorage.read(defaultLanguage) ?? "en";
  }

  saveRemeberMeData(RememberMeModel? model, {roleId}) async {
    localStorage.write(
        roleId == roleCustomer
            ? rememberMe
            : roleId == roleDriver
                ? rememberMeDriver
                : rememberMeMerchant,
        jsonEncode(model));
  }

  Future getsaveRemeberData({roldId}) async {
    Map<String, dynamic>? userMap;
    final userStr = await localStorage.read(roldId == roleCustomer
        ? rememberMe
        : roldId == roleDriver
            ? rememberMeDriver
            : rememberMeMerchant);
    if (userStr != null) userMap = jsonDecode(userStr) as Map<String, dynamic>;
    if (userMap != null) {
      RememberMeModel user = RememberMeModel.fromJson(userMap);
      return user;
    }
    return null;
  }

  Future getRole() async {
    return await localStorage.read(roleId);
  }

  getStatusFirstLaunch() {
    return localStorage.read(isFirstLaunch) ?? false;
  }

  getStatusProvincesFirstLaunch() {
    return localStorage.read(isServicesFirstLaunchProvinces) ?? false;
  }

  Future saveRegisterData(UserDataModel? model) async {
    await localStorage.write(loginResponseModel, jsonEncode(model));
  }

  getSavedLoginData() async {
    Map<String, dynamic>? userMap;
    final userStr = await localStorage.read(loginResponseModel);

    debugPrint('userStr-->${userStr.toString()}');
    if (userStr != null) userMap = jsonDecode(userStr) as Map<String, dynamic>;
    if (userMap != null) {
      UserDataModel user = UserDataModel.fromJson(userMap);
      return user;
    }
    return null;
  }

  clearRememberMeData() {
    localStorage.remove(rememberMe);
    localStorage.remove(rememberMeDriver);
    localStorage.remove(rememberMeMerchant);
  }

  clearLoginData() {
    localStorage.remove(loginResponseModel);
    localStorage.remove(authToken);
    localStorage.remove(notificationOn);
  }

  Future saveNotification(bool? notify) async {
    await localStorage.write(notificationOn, notify);
  }

  isNotificationOn() {
    return localStorage.read(notificationOn);
  }
}
