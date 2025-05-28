

import 'app/export.dart';

CustomLoader customLoader = CustomLoader();
GetStorage localStorage = GetStorage();
APIRepository repository = APIRepository();
PreferenceManger preferenceManger = PreferenceManger();
late final deviceToken;
bool isOrder = false;

var localKey;
Rx<UserResponseModel> currentUserDataModel = UserResponseModel().obs;
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
/*  HelperFunction.handlePlatform(callAndroidFunction: () async {
    // await Firebase.initializeApp();
  }, callIosFunction: () {
    debugPrint('Ios code Call test');
  });*/

  preferenceManger = Get.put(PreferenceManger());
  initStorage();
  repository = Get.put(APIRepository());
  // MediaKit.ensureInitialized();
  orientation();
  errorCrashLogger();
  // enableNotification();
  initApp();
}

// enableNotification() async {
//   // await Firebase.initializeApp();
//   await PushNotificationsManager().init();
//   // await CustomNotificationManager.initialize();
//   WidgetsFlutterBinding.ensureInitialized();
//   const AndroidInitializationSettings initializationSettingsAndroid =
//   AndroidInitializationSettings('@mipmap/ic_launcher');
//
//   const InitializationSettings initializationSettings =
//   InitializationSettings(android: initializationSettingsAndroid);
//
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
// }

errorCrashLogger() {
  /*PlatformDispatcher.instance.onError = (error, stack) {
    reportCrash(error.toString() + '\n' + stack.toString(), stack);
    return true;
  };*/

  FlutterError.onError = (details) async {
    debugPrint('details=error====>${details.stack}>>${details.exception}');
    if (details.stack != null) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      reportCrash(
          details.exception.toString() + '\n' + details.stack.toString(),
          details.stack!);
    } else {
      FlutterError.presentError(details);
    }
  };
}

initStorage() async {
  await GetStorage.init();
}

initApp() async {
  localKey = await PreferenceManger().getDefaultLanguage();
  debugPrint("localKey ${localKey}");
  runApp(MyApp());
}

orientation() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}
