import 'package:get/get.dart';

import '../../../../app/export.dart';
import '../../../../app/routes/app_routes.dart';
import '../../../../main.dart';
import '../../authentication/models/data_model/user_data_model.dart';
import '../../authentication/models/response_models/user_data_model.dart';

class ProfileController extends GetxController {
  // Example static profile data
  final RxString name = ''.obs;
  final RxString email = ''.obs;
  final RxString phone = ''.obs;
  final RxString dob = '1997-07-05'.obs;
  final RxString avatarUrl = ''.obs;
  final RxString bio = 'Flutter enthusiast. Loves coding and cricket!'.obs;

  logout() {
    preferenceManger.clearLoginData();
    currentUserDataModel.value = UserResponseModel();
    Get.offAllNamed(AppRoutes.loginRoute);
  }


  @override
  void onReady() {
    handleUserData();
    super.onReady();
  }


  // updateUser()
  // Add more fields as needed
  // You can add methods to update profile data here


  Rx<UserDataModel?> user = Rxn();

  handleUserData() async {
    preferenceManger.getSavedLoginData().then((value) {
      user.value = value;
      user.refresh();
      debugPrint("user=====>${user.value?.toJson()}");
      name.value = user.value?.fullName ?? 'Guest User';
      phone.value = user.value?.mobileNumber.toString() ?? '';
      if(user.value?.dob!=null){
        var date = DateTime.parse(user.value!.dob!);
        dob.value = '${date.year}-${date.month}-${date.day}';
      }

      avatarUrl.value = user.value?.profileURL ?? '';
    });
  }
}

