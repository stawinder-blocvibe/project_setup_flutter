


import '../../../../app/export.dart';
import '../../authentication/models/data_model/user_data_model.dart';

class MyInfoController extends GetxController {
  RxString profileImage = "".obs;
  late TextEditingController nameController;

  late TextEditingController emailController;

  late TextEditingController phoneController;

  late TextEditingController dobController;

  RxString selectedGender = "".obs;

  late TextEditingController addressController;

  late TextEditingController uidController;

  late TextEditingController panController;

  @override
  void onInit() {
    handleInit();
    // handleArgs();
    super.onInit();
  }
  @override
  void onReady() {
    handleUserData();

    super.onReady();
  }

  var args = {
    "profileImage": "", //userProfileNetwork
    "name": "Guest User",
    "email": "",
    "phone": "",
    "dobController": "1997-07-05",

    "addressController": "",
    "uidController": "",
    "panController": "",
  };

  void handleInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    dobController = TextEditingController();

    addressController = TextEditingController();
    uidController = TextEditingController();
    panController = TextEditingController();

    selectedGender.value = "";
  }

  handleArgs() {
    profileImage.value = user.value?.profileURL??args["profileImage"] ?? "";
    nameController.text = user.value?.fullName??args["name"] ?? "";
    emailController.text = user.value?.email??args['email'] ?? "";
    phoneController.text = user.value?.mobileNumber??args["phone"] ?? "";
    dobController.text = user.value?.dob??args["dobController"] ?? "";

    addressController.text = args["addressController"] ?? "";
    uidController.text = args["uidController"] ?? "";
    panController.text = args["panController"] ?? "";
  }

  void updateProfile() async {
    var data = {
      "fullName": nameController.value.text.trim(),
      "email": emailController.text.trim(),
      "phone": phoneController.text.trim(),
      "dob": dobController.text,
      'address': addressController.text.trim(),
       'gender':selectedGender.value.isEmpty?"Other":selectedGender.value,
      // 'profileURL': profileImage.value,
      if(isCameraImageSelected)
        'profileURL':await MultipartFile.fromFile(profileImage.value,
            filename: getFileNameWithoutExtension(profileImage.value))

      /*  [
          await MultipartFile.fromFile(profileImage.value,
              filename: getFileNameWithoutExtension(profileImage.value))
        ],*/
    };

    repository.updateUser(data: data, userId: user.value?.id).then((value) {

      debugPrint("Update profile response ===> ${value}");
      if (value['message']!=null) {
        showInSnackBar(message: "${value['message']}");
        Navigator.pop(Get.context!,{
          'profileImage': getProfileUrl(value),
          'name': nameController.text.trim(),
          // 'phone': phoneController.text.trim(),
          'dob': dobController.text.trim()
        });
      } else {
        showInSnackBar(message: "Failed to update profile");
      }
    }).catchError((error) {
      showInSnackBar(message: "Error: $error");
    });
    debugPrint("Data to update profile === > \n${data}");
  }


  String? getProfileUrl(Map<String, dynamic> json) {
    return json['user']?['profileURL'];
  }
  get isCameraImageSelected =>
      profileImage.value.isNotEmpty && !profileImage.value.contains('http');

  Future<dynamic> onTapCamera() async {
    var image = await imageFromCamera().then((value) {
      debugPrint("Camera clicked00 === >${value}");
      return value;
    });

    debugPrint("Camera_clicked_44 === >${image}");

    return image;
    /*  picksinglefile().then((value){
      if (value != null) {
        profileImage.value = value.path;
      } else {
        showInSnackBar(message: "Please select image");
      }
    }).catchError((error) {
      showInSnackBar(message:"Error: $error");
    });*/

    // imageFromCamera(
    // );


  }

  String getFileNameWithoutExtension(String filePath) {
    String fileName = filePath
        .split('/')
        .last;
    return fileName
        .split('.')
        .first;
  }


  Rx<UserDataModel?> user = Rxn();

  handleUserData() async {
    preferenceManger.getSavedLoginData().then((value) {
      user.value = value;
      user.refresh();
      debugPrint("user=====>${user.value?.toJson()}");
      handleArgs();
    });
  }
}