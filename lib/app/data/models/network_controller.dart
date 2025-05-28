import 'package:connectivity_plus/connectivity_plus.dart';

import '../../core/widget/no_internet_connection.dart';
import '../../export.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      // offlineSheet();
      Get.to(NoInternetConnectionScreen(screenType: 1));
      update();
    } else {
      Get.back();
      update();
    }
  }

  offlineSheet() {
    return Get.dialog(
        barrierDismissible: false,
        WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Container(
            width: Get.width * 0.70,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
          ),
        ));
  }

  offlineDialog() {
    return Get.dialog(
        barrierDismissible: false,
        WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Container(
                        width: Get.width * 0.70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(margin_20)),
                        child: Column(
                          children: [
                            AssetImageWidget(
                              iconsAlert,
                              imageHeight: height_100,
                            ),
                            TextView('No internet connection',
                                    textStyle: TextStyle(
                                        fontSize: font_17,
                                        fontWeight: FontWeight.bold))
                                .paddingSymmetric(vertical: margin_8),
                            TextView("Check Your Internet Connection",
                                    textStyle: TextStyle(
                                        fontSize: font_15,
                                        fontWeight: FontWeight.bold))
                                .paddingSymmetric(vertical: margin_8),
                          ],
                        ).paddingSymmetric(vertical: margin_15)))
              ]),
        ));
  }
}
