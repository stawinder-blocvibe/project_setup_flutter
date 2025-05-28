import 'package:base_project/app/export.dart';

class CustomerProfileSetupController extends GetxController {
  RxString profileImage = "".obs;

  UserResponseModel userResponseModel = UserResponseModel();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  var contactNumber, countryCode;
  dynamic isSocial;
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController genderTextController = TextEditingController();
  TextEditingController dobTextController = TextEditingController();
  TextEditingController mobileNumberTextController = TextEditingController();

  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode genderFocusNode = FocusNode();
  FocusNode dobFocusNode = FocusNode();
  FocusNode mobileNumberFocusNode = FocusNode();
  String selectedDate = "";
  RxBool isEdit = false.obs;
  RxList<String> genderType = [keyMale.tr, keyFemale.tr, keyOthers.tr].obs;
  RxString selectGender = "".obs;

  Rx<Country>? selectedCountry = Country(
    name: "India",
    flag: "🇮🇳",
    code: "IN",
    dialCode: "+91",
    minLength: 10,
    maxLength: 10,
  ).obs;

  @override
  onInit() {
    firstNameTextController.addListener(() {
      String firstName = firstNameTextController.text;
      if (firstName.isNotEmpty) {
        String capitalizedTextFirstName =
            firstName[0].toUpperCase() + firstName.substring(1);
        if (firstName != capitalizedTextFirstName) {
          firstNameTextController.value =
              firstNameTextController.value.copyWith(
            text: capitalizedTextFirstName,
            selection: TextSelection.fromPosition(
              TextPosition(offset: capitalizedTextFirstName.length),
            ),
          );
        }
      }
    });
    lastNameTextController.addListener(() {
      String lastName = lastNameTextController.text;
      if (lastName.isNotEmpty) {
        String capitalizedTextLastName =
            lastName[0].toUpperCase() + lastName.substring(1);
        if (lastName != capitalizedTextLastName) {
          lastNameTextController.value = lastNameTextController.value.copyWith(
            text: capitalizedTextLastName,
            selection: TextSelection.fromPosition(
              TextPosition(offset: capitalizedTextLastName.length),
            ),
          );
        }
      }
    });
    getArgs();
    setData();
    super.onInit();
  }

  updateImageFile(Future imagePath) async {
    PickedFile? file = await imagePath;
    if (file != null) {
      profileImage.value = file.path;
      update();
    }
  }

  validateForm() {
    if (globalKey.currentState!.validate()) {
      hitProfileSetup();
    }
  }

  hitProfileSetup() async {
    customLoader.show(Get.overlayContext);
    MultipartFile? profilePicture;
    if (!(profileImage.value.contains('http')) && profileImage.value != "") {
      if (profileImage.value.contains('http')) {
        profileImage.value = "";
      } else {
        profilePicture = await MultipartFile.fromFile(profileImage.value,
            filename: profileImage.value);
      }
    }

    debugPrint('isEdit--->${isEdit.value}>>${mobileNumberTextController.text}');
    var data = {
      "User[profile_file]": profilePicture,
      "User[first_name]": firstNameTextController.text.trim(),
      "User[last_name]": lastNameTextController.text.trim(),
      "User[date_of_birth]": dobTextController.text.trim(),
      "User[country_code]": (isSocial == 1 || isSocial == true)
          ? selectedCountry?.value.dialCode.toString()
          : countryCode,
      "User[contact_no]": isEdit.value
          ? mobileNumberTextController.text.toString() /*.split(" ")[1]*/
          : (isSocial == 1 || isSocial == true)
              ? mobileNumberTextController.text
              : contactNumber.replaceAll("+", ""),
      "User[gender]": selectGender.value
    };

    debugPrint('preferenceManger--->${preferenceManger.getAuthToken()}');
    APIRepository.profileSetupApiCall(dataBody: data).then((value) {
      if (value != null) {
        customLoader.hide();
        userResponseModel = value;

        currentUserDataModel.value = userResponseModel;
        saveDataToLocalStorage(userResponseModel);
        Get.offAllNamed(AppRoutes.customerMainScreen);
        customLoader.hide();
      }
    }).onError((error, stackTrace) {
      customLoader.hide();
      showInSnackBar(message: error.toString());
      showInSnackBar(message: error.toString());
    });
  }

  saveDataToLocalStorage(UserResponseModel? signupResponseModel) async {
    await preferenceManger.saveRegisterData(signupResponseModel?.detail);
  }

  getArgs() {
    if (Get.arguments != null) {
      isEdit.value = Get.arguments["isEdit"] ?? false;
      isEdit.refresh();
      countryCode = Get.arguments['country_code'] ?? "";
      contactNumber = Get.arguments['contact_no'] ?? "";
      isSocial = Get.arguments['isSocial'] ?? false;

      if (contactNumber == "" || contactNumber == null) {
        return;
      }
      var formattedNumber =
          ("" + countryCode ?? "") + " " + contactNumber ?? "";
      if (formattedNumber.startsWith("+")) {
        formattedNumber = formattedNumber.substring(1);
      }
      mobileNumberTextController.text = formattedNumber == "null"
          ? ""
          : formattedNumber.replaceFirst("++", "+");

      debugPrint('isEdit.value--->${isEdit.value}');
    }
    debugPrint("number${mobileNumberTextController.text}");
  }

  setData() {
    firstNameTextController.text =
        currentUserDataModel.value.detail?.firstName ?? "";
    lastNameTextController.text =
        currentUserDataModel.value.detail?.lastName ?? "";
    dobTextController.text =
        currentUserDataModel.value.detail?.dateOfBirth ?? "";
    // var formattedNumber = "${(currentUserDataModel.value.detail?.countryCode.toString() ?? "")} ${currentUserDataModel.value.detail?.contactNo ?? ""}";
    // if (formattedNumber.startsWith("+")) {
    //   formattedNumber = formattedNumber.substring(1);
    // }
    if (currentUserDataModel.value.detail?.contactNo != null ||
        currentUserDataModel.value.detail?.contactNo?.isNotEmpty == true)
      mobileNumberTextController.text =
          "${currentUserDataModel.value.detail?.contactNo ?? ""}"
              .replaceFirst("++", "+");
    profileImage.value = currentUserDataModel.value.detail?.profileFile ?? "";
    countryCode =
        currentUserDataModel.value.detail?.countryCode.toString() ?? "";
    selectGender.value =
        currentUserDataModel.value.detail?.gender.toString() ?? "0";
    setUpConstGender(currentUserDataModel.value.detail?.gender.toString());
    debugPrint("mobileNumber:${mobileNumberTextController.text}");
    if (mobileNumberTextController.text.contains('null')) {
      mobileNumberTextController.text = "";
    }
  }

  setUpConstGender(index) {
    if (index == "0") {
      genderTextController.text = keyMale.tr;
    } else if (index == "1") {
      genderTextController.text = keyFemale.tr;
    } else {
      genderTextController.text = keyOthers.tr;
    }
  }

  @override
  void onClose() {
    customLoader.hide();
    super.onClose();
  }
}
