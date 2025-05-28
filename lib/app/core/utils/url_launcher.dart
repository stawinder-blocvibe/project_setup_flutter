import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static openDialerPad({required String contactNo}) async {
    Uri url = Uri.parse('tel:$contactNo');
    if (await launchUrl(url)) {
      debugPrint('dialer pad opened>>>> $contactNo');
    } else {
      debugPrint('unable to open dialer pad');
    }
  }

  static openUrl({required String? path}) async {
    if (path == null) {
      return;
    }
    final Uri url = Uri.parse(path);
    if (await launchUrl(url)) {
      debugPrint('url launched');
    } else {
      debugPrint('unable to open url');
    }
  }
}
