/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */


import '../../export.dart';

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
