import '../../../export.dart';

class AboutUsController extends GetxController {
  //final PreferenceManger _preferenceManger = Get.put(PreferenceManger());
  MessageResponseModel messageResponseModel = MessageResponseModel();
  ResponseModel responseModel = ResponseModel();

  // Rx<StaticResponseModel> staticPageResponseModel=StaticResponseModel().obs;
  bool isLoading = false;

  late TextEditingController pinController;
  FocusNode focusNode = FocusNode();

  TextEditingController languageTextController = TextEditingController();
  FocusNode languageFocusNode = FocusNode();

  String? selectedValue;
  bool isLanguage = true;
  var langValue = 0;
  bool notifyOn = false;

  RxInt selectedIndex = 0.obs;

  bool isYesClicked = false;
  bool isNoClicked = false;

  var versionNumber = "".obs;
  var packageName = "".obs;

  @override
  void onInit() {
    // if (_preferenceManger.getNotification() != null) {
    //   notifyOn = _preferenceManger.getNotification();
    // }
    getVersionDetails();

    super.onInit();
  }

  getVersionDetails() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    versionNumber.value = packageInfo.version;
    debugPrint('version.....${packageInfo.version}');
    packageName.value = packageInfo.packageName;
    update();
  }
}
