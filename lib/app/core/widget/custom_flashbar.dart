
import 'package:base_project/app/export.dart';

showInSnackBar({required String message}) {
  Get.closeAllSnackbars();
  Get.snackbar(keyApplicationName.tr, message,
      barBlur: radius_50,
      backgroundColor: toastColor,
      snackPosition: SnackPosition.TOP,
      colorText: Colors.black,
      duration: Duration(milliseconds: 1500),
      margin: EdgeInsets.symmetric(horizontal: margin_10, vertical: margin_20));
}
