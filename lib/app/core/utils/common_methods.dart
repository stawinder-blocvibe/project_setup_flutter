import 'package:dio/dio.dart' as Dio;
import 'package:base_project/app/export.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

String getMerchantBusinessName(int? businessType) {
  if (businessType == businessTypeShop) {
    return keyStore.tr;
  } else if (businessType == businessTypeSuperMart) {
    return keySuperMarket.tr;
  } else {
    return keyRestaurant.tr;
  }
}

Duration stringToDuration(String duration) {
  List<String> timeParts = duration.split(':');

  return Duration(
      hours: int.parse(timeParts[0]),
      minutes: int.parse(timeParts[1]),
      seconds: int.parse(timeParts[2]));
}

String durationToString(Duration duration) {
  final stringDurationList = duration.toString().split(':');
  if (stringDurationList[0] == '0' || stringDurationList[0] == '00') {
    return '${stringDurationList[1]} Min';
  } else {
    return '${stringDurationList[0]} Hr ${stringDurationList[1]} Min';
  }
}

bool startEndTimeValidator(
    {required bool isForStartTime,
    required String startTimeString,
    required String endTimeString,
    required DateTime selectedTime,
    String startTimeText = "StartTime",
    String endTimeText = "EndTime"}) {
  DateTime? startTime =
      startTimeString != '' ? DateTime.parse(startTimeString) : null;
  DateTime? endTime =
      endTimeString != '' ? DateTime.parse(endTimeString) : null;

  if (isForStartTime) {
    if (endTime != null) {
      if (selectedTime.isAfter(endTime)) {
        showInSnackBar(
            message: '$startTimeText ${keyCantAfter.tr} $endTimeText');
        return false;
      } else if (selectedTime.isAtSameMomentAs(endTime)) {
        showInSnackBar(
            message: '$startTimeText ${keyCantSame.tr} $endTimeText');
        return false;
      } else {
        return true;
      }
    }
    return true;
  } else {
    if (startTime != null) {
      if (selectedTime.isBefore(startTime)) {
        showInSnackBar(
            message: '$endTimeText ${keyCantBefore.tr} $startTimeText');
        return false;
      } else if (selectedTime.isAtSameMomentAs(startTime)) {
        showInSnackBar(
            message: '$endTimeText ${keyCantSame.tr} $startTimeText');
        return false;
      } else {
        return true;
      }
    }
    return true;
  }
}

Future<dynamic> getMultipartFromMediaFile(MediaFile mediaFile) async {
  try {
    if (mediaFile.localFilePath != null && mediaFile.localFilePath != "") {
      return await Dio.MultipartFile.fromFile(mediaFile.localFilePath ?? '',
          filename: mediaFile.type == typePdfConst
              ? '${mediaFile.fileName}.${mediaFile.localFilePath?.split(".").last}'
              : mediaFile.fileName);
    } else {
      return null;
    }
  } catch (e) {
    return;
  }
}

openAndZoomImage(String? filePath, {required bool isNetwork}) {
  Get.dialog(
      Stack(
        children: [
          Center(
            child: Container(
              height: Get.height,
              width: Get.width,
              child: isNetwork
                  ? PhotoView(
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
                      imageProvider: NetworkImage(filePath ?? ''),
                    )
                  : PhotoView(
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
                      imageProvider: FileImage(File(filePath ?? '')),
                    ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: BounceWidget(
              onPressed: () => Get.back(),
              widget: AssetImageWidget(
                iconsIcCrossWhiteFilled1,
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



bool checkIfRestaurantOpen(RestMartStoreModel? restMartStoreModel) {
  final currentTime = DateTime.now();
  final currentWeekDay = DateFormat('EEEE').format(currentTime);

  final index = restMartStoreModel?.availability?.indexWhere(
      (element) => element.day?.toLowerCase() == currentWeekDay.toLowerCase());

  if (index != null && index != -1) {
    final availability = restMartStoreModel?.availability?[index];
    if (availability?.isAdded == true) {
      final openingTime = DateTime.parse(availability?.openingTime ?? '');
      final closingTime = DateTime.parse(availability?.closingTime ?? '');

      final updatedOpeningTime = DateTime(
          currentTime.year,
          currentTime.month,
          currentTime.day,
          openingTime.hour,
          openingTime.minute); // to resolve year issues
      final updatedClosingTime = DateTime(currentTime.year, currentTime.month,
          currentTime.day, closingTime.hour, closingTime.minute);
      if (currentTime.isAfter(updatedOpeningTime) &&
          currentTime.isBefore(updatedClosingTime)) {
        return true; // rest is open otherwise closed in all other cases
      } else {
        return false;
      }
    } else {
      return false;
    }
  } else {
    return false;
  }
}

String displayTimeAgoFromTimestamp(String timestamp) {
  if (timestamp == '') {
    return '';
  }

/*  final year = int.parse(timestamp.substring(0, 4));
  final month = int.parse(timestamp.substring(5, 7));
  final day = int.parse(timestamp.substring(8, 10));
  final hour = int.parse(timestamp.substring(11, 13));
  final minute = int.parse(timestamp.substring(14, 16));
  final second = int.parse(timestamp.substring(17, 19));*/

  debugPrint(' time from created on ->${DateTime.parse(timestamp)}');

  final DateTime videoDate = DateTime.parse(timestamp);
  final int diffInHours = DateTime.now().toUtc().difference(videoDate).inHours;

  String timeAgo = '';
  String timeUnit = '';
  int timeValue = 0;

  if (diffInHours < 1) {
    final diffInSeconds = DateTime.now().difference(videoDate).inSeconds;
    if (diffInSeconds < 80) {
      return KeyJustNow.tr;
    }

    final diffInMinutes = DateTime.now().difference(videoDate).inMinutes;
    timeValue = diffInMinutes;
    timeUnit = KeyMinute.tr;
    if (timeValue == 0) {
      return KeyJustNow.tr;
    }
  } else if (diffInHours < 24) {
    timeValue = diffInHours;
    timeUnit = KeyHour.tr;
  } else if (diffInHours >= 24 && diffInHours < 24 * 7) {
    timeValue = (diffInHours / 24).floor();
    timeUnit = KeyDay.tr;
  } else if (diffInHours >= 24 * 7 && diffInHours < 24 * 30) {
    timeValue = (diffInHours / (24 * 7)).floor();
    timeUnit = KeyWeek.tr;
  } else if (diffInHours >= 24 * 30 && diffInHours < 24 * 12 * 30) {
    timeValue = (diffInHours / (24 * 30)).floor();
    timeUnit = KeyMonth.tr;
  } else {
    timeValue = (diffInHours / (24 * 365)).floor();
    timeUnit = KeyYear.tr;
  }

  timeAgo = timeValue.toString() + ' ' + timeUnit;
  timeAgo += timeValue > 1 ? KeyS.tr : '';

  return timeAgo + ' ${KeyAgo.tr}';
}

String displayTimeAgoFromTimestampNew(String timestamp) {
  if (timestamp.isEmpty) {
    return '';
  }

  // Parse the timestamp to a DateTime object
  final DateTime videoDate =
      DateTime.parse(timestamp).toLocal(); // Convert to local time

  // Calculate the difference in hours
  final int diffInHours = DateTime.now().difference(videoDate).inHours;

  String timeAgo = '';
  String timeUnit = '';
  int timeValue = 0;

  if (diffInHours < 1) {
    final diffInSeconds = DateTime.now().difference(videoDate).inSeconds;
    if (diffInSeconds < 60) {
      return 'Just now'; // Replace with KeyJustNow.tr
    }

    final diffInMinutes = DateTime.now().difference(videoDate).inMinutes;
    timeValue = diffInMinutes;
    timeUnit = 'minute'; // Replace with KeyMinute.tr
    if (timeValue == 0) {
      return 'Just now'; // Replace with KeyJustNow.tr
    }
  } else if (diffInHours < 24) {
    timeValue = diffInHours;
    timeUnit = 'hour'; // Replace with KeyHour.tr
  } else if (diffInHours < 24 * 7) {
    timeValue = (diffInHours / 24).floor();
    timeUnit = 'day'; // Replace with KeyDay.tr
  } else if (diffInHours < 24 * 30) {
    timeValue = (diffInHours / (24 * 7)).floor();
    timeUnit = 'week'; // Replace with KeyWeek.tr
  } else if (diffInHours < 24 * 365) {
    timeValue = (diffInHours / (24 * 30)).floor();
    timeUnit = 'month'; // Replace with KeyMonth.tr
  } else {
    timeValue = (diffInHours / (24 * 365)).floor();
    timeUnit = 'year'; // Replace with KeyYear.tr
  }

  timeAgo = '$timeValue $timeUnit';
  timeAgo += timeValue > 1 ? 's' : ''; // Add pluralization

  return '$timeAgo ago'; // Replace with KeyAgo.tr
}



void requestVideoAudioPermissions() async {
  // Video permissions.
  if (await Permission.videos.isDenied ||
      await Permission.videos.isPermanentlyDenied) {
    final state = await Permission.videos.request();
    if (!state.isGranted) {
      await SystemNavigator.pop();
    }

    // Audio permissions.
    if (await Permission.audio.isDenied ||
        await Permission.audio.isPermanentlyDenied) {
      final state = await Permission.audio.request();
      if (!state.isGranted) {
        await SystemNavigator.pop();
      }
    }
  } else {
    if (await Permission.storage.isDenied ||
        await Permission.storage.isPermanentlyDenied) {
      final state = await Permission.storage.request();
      if (!state.isGranted) {
        await SystemNavigator.pop();
      }
    }
  }
}

String getCurrentOrderStatus(int? orderStatus) {
  switch (orderStatus) {
    case orderStateAccepted:
      return keyOrderConfirmed.tr;
    case orderStatePreparing:
      return keyPreparing.tr;
    case orderStateReadyToPickUp:
      return keyReadyForPickUp.tr;
    case orderStatePickedUp:
      return keyPickedup.tr;
    case orderStateDelivered:
      return keyDelivered.tr;
    case orderStateCancelled:
      return keyCancelled.tr;
    default:
      return keyOrderPlaced.tr;
  }
}

Future<BitmapDescriptor> getMapIcon({required String? imagePath}) async {
  if (imagePath == null || imagePath == '') {
    return BitmapDescriptor.defaultMarker;
  }

  final newIcon = await BitmapDescriptor.fromAssetImage(
    ImageConfiguration.empty,
    imagePath,
  );

  return newIcon;
}

Future<String> getEstimatedTimeBetweenLocations(
    {LatLng? start, LatLng? end, showLoader = false}) async {
  if (showLoader) {
    customLoader.show(Get.context);
  }

  if (start == null || end == null) {
    customLoader.hide();
    return '';
  }

  final distance = DistanceProvider.getDistanceBetweenLatLong(
      lat1: start.latitude,
      lon1: start.longitude,
      lat2: end.latitude,
      lon2: end.longitude);

  if (distance > 0) {
    final avgSpeed = 40; // km/hr
    final time = distance / avgSpeed;
    final timeInMin = time * 60;
    customLoader.hide();
    return '${timeInMin.toStringAsFixed(0)} ${keyMin.tr.toLowerCase()}';
  } else {
    customLoader.hide();
    return '1 ${keyMin.tr.toLowerCase()}';
  }
}

proUtcToLocalLatest(var date, var format) {
  DateTime dateTime =
      DateFormat("yyyy-MM-dd HH:mm:ss").parse(date.toString(), true).toLocal();
  var df = DateFormat(format).format(dateTime);
  return df;
}
