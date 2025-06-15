
import 'package:base_project/presentation/modules/authentication/models/data_model/user_data_model.dart';
import 'package:base_project/presentation/modules/home/models/home_api_response.dart';
import 'package:base_project/presentation/modules/home/models/pool_model.dart';
import 'package:base_project/presentation/modules/home/models/save_prediction_model.dart';

import '../../../../app/export.dart';
import '../models/over_model.dart';
import '../views/bottom_sheets.dart';

class OverBallSelectionResultController extends GetxController {

  Rx<UserDataModel?> user = Rxn();


  List<String> ballList= [
    "W",
    "6",
    "4",
    "6",
    "NB",
    "0",
    "NB",
    "0",

  ];

  Rx<int?> selectedBallIndex = Rx(null);
  Rx<int?> selectedOverIndex = Rx(null);

  void updateBallIndex({required int index, required String ballValue}) {
    if (selectedBallIndex.value == index) {
      selectedBallIndex.value = null; // Deselect if already selected
    } else {
      selectedBallIndex.value = index; // Select the new index
    }
    selectedBallIndex.refresh();
    debugPrint("Selected Ball: $ballValue at index: $index");
  }

  bool isBallHaveValue({ int? overIndex,  int? ballIndex}) {

    if(overIndex==null || ballIndex==null ){
      return false;
    }


    if(ballIndex==0){
      return overList[overIndex].firstBall!="";
    }else if(ballIndex==1) {
      return overList[overIndex].secondBall != "";
    }
    else if(ballIndex==2) {
      return overList[overIndex].thirdBall != "";
    }
    else if(ballIndex==3) {
      return overList[overIndex].fourthBall != "";
    }
    else if(ballIndex==4) {
      return overList[overIndex].fifthBall != "";
    }
    else if(ballIndex==5) {
      return overList[overIndex].sixthBall != "";
    }
    return false; // Default case if no condition matches
  }





  @override
  void onReady() {
    handleArguments();
      handleUserData();

    overList.value =  List.generate(20, (index) {
      return Over(
        overNumber: index + 1,
        firstBall: "",
        secondBall: "",
        thirdBall: "",
        fourthBall: "",
        fifthBall: "",
        sixthBall: "",
      );
    });
    super.onReady();
  }


  Rx<LiveMatches?> liveMatch = Rxn();
  Rx<PoolModel?> pool = Rxn();
  void handleArguments() {
    var args = Get.arguments;
    if(args!=null && args['liveMatch']!=null){
      liveMatch.value  = args['liveMatch'];
      liveMatch.refresh();

      debugPrint("liveMatches.value===>${liveMatch.value?.toJson()}");
    }

    if(args!=null && args['pool']!=null){
      pool.value = args['pool'];
      pool.refresh();
    }
  }

  RxList<Over> overList = RxList();

  bool isOverHaveBall({required int overIndex}) {
    return (overList[overIndex].firstBall!=""&&
        overList[overIndex].secondBall!="" &&
        overList[overIndex].thirdBall!="" &&
        overList[overIndex].fourthBall!="" &&
        overList[overIndex].fifthBall!="" &&
        overList[overIndex].sixthBall!="");
  }

  void updateOverIndex({required int index, required String overValue}) {
    if (selectedOverIndex.value == index) {
      selectedOverIndex.value = null; // Deselect if already selected
    } else {
      selectedOverIndex.value = index; // Select the new index
    }
    selectedOverIndex.refresh();
    debugPrint("Selected Over: $overValue at index: $index");
  }

   setOverBallValue({
    required int overIndex,
    required int ballIndex,
    required String value,
  }) {
    debugPrint("setOverBallValue: Over Index: $overIndex, Ball Index: $ballIndex, Value: $value");

    if(overList.value.isEmpty ||overList.value==null){
      return;
    }
    if (ballIndex == 0) {
      overList[overIndex] = overList[overIndex].copyWith(firstBall: value);

    } else if (ballIndex == 1) {

      overList[overIndex] = overList[overIndex].copyWith(secondBall: value);

    } else if (ballIndex == 2) {

      overList[overIndex] = overList[overIndex].copyWith(thirdBall: value);

    } else if (ballIndex == 3) {

      overList[overIndex] = overList[overIndex].copyWith(fourthBall: value);

    } else if (ballIndex == 4) {

      overList[overIndex] = overList[overIndex].copyWith(fifthBall: value);

    } else if (ballIndex == 5) {

      overList[overIndex] = overList[overIndex].copyWith(sixthBall: value);

    }

    overList.refresh();
  }

  String getBallValue({ required int overIndex,  required int ballIndex}) {

    if(ballIndex==0){
      return overList[overIndex].firstBall;
    }else if(ballIndex==1) {
      return overList[overIndex].secondBall;
    }
    else if(ballIndex==2) {
      return overList[overIndex].thirdBall;
    }
    else if(ballIndex==3) {
      return overList[overIndex].fourthBall;
    }
    else if(ballIndex==4) {
      return overList[overIndex].fifthBall;
    }
    else if(ballIndex==5) {
      return overList[overIndex].sixthBall;
    }
    return "S"; // Default case if no condition matches
  }

  void handleRightSideButtonTap({data}) {


    debugPrint("check===>${data.toString().contains("5")} >>${(selectedBallIndex.value??0)+1}");
    if(data.toString().contains("5")){
     showBallValueSelectorBottomSheet(
       context: Get.context!,
       ballNumber: (selectedBallIndex.value??0)+1,
       onSelect: (value){
         debugPrint("value===>${value}>>${selectedBallIndex.value}");
         setOverBallValue(overIndex: selectedOverIndex.value??0,
             ballIndex: selectedBallIndex.value??0, value: value);
       },
       overNumber: selectedOverIndex.value??0
     );
    }
    else if(data.toString().toLowerCase().contains('UNDO'.toLowerCase())){
      setOverBallValue(overIndex: selectedOverIndex.value??0,
          ballIndex: ((selectedBallIndex.value)??0), value: "");
    }else if(data.toString().toLowerCase().contains('Out'.toLowerCase())){
      setOverBallValue(overIndex: selectedOverIndex.value??0,
          ballIndex: selectedBallIndex.value??0, value: "OUT");
    }
    else{
      //LB
      setOverBallValue(overIndex: selectedOverIndex.value??0,
          ballIndex: selectedBallIndex.value??0, value: "LB");
    }
  }

  bool isAllOverBallSelected({required int overIndex}) {
    if(
    overList[overIndex].firstBall!="" &&
    overList[overIndex].secondBall!="" &&
    overList[overIndex].thirdBall!="" &&
    overList[overIndex].fourthBall!="" &&
    overList[overIndex].fifthBall!="" &&
    overList[overIndex].sixthBall!=""
    ){
      return true;
    }else{
      return false;
    }
  }

  void hitJoinContest({required Function() onSuccess}) {
    var overPrediction = jsonHandleDataPayload();
    debugPrint("overPrediction===>${overPrediction}");

    repository.saveUserPredictionApi(
      userId: user.value?.id??"",
      matchId: liveMatch.value?.matchId??pool.value?.matchId??"",

      poolId: pool.value?.poolId,
      compitionType: pool.value?.poolId!=null?"kuruk":"Harover",
      overPrediction: overPrediction
    ).then((value){
      if(value!=null && value['message']!=null){
        showInSnackBar(message: value['message']??"hitJoinContest development");
         hitAddPaymentApi(onPaymentDone: (){
          onSuccess();
        },);
      }
    });
  }

   hitAddPaymentApi({amount,required Function() onPaymentDone}){
    repository.completeTransactionApi(
      userId: user.value?.id,
      amount: amount??19,
      matchId: liveMatch.value?.matchId,
      type: "deduct"
    ).then((value){

      debugPrint("hitAddPaymentApi===>$value}");

      if(value!=null && value['message']!=null){
        onPaymentDone();

      }
      else{

      }
    });
  }

  RxBool inningSwitch = true.obs;
  jsonHandleDataPayload() {


    var listOver = overList.value.where((over) =>
    over.firstBall.isNotEmpty &&
        over.secondBall.isNotEmpty &&
        over.thirdBall.isNotEmpty &&
        over.fourthBall.isNotEmpty &&
        over.fifthBall.isNotEmpty &&
        over.sixthBall.isNotEmpty
    ).toList();


    return SavePredictionModel(
      innings: [
        Innings(
          inning: 1,
          overs: List.generate(listOver.length, (index)=> Overs(
            over: (listOver[index].overNumber+1),
            input: [
              listOver[index].firstBall,
              listOver[index].secondBall,
              listOver[index].thirdBall,
              listOver[index].fourthBall,
              listOver[index].fifthBall,
              listOver[index].sixthBall,
            ]
          )).toList()
            
        ),
      ]
    ).toJson();
    // deefeff
  }

   Future handleUserData() async {
   preferenceManger.getSavedLoginData().then((value){
     user.value = value;
     user.refresh();
     debugPrint("user=====>${user.value?.toJson()}");


       hitAllPredictionApi();
   });

  }


  RxList<SavePredictionModel> myPredictions = RxList();
  Future hitAllPredictionApi()async {
    repository.allPredictionApi(userId: user.value?.id).then((value){

      debugPrint("ddddddd====>${(value['data'][0]['overPrediction'])}");
      if(value!=null && value['data']!=null){
        var list = value['data'] as List;
        myPredictions.clear();
        list.forEach((element){
         var overPrediction =  element['overPrediction'];
         myPredictions.add(SavePredictionModel.fromJson(overPrediction));
        });
        myPredictions.refresh();


        debugPrint("myPredictionsmyPredictionsmyPredictions=>${myPredictions.length}");
      }
    });
  }
}