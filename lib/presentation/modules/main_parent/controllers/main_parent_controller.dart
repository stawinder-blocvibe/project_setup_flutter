import 'package:base_project/presentation/modules/authentication/models/response_models/user_data_model.dart';
import 'package:base_project/presentation/modules/home/controllers/my_matches_controller.dart';
import 'package:base_project/presentation/modules/home/views/my_winnings.dart';

import '../../../../app/export.dart';
import '../../authentication/models/data_model/user_data_model.dart';
import '../../home/views/home_view.dart';
import '../../home/views/my_matches_screen.dart';
import '../../home/views/transaction_history.dart';
import '../../home/views/profile_screen.dart';

class MainParentController extends GetxController {
  RxInt bottomNavIndex = 0.obs;

  RxList<Widget> homeList = <Widget>[
    HomeScreen(),
    MyMatchesScreen(),

    Text("Predict"),

    TransactionHistory()??
    MyWinnings(needBackButton: false,),
    ProfileScreen(),
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    handleUserData(
      onComplete: () {
        debugPrint("onReady=====>${currentUserDataModel.value?.toJson()}");
        if (currentUserDataModel.value?.detail?.id != null) {
          hitWalletApiCall();
        }
      },
    );

    super.onReady();
  }

  updateBottomNavIndex(int index) {
    bottomNavIndex.value = index;
    if (index == 0) {} else if (index == 1) {
      Get.find<MyMatchesController>().hitMyMatchesApi(

      );
    } else if (index == 2) {} else if (index == 3) {}
  }

  @override
  void onClose() {
    super.onClose();
  }

  void hitWalletApiCall() {
    debugPrint(
        "hitWalletApiCall===>>${currentUserDataModel.value?.detail?.id}");
    repository
        .walletDetailApi(userId: currentUserDataModel.value?.detail?.id)
        .then((value) {
      debugPrint("hitWalletApiCall===>$value");
      walletBalance.value = value;
      walletBalance.refresh();
    });
  }


  Future handleUserData({ Function()?  onComplete}) async {
    preferenceManger.getSavedLoginData().then((value) {
      //UserResponseModel  ,UserDataModel
      currentUserDataModel.value = UserResponseModel(
        detail: value,

      );
      currentUserDataModel.refresh();
      debugPrint("user=====>${currentUserDataModel.value?.toJson()}");

      if(onComplete!=null){
        onComplete();
      }
    });
  }
}
