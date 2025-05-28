/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:base_project/app/export.dart';

class StaticPageController extends GetxController {
  RxInt pageType = 0.obs;

  Rx<StaticPageResponseModel>? staticPageResponseModel = StaticPageResponseModel().obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      pageType.value = Get.arguments[argStaticPageType];
    }
    super.onInit();
  }

  @override
  void onReady() {
    loadPage();
    super.onReady();
  }

  RxBool isLoading = false.obs;
  void loadPage() {
    isLoading.value = true;
    repository.getStaticPageApiCall(pageType.value).then((value) {
      if (value != null) {
        staticPageResponseModel?.value = value;
        isLoading.value = false;
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      showInSnackBar(message: error.toString());
    });
  }
}
