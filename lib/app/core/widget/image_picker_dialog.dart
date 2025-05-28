/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:base_project/app/export.dart';

class ImagePickerDialogWidget extends StatelessWidget {
  final String? title;
  final String? cameraTitle;
  final String? galleryTitle;
  final String? videoRecordTitle;
  final String? videoGalleryTitle;
  Function? cameraFunction;
  Function? imageGalleryFunction;
  Function? recordVideoFunction;
  Function? videoGalleryFunction;

  ImagePickerDialogWidget({
    Key? key,
    this.title,
    this.cameraTitle,
    this.galleryTitle,
    this.videoRecordTitle,
    this.videoGalleryTitle,
    this.cameraFunction,
    this.imageGalleryFunction,
    this.recordVideoFunction,
    this.videoGalleryFunction,
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
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(radius_5)),
            child: Column(
              children: [
                _dialogTitle(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Visibility(
                        visible: cameraFunction != null,
                        child: _dialogButton()),
                    Visibility(
                      visible:
                          cameraFunction != null && recordVideoFunction != null,
                      child: Container(
                        color: Colors.grey.shade300,
                        width: margin_1,
                        height: height_80,
                        margin: EdgeInsets.symmetric(horizontal: width_15),
                      ),
                    ),
                    Visibility(
                        visible: recordVideoFunction != null,
                        child: _dialogButton(selectedImage: false)),
                  ],
                ),
              ],
            ).marginAll(margin_20)),
        _cancelButton()
      ],
    ).marginAll(margin_10);
  }

  Widget _dialogTitle() => TextView(
        (title ?? keyUploadMedia.tr),
        textStyle: textStyleHeadingMedium()
            .copyWith(fontSize: font_17, color: color_black),
        textAlign: TextAlign.start,
      ).paddingOnly(bottom: margin_15);

  _cancelButton() => MaterialButtonWidget(
        onPressed: () {
          Get.back();
        },
        buttonRadius: margin_5,
        buttonColor: Colors.white,
        textColor: colorRed,
        buttonText: keyCancel.tr,
      ).paddingSymmetric(vertical: margin_15);

  Widget _dialogButton({bool selectedImage = true}) => Expanded(
        child: Column(
          children: [
            BounceWidget(
              onPressed: selectedImage ? cameraFunction : recordVideoFunction,
              widget: TextView(
                selectedImage
                    ? (cameraTitle ?? keyTakeImage.tr)
                    : (videoRecordTitle ?? keyRecordVideo.tr),
                textStyle:
                    textStyleBodyRegular().copyWith(color: colorTextBlack),
                textAlign: TextAlign.start,
              ).paddingSymmetric(vertical: margin_12),
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: margin_1,
            ),
            BounceWidget(
              onPressed:
                  selectedImage ? imageGalleryFunction : videoGalleryFunction,
              widget: TextView(
                selectedImage
                    ? (galleryTitle ?? keyChooseImage).tr
                    : (videoGalleryTitle ?? keyChooseVideo).tr,
                textStyle: textStyleBodyRegular().copyWith(color: color_black),
                textAlign: TextAlign.start,
              ).paddingSymmetric(vertical: margin_12),
            )
          ],
        ),
      );
}
