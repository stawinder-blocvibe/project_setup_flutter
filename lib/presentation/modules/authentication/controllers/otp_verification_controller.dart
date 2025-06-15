

import 'package:base_project/app/export.dart';

import '../models/data_model/user_data_model.dart';

class OtpVerificationController extends GetxController {
  final GlobalKey<FormState> otpVerifyFormGlobalKey = GlobalKey<FormState>();
  TextEditingController otpTextController = TextEditingController();
  FocusNode otpFocusNode = FocusNode();

  final PreferenceManger _preferenceManger = Get.find<PreferenceManger>();
  UserDataModel userData = UserDataModel();
  dynamic phone, countryDialCode, email;
  Timer? timer;
  bool fromForgetPassword = false;
  bool isFromLogin = false;
  bool isResendLoading = false;
  RxInt start = 30.obs;
  RxString secondsStr = '00:30'.obs;

  TextEditingController mobileNumberTextController = TextEditingController();
  Rx<Country>? selectedCountry = Country(
    name: "India",
    flag: "🇮🇳",
    code: "IN",
    dialCode: "+91",
    minLength: 10,
    maxLength: 10,
  ).obs;
  FocusNode mobileNumberFocusNode = FocusNode();

  @override
  void onInit() {
    startTimer();
    getArguments();
    super.onInit();
  }

  @override
  void onReady() {
    otpFocusNode.requestFocus();
    getLoggedInUserData();
    super.onReady();
  }

  getArguments() {
    var args =  Get.arguments;
    if(args!=null && args['phone']!=null){
      phone = args['phone'];
    }
  }

  getLoggedInUserData() async {
    userData = await _preferenceManger.getSavedLoginData();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
          secondsStr.value = '00:' + (start.value).toString().padLeft(2, '0');
        }
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  validateData() {
    if (otpVerifyFormGlobalKey.currentState!.validate()) {
      verification();
    }
  }

  verification() {
    onSubmitTap(otp: otpTextController.text);

  }

  saveData(userResponseModel) {
    preferenceManger.saveAuthToken(userResponseModel.token ?? "");
    preferenceManger.saveRole(userResponseModel.detail?.roleId ?? 0);
    preferenceManger.saveRegisterData(userResponseModel.detail);
  }

  resendOtp() {

    sendApiCall();

  }



  sendApiCall() {
    repository.sendOtpApi(phone: phone).then((value) async {
      debugPrint("Send Otp Response: $value");
      if(value["message"]!=null){
        await showInSnackBar(message: value["message"]);
      }

    });
  }

  void onSubmitTap({otp}) {
    repository.verifyOtpApi(phone: phone,otp: otp).then((value) async {
      debugPrint("Send Otp Response: $value");

      if(value["message"]!=null)
        showInSnackBar(message: value['message']);
      if(value["user"]!=null){
        // UserDataModel

        

        debugPrint('tokenBhej---->${value['token']??"satta_token" }');
        preferenceManger.saveAuthToken(value["token"] ?? "satta_token");
        await preferenceManger.saveRegisterData(UserDataModel.fromJson(value["user"]));
        Get.toNamed(AppRoutes.mainParentRoute);

      }

    });
  }
}
