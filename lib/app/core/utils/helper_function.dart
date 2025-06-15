import 'dart:math';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../export.dart';

class HelperFunction {
  static String formatTimeHHMMAMPM({required DateTime date}) {
    // Format the DateTime object as a string in 12-hour format with AM/PM
    String formattedTime = DateFormat('hh:mma').format(date).toLowerCase();

    debugPrint(formattedTime);
    return '$formattedTime';
  }

  static String? parseDateTimeNew(String dateTimeStr) {
    // Define the expected format

    final String format = "hh:mm a dd MMM yyyy";
    try {
      // Create a DateFormat instance for parsing
      DateFormat dateFormat = DateFormat(format);
      // Parse the date-time string
      DateTime dateTime = dateFormat.parse(dateTimeStr);
      // Return the DateTime object

      //DateTime.utc(2025, 3, 5, 14, 11); // March 5, 2025, 14:11 UTC
      var local = DateTime.utc(dateTime.year, dateTime.month, dateTime.day,
              dateTime.hour, dateTime.minute)
          .toLocal();

      return DateFormat('hh:mm a').format(local);
    } catch (e) {
      debugPrint('Error parsing date-time: $e');
      return null; // Return null if parsing fails
    }
  }

  utcToLocalLatestNewsDate(var date) {
    DateTime dateTime =
        DateFormat("yyyy-MM-dd hh:mm:ss").parse(date, true).toLocal();
    var df = DateFormat('hh:mm a').format(dateTime);
    return df;
  }

  /* static double calculateDuration(
      {required double lat1,
      required double lon1,
      required double lat2,
      required double lon2,
      required double averageSpeed}) {
    // Get the distance between the points
    double distance = haversineDistance(lat1, lon1, lat2, lon2);

    // Estimate the time (duration) it would take at the given average speed (in hours)
    return distance / averageSpeed;
  }*/

  // Function to calculate the time between two latitudes and longitudes in minutes
  static double calculateTime({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
    required double averageSpeed, // in km
  }) {
    const R = 6371; // Radius of Earth in kilometers
    // Haversine formula to calculate the distance between two lat/lon points
    var dLat = _toRadians(lat2 - lat1);
    var dLon = _toRadians(lon2 - lon1);

    var a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var distance = R * c; // Distance in kilometers

    // Time in hours = Distance / Average Speed
    var timeInHours = distance / averageSpeed;

    // Convert time to minutes (1 hour = 60 minutes)
    return timeInHours * 60;
  }

  // Helper function to convert degrees to radians
  static double _toRadians(double degree) {
    return degree * pi / 180.0;
  }

  static double stringToDouble({String? data}) {
    if (data == null || data.isEmpty) {
      return 0;
    } else {
      return double.parse(data);
    }
  }

  static Future<List<Placemark>> getPlaceAddress(
      {required double lat, required double lng}) async {
    return await placemarkFromCoordinates(lat, lng);
  }

  static Future<Position> getCurrentLocation() async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Check if the app has permission to access location
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      } else if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        return await getCurrentLocation();
      }
    }

    // Get the current position (latitude and longitude)
    Position position = (await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high)) as Position;
    return position;
  }

  static DateTime? getDateTimeFromString(String? dateTimeString) {
    // Check if the input string is empty
    if (dateTimeString == null) {
      return null;
    } else if (dateTimeString.isEmpty) {
      return null; // or throw an exception based on your needs
    }

    // Parse the date string into a DateTime object
    DateTime? dateTime = DateTime.tryParse(dateTimeString);

    // Return the parsed DateTime object or null if parsing failed
    return dateTime;
  }

  static String formatDateTimeFromUtc(dynamic time) {
    try {
      return new DateFormat("yyyy-MM-dd hh:mm:ss")
          .format(new DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(time));
    } catch (e) {
      return new DateFormat("yyyy-MM-dd hh:mm:ss").format(new DateTime.now());
    }
  }

  proUtcToLocalLatest(var date, var format) {
    DateTime dateTime =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse(date.toString(), true);
    var df = DateFormat(format).format(dateTime);

    return "$df";
  }

  static String timeAgo(DateTime dateTime) {
    final Duration difference = DateTime.now().difference(dateTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} second${difference.inSeconds == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inDays < 365) {
      final int weeks = (difference.inDays / 7).floor();

      return '${weeks} week${weeks == 1 ? '' : 's'} ago';
    } else {
      final int years = (difference.inDays / 365).floor();

      return '${years} year${years == 1 ? '' : 's'} ago';
    }
  }

  static String timeDescription(DateTime dateTime) {
    // Get the current date
    DateTime now = DateTime.now();

    // Normalize the dateTime to ignore time for "Today" and "Yesterday"
    DateTime normalizedDateTime =
        DateTime(dateTime.year, dateTime.month, dateTime.day);
    DateTime normalizedNow = DateTime(now.year, now.month, now.day);

    // Calculate the difference in days
    int differenceInDays = normalizedNow.difference(normalizedDateTime).inDays;

    if (differenceInDays == 0) {
      return 'Today';
    } else if (differenceInDays == 1) {
      return '1 day ago';
    } else if (differenceInDays < 30) {
      return '$differenceInDays days ago';
    } else if (differenceInDays < 365) {
      int differenceInMonths = (differenceInDays / 30).floor();
      return differenceInMonths == 1
          ? '1 month ago'
          : '$differenceInMonths months ago';
    } else {
      int differenceInYears = (differenceInDays / 365).floor();
      return differenceInYears == 1
          ? '1 year ago'
          : '$differenceInYears years ago';
    }
  }

  static bool isImageUrlValid(String url) {
    ///  List of valid image extensions
    const validExtensions = [
      '.jpg',
      '.jpeg',
      '.png',
      '.gif',
      '.bmp',
      '.tiff',
      '.webp'
    ];

    /// Check if the URL ends with a valid image extension
    if (!validExtensions.any((ext) => url.toLowerCase().endsWith(ext))) {
      debugPrint("The URL does not have a valid image extension.");
      return false;
    } else {
      return true;
    }
  }

  static Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now() ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

/*    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }*/
  }

  Future<void> requestPermission() async {}
  // {
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //
  //   NotificationSettings settings = await messaging.requestPermission(
  //     alert: true,
  //     badge: true,
  //     provisional: false,
  //     sound: true,
  //   );
  //
  //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //     debugPrint('User  granted permission');
  //   } else if (settings.authorizationStatus ==
  //       AuthorizationStatus.provisional) {
  //     debugPrint('User  granted provisional permission');
  //   } else {
  //     debugPrint('User  declined or has not accepted permission');
  //   }
  //   debugPrint('test');
  // }

  static clearNotificationCount() {
    notificationCount.value = 0;
    notificationCount.refresh();
  }

  static setNotificationCount(dynamic count) {
    if (count is int) {
      notificationCount.value = count;
    } else if (count is String) {
      notificationCount.value = int.parse(count.toString());
    } else if (count == null) {
      notificationCount.value = 0;
    }
    notificationCount.refresh();
  }

  static String convertKmToKm(String input) {
    // Use a regular expression to find "km" in the string
    final RegExp regex = RegExp(r'\bkm\b', caseSensitive: false);

    // Replace all occurrences of "km" with "Km"
    return input.replaceAll(regex, 'KM');
  }

  static String convertMinToMin({required String input, String? replaceWith}) {
    // Use a regular expression to find "km" in the string
    final RegExp regex = RegExp(r'\bmin\b', caseSensitive: false);

    // Replace all occurrences of "km" with "Km"
    return input.replaceAll(regex, replaceWith ?? 'Min');
  }

  static String convertMinsToMins({required String input}) {
    // Use a regular expression to find "mins" in the string
    final RegExp regex = RegExp(r'\bmins\b', caseSensitive: false);

    // Replace all occurrences of "mins" with "Mins"
    return input.replaceAll(regex, 'Mins');
  }

  static String convertmToMeter(String input) {
    // Use a regular expression to find "m" in the string
    final RegExp regex = RegExp(r'\bm\b', caseSensitive: false);

    // Replace all occurrences of "m" with "Meter"
    return input.replaceAll(regex, 'Meter');
  }

  static handlePlatform(
      {required Function() callAndroidFunction,
      required Function() callIosFunction}) {
    if (Platform.isIOS) {
      callIosFunction();
    } else if (Platform.isAndroid) {
      callAndroidFunction();
    } else {
      debugPrint('different platform code call');
    }
  }



  static TextInputFormatter phoneNumberFormatter() {
    return FilteringTextInputFormatter.allow(RegExp(r'^\d{0,10}$'));
  }
  static String formatTimeToAmPm(DateTime dateTime) {
    // Formats to 'hh:mm AM/PM' (e.g., 01:30 PM)
    return DateFormat('hh:mm a').format(dateTime);
  }

}

/// https://mars.toxsl.in/food-app-yii2-2152/settings/variable/update?id=9&title=google-map-place   to change the Api in Web
