  


import '../../export.dart';

showInSnackBar({required String message}) {
  Get.closeAllSnackbars();
  Get.snackbar(keyApplicationName.tr, message,
      barBlur: radius_50,
      backgroundColor: toastColor.withOpacity(0.7),
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      duration: Duration(milliseconds: 2500),
      margin: EdgeInsets.symmetric(horizontal: margin_10, vertical: margin_20));
}
