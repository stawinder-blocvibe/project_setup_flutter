import 'package:base_project/app/export.dart';
import 'package:base_project/presentation/modules/home/models/home_api_response.dart';
import 'package:get/get.dart';

import '../../authentication/models/data_model/user_data_model.dart';
import '../../authentication/models/response_models/user_data_model.dart';

class HomeController extends GetxController {
  // Add your observable variables and logic here
  RxString title = 'Home'.obs;

  RxInt carousalIndex = 0.obs;

  RxInt carousalBannerImageIndex = 0.obs;

  List<String> liveMatchesList = [
    'Match 1',
    'Match 2',
    'Match 3',
    'Match 4',
  ];
  List<String> ballList = [
    "W",
    "6",
    "4",
    "6",
    "NB",
    "0", "NB",
    "0",

  ];

  @override
  void onInit() {
    handleUserData();
    super.onInit();
  }

  @override
  void onReady() {
    homeApiCall();

    super.onReady();
  }


  homeApiCall() {
    repository.homeScreenApi().then((value) {
      if (value['data'] != null) {
        homeApiResponse.value = HomeApiResponse.fromJson(value["data"]);
        homeApiResponse.refresh();
      }
    });
  }

  Rx<HomeApiResponse?> homeApiResponse = Rxn();


  geUserDetails() {
    return repository.getUserDetailsApi(
        userId: user.value?.id).then((value) {
      if (value['data'] != null) {
        currentUserDataModel.value.detail =
            UserDataModel.fromJson(value["data"]);
        currentUserDataModel.refresh();

        isGenius.value = currentUserDataModel.value.detail?.isGenius ?? false;
        isGenius.refresh();
      }
    });
  }

  Rx<UserDataModel?> user = Rxn();
  handleUserData() async {
    preferenceManger.getSavedLoginData().then((value){
      user.value = value;
      user.refresh();
      debugPrint("user=====>${user.value?.toJson()}");
      geUserDetails();
    });
  }

  void hitUpdateUserApi() {
    repository.updateUser(
      userId: user.value?.id,
      data: {
        'isGenius':true
      }
     ).then((value) {
      Get.back();
      // if (value['data'] != null) {
      //   currentUserDataModel.value.detail =
      //       UserDataModel.fromJson(value["data"]);
      //   currentUserDataModel.refresh();
      //   preferenceManger.saveLoginData(currentUserDataModel.value.detail!);
      // }
    });
  }

}

