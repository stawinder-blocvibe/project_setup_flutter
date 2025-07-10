  


import '../../export.dart';

showInSnackBar({required String message}) {

  var toastColor = Color(0xFF003921).withOpacity(0.5);
  Get.closeAllSnackbars();
  Get.snackbar(keyApplicationName.tr, message,
      barBlur: radius_50,
      backgroundColor:  toastColor,
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      duration: Duration(milliseconds: 2500),
      margin: EdgeInsets.symmetric(horizontal: margin_10, vertical: margin_20));
}
