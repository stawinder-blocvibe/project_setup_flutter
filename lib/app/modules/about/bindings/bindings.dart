/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */


import 'package:base_project/app/export.dart';


import '../controllers/about_us_controller.dart';

class AboutUsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutUsController>(
      () => AboutUsController(),
    );
  }
}
