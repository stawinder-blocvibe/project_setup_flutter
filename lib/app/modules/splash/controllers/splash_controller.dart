

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:base_project/app/export.dart';

import '../../../core/values/app_strings.dart';
import '../../../core/widget/no_internet_connection.dart';
import '../../../data/models/network_controller.dart';

class SplashController extends GetxController {
  var timer;
  RxBool isFirstTime = false.obs;
  RxString currentLogo = iconsLogo.obs;
  UserResponseModel userResponseModel = UserResponseModel();
  MessageResponseModel messageResponseModel = MessageResponseModel();

  @override
  void onInit() {
    PreferenceManger().saveRole(roleCustomer);
    Get.put(NetworkController());
    hitDateCheckAPI();

    // checkInternetAvailable();
    // _navigateToNextScreen();
    super.onInit();
  }

  void manageDefaultLanguage() async {
    var defaultLanguage = await PreferenceManger().getDefaultLanguage();
    debugPrint('defaultLanguage $defaultLanguage');
    if (defaultLanguage == "en") {
      Get.updateLocale(TranslationService.localeEN_US);
    } else if (defaultLanguage == "fa") {
      Get.updateLocale(TranslationService.localeDari);
    } else if (defaultLanguage == "ps") {
      Get.updateLocale(TranslationService.localePS);
    }
  }

  void checkInternetAvailable() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Get.to(
        NoInternetConnectionScreen(
          screenType: 0,
        ),
      );
    } else {
      // hitDateCheckAPI();
      onInternetAvailable();
      update();
    }
  }

  onInternetAvailable() {
    // var token =await preferenceManger.getAuthToken();
    /* if ( token == null) {
      _navigateToNextScreen();
    } else {
      _navigateToNextScreen();
    }*/

    _navigateToNextScreen();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  _navigateToNextScreen() => Timer(Duration(milliseconds: 3500), () async {
        try {
          var token = await preferenceManger.getAuthToken();

          bool? isFirstLaunched = await preferenceManger.getStatusFirstLaunch();

          debugPrint("isFirstLaunched--->$token>>$isFirstLaunched");
          if (isFirstLaunched != null && isFirstLaunched) {
            if (token != null) {
              checkUser();
            } else {
              Get.offAllNamed(AppRoutes.loginRoute);
            }
          } else {
            Get.offAllNamed(AppRoutes.onBoardingRoute);
          }
        } catch (e, st) {
          debugPrint('error While Splash-->$e,$st');
        }
      });

  //*===================================================================== Check App validity ==========================================================*

  bool appExpirationDateCheck() {
    return DateTime(2025, 01, 13)
        .isAfter(DateTime.now().add(Duration(days: 15)));
  }

  appExpirationDialog() => Get.dialog(
        AlertDialog(
          title: Container(
              height: height_150,
              width: Get.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius_10),
                    topRight: Radius.circular(radius_10),
                  )),
              child: AssetImageWidget(iconsAlert, imageFitType: BoxFit.cover)),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          content: Container(
            padding: EdgeInsets.symmetric(
              horizontal: margin_10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextView(keyDemoExpired.tr,
                        maxLines: 5,
                        textAlign: TextAlign.center,
                        textStyle: textStyleHeadingMedium()
                            .copyWith(color: Colors.black))
                    .marginOnly(bottom: height_10),
                TextView(keyAppDemoExpiredDesc.tr,
                        maxLines: 5,
                        textAlign: TextAlign.center,
                        textStyle:
                            textStyleTitleLarge().copyWith(color: Colors.black))
                    .marginOnly(bottom: height_10),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius_10)),
        ),
        barrierColor: Colors.grey.shade300,
        barrierDismissible: false,
      );
  final DateTime now = DateTime.now();

  /// date check

  void hitDateCheckAPI() {
    APIRepository().dateCheckApiCall().then((value) async {
      if (value != null) {
        messageResponseModel = value;
        final String date1 = DateFormat('yyyy-MM-dd').format(now);
        DateTime d1 = DateTime.parse(date1);
        DateTime d2 = DateTime.parse(messageResponseModel.dateCheck ?? date1);
        if (d1.isAfter(d2)) {
          appExpirationDialog();
        } else {
          manageDefaultLanguage();
          checkInternetAvailable();
        }
        update();
      }
    }).onError((error, stackTrace) {
      try {
        if (error == strConnectionError) {
          Get.to(NoInternetConnectionScreen(
            screenType: 0,
          ))?.then((value) {
            hitDateCheckAPI();
          });
          update();
        } else {
          Get.toNamed(AppRoutes.loginRoute);
        }
      } catch (e) {}
    });
  }

  checkUser() {
    repository.checkUserApiCall().then((value) {
      if (value != null) {
        userResponseModel = value;
        currentUserDataModel.value = userResponseModel;
        preferenceManger.saveRegisterData(userResponseModel.detail);
        checkUserStep();
      }
    }).onError((error, stackTrace) {
      Get.offAllNamed(AppRoutes.loginRoute);
      // Get.offAllNamed(AppRoutes.roleSelectionRoute);
    });
  }

  checkUserStep() async {
    UserDataModel userData = await preferenceManger.getSavedLoginData();
    if (userData.roleId == roleCustomer) {
      if (userData.otpVerify == 1 && userData.is_profile_setup == 1) {
        Get.offAllNamed(AppRoutes.customerMainScreen);
      } else {
        Get.offAllNamed(AppRoutes.loginRoute);
      }
    } else if (userData.roleId == roleRestaurant) {
      if (userData.isAdded == 0) {
        Get.offAllNamed(AppRoutes.loginRoute);
      } else {
        Get.offAllNamed(AppRoutes.restaurantMainRoute);
      }
    } else if (userData.roleId == roleDriver) {
      if (userData.isDefault == 0) {
        Get.offAllNamed(AppRoutes.loginRoute);
      } else if (userData.isDefault == 1) {
        Get.offAllNamed(AppRoutes.loginRoute);
      } else if (userData.isDefault == 2) {
        Get.toNamed(AppRoutes.driverMainRoute);
      }
    }
  }
}
