import 'package:get/get.dart';

import '../../../../app/export.dart';
import '../../../../app/routes/app_routes.dart';
import '../../../../main.dart';
import '../../authentication/models/data_model/user_data_model.dart';
import '../../authentication/models/response_models/user_data_model.dart';

class WithdrawController extends GetxController {

  TextEditingController amountController = TextEditingController();
  @override
  void onReady() {
    handleUserData();
    super.onReady();
  }


  Rx<UserDataModel?> user = Rxn();

  handleUserData() async {
    preferenceManger.getSavedLoginData().then((value) {
      user.value = value;
      user.refresh();
      debugPrint("user=====>${user.value?.toJson()}");

    });
  }

  withdrawCash() {
    if (amountController.text.isEmpty) {
      showInSnackBar(message: "Please enter amount");
    } else if (int.parse(amountController.text) < 50) {
      showInSnackBar(message: "Minimum withdraw amount is ₹50");
    } else if (int.parse(amountController.text) > 100000000) {
      showInSnackBar(message: "Maximum withdraw amount is ₹1 crore");
    }else if(int.parse(amountController.text) > walletBalance.value) {
      showInSnackBar(message: "Insufficient wallet balancee");
    }
    else {
      repository.completeTransactionApi(userId: user.value?.id,
          amount: int.parse(amountController.text),
          type: "withdraw").then((value) {
        walletBalance.value =
            walletBalance.value - int.parse(amountController.text);
        walletBalance.refresh();
        Get.back();
      });
    }

      // Get.toNamed(Routes.WITHDRAW_CONFIRMATION, arguments: {
      //   "amount": amountController.text,
      //   "user": user.value
      // });
    }
  }


