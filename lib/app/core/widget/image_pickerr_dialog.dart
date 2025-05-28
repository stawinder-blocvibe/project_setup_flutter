/*
 *
 *  * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *  * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 *  * All Rights Reserved.
 *  * Proprietary and confidential :  All information contained herein is, and remains
 *  * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 *  * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import '../../export.dart';

class ImagePickerDialogg extends StatelessWidget {
  final String? title;
  final galleryFunction;
  final cameraFunction;

  const ImagePickerDialogg({
    Key? key,
    this.title,
    required this.galleryFunction,
    required this.cameraFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            width: Get.width,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(margin_5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _dialogTitle(),
                _dialogButton(),
              ],
            ).marginAll(margin_20)),
        _cancelButton()
      ],
    ).marginAll(margin_10);
  }

  Widget _dialogTitle() => TextView(
        title ?? "",
        textStyle: textStyleBodyLarge().copyWith(fontSize: font_17),
        textAlign: TextAlign.start,
      ).paddingOnly(bottom: margin_15);

  _cancelButton() => MaterialButtonWidget(
        onPressed: () {
          Get.back();
        },
        buttonRadius: margin_5,
        buttonColor: Colors.white,
        textColor: Colors.black,
        buttonText: keyCancel.tr,
      ).paddingSymmetric(vertical: margin_15);

  Widget _dialogButton() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: cameraFunction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.camera_alt_rounded),
                TextView(
                  keyTakeImage.tr,
                  textStyle: textStyleBodyLarge().copyWith(color: Colors.black),
                  textAlign: TextAlign.start,
                ).paddingSymmetric(vertical: margin_12),
              ],
            ),
          ),
          SizedBox(
            width: margin_2,
          ),
          InkWell(
            onTap: galleryFunction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.image),
                TextView(
                  keyChooseImage.tr,
                  textStyle: textStyleBodyLarge().copyWith(color: Colors.black),
                  textAlign: TextAlign.start,
                ).paddingSymmetric(vertical: margin_12),
              ],
            ),
          )
        ],
      );
}
