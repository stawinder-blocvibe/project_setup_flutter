import 'package:get/get.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../main.dart';
import '../../authentication/models/response_models/user_data_model.dart';

class ProfileController extends GetxController {
  // Example static profile data
  final RxString name = 'Satwinder Shergill'.obs;
  final RxString email = 'shergill4983@gmail.com'.obs;
  final RxString phone = '+91 9877995250'.obs;
  final RxString avatarUrl = ''.obs;
  final RxString bio = 'Flutter enthusiast. Loves coding and cricket!'.obs;

  logout() {

    preferenceManger.clearLoginData();
    currentUserDataModel.value = UserResponseModel();
    Get.offAllNamed(AppRoutes.loginRoute);
  }

  // Add more fields as needed
  // You can add methods to update profile data here
}

