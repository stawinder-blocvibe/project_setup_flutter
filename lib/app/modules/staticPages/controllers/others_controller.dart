

import 'package:base_project/app/export.dart';

class OthersController extends GetxController {
  final PreferenceManger preferenceManger = Get.find<PreferenceManger>();

  RxList othersListIcons = [
    iconLanguageIcon,
    iconsIcHelp,
    iconsIcFaq,
    iconsIcPrivate,
    iconsIcTerms,
    iconsIcAbout,
    iconsIcContactUs,
    Icons.password_rounded
  ].obs;

  Rx<UserDataModel> user = UserDataModel().obs;
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // executes after build
      user.value = await preferenceManger.getSavedLoginData();
      user.refresh();
      debugPrint('user--->${user.toJson()}');
      if (user.value.isSocial == 0 || user.value.isSocial == false) {
        othersListTitle.value.add(keyChangePassword.tr);
        othersListTitle.refresh();
      }
    });
    super.onInit();
  }

  RxList othersListTitle = [
    keyLanguage.tr,
    keyHelp.tr,
    keyFAQ.tr,
    keyPrivacyPolicy.tr,
    keyTermsNConditions.tr,
    keyAboutUs.tr,
    keyContactUs.tr,
    // keyChangePassword.tr,
  ].obs;
}
