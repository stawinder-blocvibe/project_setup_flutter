

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:base_project/app/export.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpController extends GetxController {
  RxBool viewPassword = true.obs;
  RxBool confirmViewPassword = true.obs;
  RxBool isTermsAccepted = false.obs;

  Rxn<CommonItemModel> selectedMerchantType = Rxn<CommonItemModel>();
  Rxn<CommonItemModel> selectedGender = Rxn<CommonItemModel>();

  // var businessType;
  // var genderValue;

  final List<CommonItemModel> gendersList = [
    CommonItemModel(id: male, title: keyMale.tr),
    CommonItemModel(id: female, title: keyFemale.tr),
    CommonItemModel(id: others, title: keyOther.tr)
  ];
  final List<CommonItemModel> merchantTypeList = [
    CommonItemModel(
        id: businessTypeRestaurant,
        title: '${keyRestaurant.tr}/${keyCloudFamilyRestaurant.tr}'),
    CommonItemModel(id: businessTypeShop, title: keyShop.tr),
    CommonItemModel(
        id: businessTypeSuperMart,
        title: '${keySuperMart.tr}/${keyFreshFoodMall.tr}')
  ];

  final PreferenceManger preferenceManger = Get.find<PreferenceManger>();
  final GlobalKey<FormState> customerFormGlobalKey = GlobalKey<FormState>();
  GlobalKey<FormState> merchantFormGlobalKey = GlobalKey<FormState>();
  GlobalKey<FormState> driverFormGlobalKey = GlobalKey<FormState>();

  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController merchantIdTextController = TextEditingController();

  // TextEditingController merchantBusinessTypeTextController =
  //     TextEditingController();
  TextEditingController riderIdTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController mobileNumberTextController = TextEditingController();
  TextEditingController dobTextController = TextEditingController();

  // TextEditingController genderTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();
  TextEditingController? countryController =
      TextEditingController(text: 'India');

  Rx<Country>? selectedCountry = Country(
    name: "India",
    flag: "🇮🇳",
    code: "IN",
    dialCode: "+91",
    minLength: 10,
    maxLength: 10,
  ).obs;

  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode merchantIdFocusNode = FocusNode();
  FocusNode merchantStyleFocusNode = FocusNode();
  FocusNode riderIdFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode mobileNumberFocusNode = FocusNode();
  FocusNode dobFocusNode = FocusNode();
  FocusNode genderFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  var userRole;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getArguments();
    super.onReady();
  }

  /*==============================================================================Get arguments====================================================================*/
  getArguments() async {
    userRole = await localStorage.read(PreferenceManger.roleId);
  }

  showOrHidePasswordVisibility() {
    viewPassword.value = !viewPassword.value;
  }

  showOrHideConfirmPasswordVisibility() {
    confirmViewPassword.value = !confirmViewPassword.value;
  }

  acceptTerms(value) {
    isTermsAccepted.value = value;
  }

  validate() async {
    // if (userRole == roleCustomer) {
    //   if (!(customerFormGlobalKey.currentState!.validate())) {
    //     return;
    //   }
    //   // if (selectedGender.value?.id == null) {
    //   //   showInSnackBar(message: keySelectGenderValidation.tr);
    //   //   return;
    //   // }
    // } else if (userRole == roleRestaurant) {
    //   if (!(merchantFormGlobalKey.currentState!.validate())) {
    //     return;
    //   }
    //   // if (selectedMerchantType.value?.id == null) {
    //   //   showInSnackBar(message: keySelectBusinessType.tr);
    //   //   return;
    //   // }
    // } else {
    //   if (!(driverFormGlobalKey.currentState!.validate())) {
    //     return;
    //   }
    // }

    if (customerFormGlobalKey.currentState!.validate()) {
      if (isTermsAccepted.value) {
        registerApiCall();
      } else {
        showInSnackBar(message: keyAcceptTnc.tr);
      }
    }
  }

  registerApiCall() {
    Map<String, dynamic> data = AuthRequestModel.registerRequestData(
      contactNumber: mobileNumberTextController.text.trim(),
      countryCode: selectedCountry?.value.dialCode.contains("+") == true
          ? selectedCountry?.value.dialCode
          : "+${selectedCountry?.value.dialCode}",
      password: passwordTextController.text.trim(),
      confirmPassword: confirmPasswordTextController.text.trim(),
      // firstName: firstNameTextController.text.trim(),
      // lastName: lastNameTextController.text.trim(),
      // email: emailTextController.text.trim(),
      // dob: dobTextController.text.trim(),
      // deviceType: repository.deviceType,
      // deviceName: repository.deviceName,
      // deviceToken: repository.deviceID,
      // merchantId: userRole == roleDriver ? riderIdTextController.text.trim() : merchantIdTextController.text.trim(),
      roleId: userRole,
      // gender: selectedGender.value?.id,
      // typeId: selectedMerchantType.value?.id,
    );

    APIRepository.registerUsers(data).then((value) {
      if (value != null) {
        UserResponseModel userResponseModel = value;
        preferenceManger.saveAuthToken(userResponseModel.token ?? "");
        preferenceManger
            .saveRole(int.parse(userResponseModel.detail?.roleId ?? 0));

        preferenceManger.saveRegisterData(userResponseModel.detail);
        if (userResponseModel.detail?.otpVerify == null ||
            userResponseModel.detail?.otpVerify == 0) {
          showInSnackBar(
              message: "${keyOtpIs.tr} ${userResponseModel.detail?.otp}");
          Get.toNamed(AppRoutes.otpVerificationRoute,
              arguments: {argIsFromLogin: false});
        } else {
          if (userResponseModel.detail?.roleId.toString() ==
              roleRestaurant.toString()) {
            if (userResponseModel.detail?.isAdded == 0) {
              Get.offAllNamed(AppRoutes.addRestaurantRoute);
            } else {
              Get.offAllNamed(AppRoutes.restaurantMainRoute);
            }
          } else if (userResponseModel.detail?.roleId.toString() ==
              roleDriver.toString()) {
            if (userResponseModel.detail?.isDefault == 0) {
              Get.offAllNamed(AppRoutes.driverProfileSetupRoute);
            } else if (userResponseModel.detail?.isDefault == 1) {
              Get.offAllNamed(AppRoutes.addVehicleRoute);
            } else if (userResponseModel.detail?.isDefault == 2) {
              Get.offAllNamed(AppRoutes.driverMainRoute);
            }
          } else {
            Get.offAllNamed(AppRoutes.customerMainScreen);
          }
        }
      }
    }).onError((error, stackTrace) {
      customLoader.hide();
      showInSnackBar(message: error.toString());
    });
  }

  @override
  void onClose() {
    customLoader.hide();
    super.onClose();
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();
  dynamic userCredential;

  Future handleAlreayLogin() async {
    GoogleSignInAccount? currentUser = googleSignIn.currentUser;

    await googleSignIn.signOut();
    await logInGoogle();
  }

  Future logInGoogle() async {
    try {
      userCredential = await signInWithGoogle();
    } catch (e) {
      googleSignIn.signOut();
      customLoader.hide();
      debugPrint("google error $e");
    }
  }

  Future signInWithGoogle() async {
    try {
      var token = await FirebaseMessaging.instance.getToken();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        debugPrint("Google sign-in failed: user is null");
        return; // Exit early if the user didn't sign in
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        throw Exception("Google authentication failed, missing tokens");
      }

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken!,
        idToken: googleAuth.idToken!,
      );

      debugPrint("Google User Info:");
      debugPrint("Token: ${googleAuth.idToken!}");
      debugPrint("Email: ${googleUser.email}");
      debugPrint(
          "First Name: ${googleUser.displayName?.split(" ").first ?? ""}");
      debugPrint("Last Name: ${googleUser.displayName?.split(" ").last ?? ""}");
      debugPrint("User ID: ${googleUser.id}");
      debugPrint("Photo URL: ${googleUser.photoUrl}");

      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        debugPrint('Successfully signed in: $value');
        // Optionally: Hit your social login API here

        Map<String, dynamic> data = AuthRequestModel.socialLoginReq(
            deviceType: repository.deviceType,
            deviceName: repository.deviceName,
            deviceToken: token, //repository.deviceID,
            email: googleUser.email,
            fullName: '${googleUser.displayName?.split(" ").first ?? ""}',
            imgUrl: '${googleUser.photoUrl}',
            userId: '${googleUser.id}',
            username: "${googleUser.email}",
            provider: '1');
        repository.socialLoginUserApi(data).then((value) async {
          if (value != null) {
            // Get.snackbar('Success', "Login Success!!");
            customLoader.hide();
            UserResponseModel userResponseModel = value;
            currentUserDataModel.value = userResponseModel;
            currentUserDataModel.refresh();
            preferenceManger.saveAuthToken(userResponseModel.token ?? "");
            preferenceManger.saveRole(userResponseModel.detail?.roleId ?? 0);
            await preferenceManger.saveRegisterData(userResponseModel.detail);

            if (currentUserDataModel.value.detail?.otpVerify == 1 &&
                currentUserDataModel.value.detail?.is_profile_setup == 1) {
              Get.offAllNamed(AppRoutes.customerMainScreen);

              if (currentUserDataModel.value.detail?.is_profile_setup == 1) {
                Get.offAllNamed(AppRoutes.customerMainScreen);
              }
            } else if (currentUserDataModel.value.detail?.is_profile_setup !=
                1) {
              Get.toNamed(
                AppRoutes.customerProfileSetup,
                arguments: {
                  "fromOtp": true,
                  "contact_no":
                      currentUserDataModel.value.detail?.contactNo.toString(),
                  "country_code":
                      currentUserDataModel.value.detail?.countryCode.toString(),
                  "isSocial": currentUserDataModel.value.detail?.isSocial
                },
              );
            } else {
              showInSnackBar(
                  message: "${currentUserDataModel.value.detail?.otp}");
              Get.toNamed(AppRoutes.otpVerificationRoute);
            }
          }
          customLoader.hide();
        }).onError((error, stackTrace) {
          // showInSnackBar(message: error.toString());
          customLoader.hide();
        });
      }).whenComplete(() {});
    } catch (error) {
      debugPrint("Error during sign-in: $error");
      googleSignIn.signOut();
      customLoader.hide();
    }
  }
}

class CommonItemModel {
  int? id;
  String? title;
  String? image;
  int? stateId;
  int? typeId;
  String? createdOn;
  int? createdById;
  bool? isSelected = false;

  CommonItemModel(
      {this.id,
        this.title,
        this.image,
        this.stateId,
        this.typeId,
        this.createdOn,
        this.isSelected,
        this.createdById});

  CommonItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    stateId = json['state_id'];
    typeId = json['type_id'];
    createdOn = json['created_on'];
    createdById = json['created_by_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['state_id'] = this.stateId;
    data['type_id'] = this.typeId;
    data['created_on'] = this.createdOn;
    data['created_by_id'] = this.createdById;
    return data;
  }
}