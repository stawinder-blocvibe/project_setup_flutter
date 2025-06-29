import 'package:base_project/app/export.dart';
import 'package:base_project/presentation/modules/authentication/models/data_model/user_data_model.dart';

class AddAmountController extends GetxController {




  Rx<dynamic> selectedAmountIndex = Rxn();
  Rx<dynamic> otherAmount = Rxn();



  addAmountCall({amount, required Function() onPaymentDone}) {
    repository
        .completeTransactionApi(
      userId: user.value?.id,
      amount: amount ?? 19,
      // matchId: liveMatch.value?.matchId,
      type: "add",
    ).then((value) {
      debugPrint("hitAddPaymentApi===>$value>>${amount}");


      if (value != null && value['message'] != null) {
        if(walletBalance.value==null ||walletBalance.value<0){
          walletBalance.value = 19;
          walletBalance.refresh();
          onPaymentDone();
          return;
        }


        walletBalance.value = walletBalance.value + amount;
        walletBalance.refresh();
        onPaymentDone();
      } else {}
    });
  }

  Rx<UserDataModel?> user = Rxn();
     handleUserData() async {
       preferenceManger.getSavedLoginData().then((value) {
         user.value = value;
         user.refresh();
         debugPrint("user=====>${user.value?.toJson()}");
       });


     }
  @override
  void onReady() {
    // TODO: implement onReady
    handleUserData();
    super.onReady();
  }

}