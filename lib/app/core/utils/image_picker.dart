



// import 'package:image_cropper/image_cropper.dart';

import '../../export.dart';

/*=================================================================== Image Pick Using camera ===================================================*/

Future<PickedFile?> imageFromCamera() async {
  var pickedFile = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 100);
  bool imageAccepted;
  if (pickedFile == null) {
    return showInSnackBar(message: "No Image Selected".tr);
  } else {
    if (pickedFile.path.endsWith(
        "png".tr)) {
      imageAccepted = true;
    } else if (pickedFile.path.endsWith("jpg".tr)) {
      imageAccepted = true;
    } else if (pickedFile.path.endsWith("jpeg".tr)) {
      imageAccepted = true;
    } else {
      imageAccepted = false;
    }

    if (imageAccepted) {
      return PickedFile(pickedFile.path); //PickedFile(croppedImage.path); //cropImage(pickedFile.path);
    } else {
      SnackBar(content: Text("Extention not allowed".tr));
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
    return showInSnackBar(message: "No Image Selected".tr);
  } else {
    if (pickedFile.path.endsWith("png".tr)) {
      imageAccepted = true;
    } else if (pickedFile.path.endsWith("jpg".tr)) {
      imageAccepted = true;
    } else if (pickedFile.path.endsWith("jpeg".tr)) {
      imageAccepted = true;
    } else {
      imageAccepted = false;
    }
    if (imageAccepted) {
      return cropImage(pickedFile.path, isRectangular: isRectangular);
    } else {
      SnackBar(content: Text("Extension not allowed".tr));
    }
  }
  return null;
}

Future<List<String>> multiImageFromGallery() async {
  var pickedFiles = await ImagePicker().pickMultiImage(imageQuality: 100);
  if (pickedFiles == null) {
    showInSnackBar(message: "No Image".tr);
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
  // var croppedImage = await ImageCropper().cropImage(
  //   sourcePath: filePath,
  //   aspectRatio: CropAspectRatio(
  //       ratioX: isRectangular ? 4 : 1, ratioY: isRectangular ? 3 : 1),
  //   aspectRatioPresets: [CropAspectRatioPreset.original],
  // );
  // if (croppedImage == null) {
  //   showInSnackBar(message: "No image".tr);
  // } else {
  //   return PickedFile(croppedImage.path);
  // }
  return null;
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