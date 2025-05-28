

import 'package:base_project/app/export.dart';

class FaqController extends GetxController {
  RxList<FaqItem> faqItemsList = <FaqItem>[].obs;

  @override
  void onReady() {
    loadFaqData();
    super.onReady();
  }

  void loadFaqData() {
    customLoader.show(Get.overlayContext);
    repository.getFAQApiCall().then((value) {
      if (value != null) {
        FaqResponseModel faqResponseModel = value;
        faqItemsList.value = faqResponseModel.list ?? [];
        customLoader.hide();
      }
    }).onError((error, stackTrace) {
      customLoader.hide();
      showInSnackBar(message: error.toString());
    });
  }
}
