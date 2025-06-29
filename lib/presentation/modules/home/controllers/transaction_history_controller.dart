import 'package:base_project/app/export.dart';
import 'package:base_project/presentation/modules/authentication/models/data_model/user_data_model.dart';

import '../models/transaction_model.dart';

class TransactionHistoryController extends GetxController {








  RxList<TransactionModel> transactionList = RxList();


  Rx<UserDataModel?> user = Rxn();
     handleUserData() async {
       preferenceManger.getSavedLoginData().then((value) {
         user.value = value;
         user.refresh();
         debugPrint("user=====>${user.value?.toJson()}");
         hitTransactionApi();
       });
     }

     hitTransactionApi(){
       repository.transactionDetailApi( userId: user.value?.id).then((value){

         if(value is List<TransactionModel>){
           transactionList.value = value;
           transactionList.refresh();

           debugPrint("transactionListtransactionList===>${transactionList.length}");
         }
       });
     }
  @override
  void onReady() {
    // TODO: implement onReady
    handleUserData();

    super.onReady();
  }

}