import 'package:connectivity_plus/connectivity_plus.dart';

import '../../export.dart';

class NoInternetConnectionScreen extends StatefulWidget {
  final int? screenType;

  NoInternetConnectionScreen({super.key, this.screenType});

  @override
  State createState() => _NoInternetConnectionScreenState();
}

class _NoInternetConnectionScreenState extends State<NoInternetConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No Connection",
              style: textStyleBody1().copyWith(fontSize: font_18, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: height_10,
            ),
            Text(
              "No internet connection found.Check your connection or try again.",
              textAlign: TextAlign.center,
              style: textStyleBody1().copyWith(color: Colors.black45, fontSize: font_15, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: height_15,
            ),
            SizedBox(
              width: Get.width / 2.5,
              child: MaterialButtonWidget(
                onPressed: () {
                  checkInternet();
                },
                buttonRadius: radius_10,
                textColor: Colors.white,
                buttonText: "Try Again",
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkInternet() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      showInSnackBar(message: 'No internet connection');
    } else {
      if (widget.screenType == 1) {
        Get.offAllNamed(AppRoutes.splashRoute);
      } else {
        Get.back();
      }
    }
  }
}
