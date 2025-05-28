/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:base_project/app/export.dart';

class OnBoardingWidget extends StatelessWidget {
  final String imageUrl;
  final String bodyText;
  final String topImage;
  final String label;
  const OnBoardingWidget({
    Key? key,
    required this.imageUrl,
    required this.bodyText,
    required this.topImage,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: _bodyWidget());
  }

  Widget _bodyWidget() => Column(children: [
        Expanded(
          flex: 2,
          child: AssetImageWidget(
            imageFitType: BoxFit.contain,
            imageUrl,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            _heading(),
            SizedBox(
              height: height_10,
            ),
            _title(),
          ],
        ).marginSymmetric(horizontal: margin_14)
      ]).paddingOnly(top: margin_5);

  Widget _heading() {
    return TextView(textAlign: TextAlign.start, maxLines: 3, label, textStyle: textStyleBody1().copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: font_25));
  }

  Widget _title() => TextView(
        bodyText,
        textAlign: TextAlign.start,
        textStyle: textStyleBodyMedium().copyWith(color: greyColor),
        maxLines: 5,
      );
}
