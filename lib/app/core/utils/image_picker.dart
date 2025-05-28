/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:base_project/app/export.dart';

/*=================================================================== Image Pick Using camera ===================================================*/

Future<PickedFile?> imageFromCamera() async {
  var pickedFile = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 100);
  bool imageAccepted;
  if (pickedFile == null) {
    return showInSnackBar(message: keyNoImageSelected.tr);
  } else {
    if (pickedFile.path.endsWith(keyPng.tr)) {
      imageAccepted = true;
    } else if (pickedFile.path.endsWith(keyJpg.tr)) {
      imageAccepted = true;
    } else if (pickedFile.path.endsWith(keyJpeg.tr)) {
      imageAccepted = true;
    } else {
      imageAccepted = false;
    }
    if (imageAccepted) {
      return cropImage(pickedFile.path);
    } else {
      SnackBar(content: Text(keyExtensionNotAllow.tr));
    }
  }
  return null;
}
/*=================================================================== Image Pick Using Gallery ===================================================*/

Future<PickedFile?> imageFromGallery({bool isRectangular = false}) async {
  var pickedFile = await ImagePicker()
      .pickImage(source: ImageSource.gallery, imageQuality: 100);
  bool imageAccepted;
  if (pickedFile == null) {
    return showInSnackBar(message: keyNoImageSelected.tr);
  } else {
    if (pickedFile.path.endsWith(keyPng.tr)) {
      imageAccepted = true;
    } else if (pickedFile.path.endsWith(keyJpg.tr)) {
      imageAccepted = true;
    } else if (pickedFile.path.endsWith(keyJpeg.tr)) {
      imageAccepted = true;
    } else {
      imageAccepted = false;
    }
    if (imageAccepted) {
      return cropImage(pickedFile.path, isRectangular: isRectangular);
    } else {
      SnackBar(content: Text(keyExtensionNotAllow.tr));
    }
  }
  return null;
}

Future<List<String>> multiImageFromGallery() async {
  var pickedFiles = await ImagePicker().pickMultiImage(imageQuality: 100);
  if (pickedFiles == null) {
    showInSnackBar(message: keyNoImage.tr);
  } else {
    List<String> files = [];
    pickedFiles.forEach((element) {
      files.add(element.path);
    });
    return files;
  }
  return [];
}

Future<PickedFile?> cropImage(filePath, {bool isRectangular = false}) async {

  showInSnackBar(message: "under_dev__cropImage");

  //
  // var croppedImage = await ImageCropper().cropImage(
  //   sourcePath: filePath,
  //   aspectRatio: CropAspectRatio(
  //       ratioX: isRectangular ? 4 : 1, ratioY: isRectangular ? 3 : 1),
  //   aspectRatioPresets: [CropAspectRatioPreset.original],
  // );
  // if (croppedImage == null) {
  //   showInSnackBar(message: keyNoImage.tr);
  // } else {
  //   return PickedFile(croppedImage.path);
  // }
  // return null;
}

Future<PickedFile?> videoFromCamera() async {
  var pickedFile = await ImagePicker().pickVideo(source: ImageSource.camera);
  if (pickedFile != null) return PickedFile(pickedFile.path);
  return null;
}

/*=================================================================== Pick Video Using Gallery ===================================================*/

Future<PickedFile?> videoFromGallery() async {
  var pickedFile = await ImagePicker().pickVideo(source: ImageSource.gallery);
  if (pickedFile != null) return PickedFile(pickedFile.path);
  return null;
}

Future<PickedFile?> picksinglefile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'png']);
  if (result != null) {
    return PickedFile(result.files.first.path.toString());
  }
  return null;
}
