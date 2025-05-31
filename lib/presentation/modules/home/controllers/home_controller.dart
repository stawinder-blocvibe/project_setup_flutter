import 'package:get/get.dart';

class HomeController extends GetxController {
  // Add your observable variables and logic here
  RxString title = 'Home'.obs;

  RxInt carousalIndex = 0.obs;

  List<String> liveMatchesList= [
    'Match 1',
    'Match 2',
    'Match 3',
    'Match 4',
  ];
  List<String> ballList= [
    "W",
    "6",
    "4",
    "6",
    "NB",
    "0","NB",
    "0",

  ];

  @override
  void onInit() {
    super.onInit();
    // Initialize your controller
  }
}

