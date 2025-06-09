// import 'package:video_thumbnail/video_thumbnail.dart';


import '../../../../../app/export.dart';


class MediaFile {
  MediaFile(
      {int? id,
      String? fileName,
      String? filePathUrl,
      String? localFilePath,
      bool createVideoPlayer = false //used in post section
      }) {
    _id = id;
    _filePathUrl = filePathUrl;
    _localFilePath = localFilePath;
    _fileName = fileName ?? generateFileName();
    type = getFileType(_localFilePath ?? "");
    if (type == typeVideoConst) {
      generateThumbnail();
    }
  }

  MediaFile.fromJson(dynamic json, {bool getThumbnail = true}) {
    _id = json['id'];
    _filePathUrl = json['url'];
    modelId = json['model_id'];
    _fileName = json['name'] ?? generateFileName();
    type = getFileType(_filePathUrl ?? "");
    if (type == typeVideoConst && getThumbnail) {
      generateThumbnail();
    }
  }

  generateFileName() {
    if (_filePathUrl != null && _filePathUrl != '') {
      return _filePathUrl!.split('/').last;
    } else if (_localFilePath != null && _localFilePath != '') {
      return _localFilePath!.split('/').last;
    } else {
      return '';
    }
  }

  generateThumbnail() async {
    try {
      isLoadingThumbNail.value = true;
      // final thumbFile = await VideoThumbnail.thumbnailFile(
      //   video: _filePathUrl ?? _localFilePath ?? '',
      //   thumbnailPath: (await getTemporaryDirectory()).path,
      //   imageFormat: ImageFormat.JPEG,
      //   quality: 100,
      // );
      // if (thumbFile != null) thumbnail.value = thumbFile;
      // debugPrint(keyChooseVideo.tr + thumbnail.toString());
      // isLoadingThumbNail.value = false;
    } catch (_) {
      isLoadingThumbNail.value = false;
    }
  }

  var _id;
  var modelId; //used in life needs post section
  String? _filePathUrl;
  String? _localFilePath;
  String? _fileName;

  Rx<String?> thumbnail = ''.obs;
  Rx<bool?> isLoadingThumbNail = false.obs;
  int type = 0;

  int? get id => _id;

  String? get filePathUrl => _filePathUrl;

  String? get localFilePath => _localFilePath;

  String? get fileName => _fileName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['url'] = _filePathUrl;
    return map;
  }
}

int getFileType(String path) {
  if (GetUtils.isImage(path) ||
      path.contains('jpg') ||
      path.contains('png') ||
      path.contains('jpeg')) {
    return typeImageConst;
  }
  if (GetUtils.isPDF(path) || path.contains('pdf')) {
    return typePdfConst;
  }
  if (GetUtils.isVideo(path) || path.contains('mp4')) {
    return typeVideoConst;
  }
  return 0;
}
