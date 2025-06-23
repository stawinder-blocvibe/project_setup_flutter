import 'package:base_project/presentation/modules/authentication/models/response_models/user_data_model.dart';
 import 'app/export.dart';


CustomLoader customLoader = CustomLoader();
GetStorage localStorage = GetStorage();
APIRepository repository = APIRepository();
PreferenceManger preferenceManger = PreferenceManger();
late final deviceToken;
bool isOrder = false;

var localKey;
Rx<UserResponseModel> currentUserDataModel = UserResponseModel().obs;
Rx<dynamic> walletBalance = Rxn(50000);


main() async {
  WidgetsFlutterBinding.ensureInitialized();


  preferenceManger = Get.put(PreferenceManger());
  initStorage();
  repository = Get.put(APIRepository());

  orientation();
  errorCrashLogger();

  initApp();
}


errorCrashLogger() {

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


  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Set to any color
    statusBarIconBrightness: Brightness.dark, // or Brightness.light
    statusBarBrightness: Brightness.light, // For iOS (light = dark icons)
  ));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}
