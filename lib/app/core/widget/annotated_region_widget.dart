/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:base_project/app/export.dart';

class AnnotatedRegionWidget extends StatelessWidget {
  final Widget child;
  final Color statusBarColor;
  final Brightness statusBarBrightness;

  const AnnotatedRegionWidget(
      {Key? key,
      required this.child,
      this.statusBarColor = Colors.black,
      required this.statusBarBrightness})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: statusBarColor,
            statusBarBrightness: statusBarBrightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark, // ios
            statusBarIconBrightness: statusBarBrightness),
        child: ColorfulSafeArea(
          color: statusBarColor,
          child: child,
          bottom: Platform.isAndroid ? true : false,
        ));
  }
}
