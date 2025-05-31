

import '../../../presentation/modules/authentication/models/data_model/media_file_model.dart';
import '../../export.dart';

class PicsVideosListWidget extends StatelessWidget {
  bool isSelectable = false;
  RxList<MediaFile> mediaList = <MediaFile>[].obs;
  List<int>? removedMediaIds = [];
  RxInt selectedPhotoIndex = (-1).obs;
  bool is360Video = false;
  bool isRemovable = false;
  bool isImageRequired = false;
  Widget? headingWidget;

  PicsVideosListWidget({
    required this.mediaList,
    required this.isRemovable,
    required this.headingWidget,
    this.isSelectable = false,
    this.is360Video = false,
    this.isImageRequired = false,
    this.removedMediaIds,
  });

  @override
  Widget build(BuildContext context) {
    return _imgVidList();
  }

  _addPhotoVideoWidget() => GestureDetector(
        onTap: _loadImage,
        child:  Text("AddImage")

        // AssetImageWidget(
        //   iconsIcAddImg,
        //   imageHeight: height_60,
        //   imageWidth: height_60,
        //   imageFitType: BoxFit.fill,
        //   radiusAll: radius_5,
        // ).paddingOnly(right: margin_8, bottom: margin_10, top: margin_3),
      );

  _imgVidList() => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          headingWidget ?? SizedBox(),
          Obx(
            () => Wrap(
              children: List.generate(
                  mediaList.length + 1,
                  (index) => Stack(
                        alignment: Alignment.topRight,
                        children: [
                          index == 0
                              ? _addPhotoVideoWidget()
                              : ((mediaList[index - 1].localFilePath != null ||
                                                  mediaList[index - 1]
                                                          .localFilePath
                                                          ?.isNotEmpty ==
                                                      true) &&
                                              !(mediaList[index - 1]
                                                      .isLoadingThumbNail
                                                      .value ??
                                                  false) ||
                                          (mediaList[index - 1]
                                                      .thumbnail
                                                      .value ??
                                                  '')
                                              .isNotEmpty
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(radius_5),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Image.file(
                                                File(mediaList[index - 1]
                                                            .thumbnail
                                                            .value !=
                                                        ''
                                                    ? mediaList[index - 1]
                                                        .thumbnail
                                                        .value!
                                                    : mediaList[index - 1]
                                                            .localFilePath ??
                                                        ''),
                                                fit: BoxFit.fill,
                                                height: height_60,
                                                width: height_60,
                                              ),
                                              if (mediaList[index - 1].type ==
                                                  typeVideoConst) ...[
                                                AssetImageWidget(
                                                  "iconsIcPlay",
                                                  imageHeight: height_20,
                                                  imageWidth: height_20,
                                                  imageFitType: BoxFit.cover,
                                                )
                                              ]
                                            ],
                                          ),
                                        )
                                      : NetworkImageWidget(
                                          imageUrl: mediaList[index - 1]
                                                  .filePathUrl ??
                                              '',
                                          imageFitType: BoxFit.fill,
                                          imageHeight: height_60,
                                          imageWidth: height_60,
                                          radiusAll: radius_5,
                                        ))
                                  .paddingOnly(
                                      right: margin_8,
                                      bottom: margin_10,
                                      top: margin_3),
                          index != 0 && isRemovable
                              ? Positioned(
                                  right: 4,
                                  top: -5,
                                  child: BounceWidget(
                                    onPressed: () {
                                      if (isImageRequired &&
                                          (mediaList[index - 1].type ==
                                                  typeImageConst &&
                                              (mediaList
                                                      .where((p0) =>
                                                          p0.type ==
                                                          typeImageConst)
                                                      .length ==
                                                  1))) {
                                        showInSnackBar(
                                            message: KeyOneImageRequired.tr);
                                        return;
                                      }

                                      if (mediaList[index - 1].id != 0 &&
                                          mediaList[index - 1].id != null)
                                        removedMediaIds
                                            ?.add(mediaList[index - 1].id ?? 0);
                                      mediaList.removeAt(index - 1);
                                    },
                                    widget: AssetImageWidget(
                                      "iconsIcCut",
                                      imageHeight: height_20,
                                      imageWidth: height_20,
                                    ),
                                  ),
                                )
                              : Container(height: 0, width: 0),
                        ],
                      )),
            ),
          ),
        ],
      );

  Future _loadImage() async {
    if (mediaList.length >= maxPicturesCountConst) {
      showInSnackBar(message: keyMaxPicturesValidation.tr);
      return;
    }
    await Get.bottomSheet(ImagePickerDialogWidget(
      title: ((isImageRequired &&
              (mediaList.isEmpty ||
                  mediaList.any((element) => element.type != typeImageConst)))
          ? keyUploadPhoto.tr
          : keyUploadImageVideo.tr),
      cameraFunction: () {
        Get.back();
        addImageFile(imageFromCamera());
      },
      imageGalleryFunction: () {
        Get.back();
        addPictureFiles(multiImageFromGallery());
      },
      recordVideoFunction: (isImageRequired &&
              (mediaList.isEmpty ||
                  mediaList.any((element) => element.type != typeImageConst)))
          ? null
          : () {
              Get.back();
              addImageFile(videoFromCamera());
            },
      videoGalleryFunction: (isImageRequired &&
              (mediaList.isEmpty ||
                  mediaList.any((element) => element.type != typeImageConst)))
          ? null
          : () {
              Get.back();
              addImageFile(videoFromGallery());
            },
    ));
  }

  addImageFile(Future<PickedFile?> imagePath) async {
    PickedFile? file = await imagePath;
    if (file != null) {
      mediaList.add(MediaFile(localFilePath: file.path, fileName: file.path));
    }
  }

  addPictureFiles(Future<List<String>> imagePaths) async {
    List<String> files = await imagePaths;
    for (var element in files) {
      if (mediaList.length >= maxPicturesCountConst) {
        showInSnackBar(message: keyMaxPicturesValidation.tr);
        return;
      } else {
        mediaList.add(MediaFile(localFilePath: element, fileName: element));
      }
    }
  }

  openAndZoomImage(index) {
    Get.dialog(
        Stack(
          children: [
            Center(
              child: Container(
                  height: Get.height,
                  width: Get.width,
                  child: PhotoView(
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    loadingBuilder: (context, event) => Center(
                        child: CircularProgressIndicator(
                      backgroundColor: appColor,
                      color: Colors.white,
                      value: event == null
                          ? 0
                          : (event.cumulativeBytesLoaded) /
                              (event.expectedTotalBytes ?? 0.0),
                    )),
                    imageProvider: mediaList[index - 1].localFilePath == null ||
                            mediaList[index - 1].localFilePath!.isEmpty
                        ? NetworkImage(mediaList[index - 1].filePathUrl ?? '')
                        : FileImage(
                                File(mediaList[index - 1].localFilePath ?? ''))
                            as ImageProvider,
                  )),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: BounceWidget(
                onPressed: () => Get.back(),
                widget: AssetImageWidget(
                  "iconsIcCrossWhiteFilled1",
                  imageWidth: width_25,
                  imageHeight: width_25,
                  radiusAll: radius_8,
                ),
              ),
            )
          ],
        ),
        barrierDismissible: false,
        barrierColor: Colors.transparent);
  }

  videoPlayer(index) {
    Get.bottomSheet(
        Stack(
          children: [
            Center(
                child:

                Text("VideoPlayerWidget")
      // VideoPlayerWidget(
      //         videoUrl: mediaList[index].localFilePath ?? '',
      //         isNetwork: mediaList[index].localFilePath == null ||
      //             mediaList[index].localFilePath == '',
      //       )
            ),
            Positioned(
              top: height_50,
              right: 0,
              child: BounceWidget(
                onPressed: () => Get.back(),
                widget: AssetImageWidget(
                  "iconsIcCrossWhiteFilled1",
                  imageWidth: width_25,
                  imageHeight: width_25,
                  radiusAll: radius_8,
                ),
              ),
            )
          ],
        ),
        barrierColor: Colors.transparent);
  }
}
