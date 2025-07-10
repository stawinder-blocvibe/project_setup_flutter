import 'package:base_project/presentation/modules/authentication/models/data_model/user_data_model.dart';
import 'package:base_project/presentation/modules/home/models/home_api_response.dart';
import 'package:base_project/presentation/modules/home/models/pool_model.dart';
 import 'package:base_project/presentation/modules/home/models/match_prediction_model.dart'as match_prediction;
import '../../../../app/export.dart';
import '../models/match_prediction_model.dart';
import '../models/over_model.dart';
import '../models/over_new.dart';
import '../views/bottom_sheets.dart';
import 'package:base_project/presentation/modules/home/models/save_prediction_model.dart' as save_prediction;

class HarOverBallSelectionController extends GetxController {
  RxBool isHarOver = true.obs;
  Rx<UserDataModel?> user = Rxn();

  List<String> ballList = ["W", "6", "4", "6", "NB", "0", "NB", "0"];

  Rx<int?> selectedBallIndex = Rx(0);
  Rx<int?> selectedOverIndex = Rx(0);
  Rx<int?> selectedPredictIndex = Rx(0);

  void updateBallIndex({required int index, required String ballValue, required int predictIndex}) {
    if (selectedPredictIndex.value == predictIndex && selectedBallIndex.value == index) {
      // selectedPredictIndex.value = null; // Deselect if already selected
    } else {
      selectedPredictIndex.value = predictIndex; // Select the new index
      selectedBallIndex.value = index;
    }
    selectedPredictIndex.refresh();
    selectedBallIndex.refresh();
    debugPrint("Selected Ball: $ballValue at index: $index");
  }

  bool isBallHaveValue({int? overIndex, int? ballIndex, required int predictIndex}) {
    if (overIndex == null || ballIndex == null) {
      return false;
    }

    if (ballIndex == 0) {
      return overList[overIndex].predictedList?[predictIndex].firstBall != "";
    } else if (ballIndex == 1) {
      return overList[overIndex].predictedList?[predictIndex].secondBall != "";
    } else if (ballIndex == 2) {
      return overList[overIndex].predictedList?[predictIndex].thirdBall != "";
    } else if (ballIndex == 3) {
      return overList[overIndex].predictedList?[predictIndex].fourthBall != "";
    } else if (ballIndex == 4) {
      return overList[overIndex].predictedList?[predictIndex].fifthBall != "";
    } else if (ballIndex == 5) {
      return overList[overIndex].predictedList?[predictIndex].sixthBall != "";
    }
    return false; // Default case if no condition matches
  }

  @override
  void onReady() {
    handleArguments();
    handleUserData();
    overList.value = List.generate(20, (index) {
      return OverNew(
        overNumber: index + 1,
        predictedList: [
          PredictedList(
            firstBall: "",
            secondBall: "",
            thirdBall: "",
            fourthBall: "",
            fifthBall: "",
            sixthBall: "")
        ],

      );
    });
    super.onReady();
  }

  Rx<LiveMatches?> liveMatch = Rxn();
  Rx<PoolModel?> pool = Rxn();
  void handleArguments() {
    var args = Get.arguments;
    if (args != null && args['liveMatch'] != null) {
      liveMatch.value = args['liveMatch'];
      liveMatch.refresh();

      debugPrint("liveMatches.value===>${liveMatch.value?.toJson()}");
    }

    if (args != null && args['pool'] != null) {
      pool.value = args['pool'];
      pool.refresh();
    }

    if(args['isHarOver']!=null){
      isHarOver.value = args['isHarOver'];
      isHarOver.refresh();
    }
  }

  RxList<OverNew> overList = RxList();

  bool isOverHaveBall({required int overIndex}) {

    if(overList[overIndex].predictedList?.isEmpty==true || overList.isEmpty) return false ;
    return (
        (overList[overIndex].predictedList?.last.firstBall!="") &&
        (overList[overIndex].predictedList?.last.secondBall!="") &&
        (overList[overIndex].predictedList?.last.thirdBall!="") &&
        (overList[overIndex].predictedList?.last.fourthBall!="") &&
        (overList[overIndex].predictedList?.last.fifthBall!="") &&
        (overList[overIndex].predictedList?.last.sixthBall!="")
        )?true:false;
  }

  void updateOverIndex({required int index, required String overValue}) {
    if (selectedOverIndex.value == index) {
      // selectedOverIndex.value = null; // Deselect if already selected
    } else {
      selectedOverIndex.value = index; // Select the new index
    }
    selectedOverIndex.refresh();
    debugPrint("Selected OverNew: $overValue at index: $index");
  }
  jumpNextBall(){
    if( selectedBallIndex.value!=6 && selectedBallIndex.value!=null ){
      selectedBallIndex.value = (selectedBallIndex.value??0)+1;
      selectedBallIndex.refresh();
    }else{
      selectedBallIndex.value = 0;
      selectedBallIndex.refresh();
    }
  }

  setOverBallValue({
    required int overIndex,
    required int ballIndex,
    required int predictIndex,
    required String value,
  })
  {
    debugPrint(
      "setOverBallValue: OverNew Index: $overIndex, Ball Index: $ballIndex, Value: $value",
    );

    if (overList.value.isEmpty || overList.value == null ||
        overList[overIndex].predictedList==null
     ||overList[overIndex].predictedList?.isEmpty==true) {
      return;
    }






    if (ballIndex == 0) {
      overList[overIndex].predictedList![predictIndex] = overList[overIndex].predictedList![predictIndex].copyWith(
        firstBall: value
      );
      // overList[overIndex] = overList[overIndex].copyWith(predictedList: [?overList[overIndex].predictedList?.last.copyWith(firstBall: value)]);
    } else if (ballIndex == 1) {
      overList[overIndex].predictedList?[predictIndex] = overList[overIndex].predictedList![predictIndex].copyWith(
          secondBall: value
      );

    } else if (ballIndex == 2) {
      overList[overIndex].predictedList?[predictIndex] = overList[overIndex].predictedList![predictIndex].copyWith(
          thirdBall: value
      );
         } else if (ballIndex == 3) {
      overList[overIndex].predictedList?[predictIndex] = overList[overIndex].predictedList![predictIndex].copyWith(
          fourthBall: value
      );
          } else if (ballIndex == 4) {
      overList[overIndex].predictedList?[predictIndex] = overList[overIndex].predictedList![predictIndex].copyWith(
          fifthBall: value
      );
            } else if (ballIndex == 5) {
      overList[overIndex].predictedList?[predictIndex] = overList[overIndex].predictedList![predictIndex].copyWith(
          sixthBall: value
      );
           }

    overList.refresh();

    final predictedList = overList[overIndex].predictedList;
    if (predictedList != null && predictIndex < predictedList.length) {
      final over = predictedList[predictIndex];

      final first = over.firstBall;


      debugPrint("first===>${first}>>${over.secondBall}>>${over.thirdBall}>>${over.fourthBall}>>${over.fifthBall}>>${over.sixthBall} >>1${predictIndex}>${first == over.secondBall &&
          first == over.thirdBall &&
          first == over.fourthBall &&
          first == over.fifthBall &&
          first == over.sixthBall}");
      if (first == over.secondBall &&
          first == over.thirdBall &&
          first == over.fourthBall &&
          first == over.fifthBall &&
          first == over.sixthBall
         ) {
        overList[overIndex].predictedList?[predictIndex] = overList[overIndex].predictedList![predictIndex].copyWith(
            sixthBall: ''
        );
        return;
      }
    }
  }

  String getBallValue({required int overIndex, required int ballIndex, required int predictIndex}) {
    if (ballIndex == 0) {
      return overList[overIndex].predictedList?[predictIndex].firstBall??overList[overIndex].predictedList?.first.firstBall??"";
    } else if (ballIndex == 1) {
      return overList[overIndex].predictedList?[predictIndex].secondBall??overList[overIndex].predictedList?.first.secondBall??"";
    } else if (ballIndex == 2) {
      return overList[overIndex].predictedList?[predictIndex].thirdBall??overList[overIndex].predictedList?.first.thirdBall??"";
    } else if (ballIndex == 3) {
      return overList[overIndex].predictedList?[predictIndex].fourthBall??overList[overIndex].predictedList?.first.fourthBall??"";
    } else if (ballIndex == 4) {
      return overList[overIndex].predictedList?[predictIndex].fifthBall??overList[overIndex].predictedList?.first.fifthBall??"";
    } else if (ballIndex == 5) {
      return overList[overIndex].predictedList?[predictIndex].sixthBall??overList[overIndex].predictedList?.first.sixthBall??"";
    }
    return "S"; // Default case if no condition matches
  }

  void handleRightSideButtonTap({data}) {
    debugPrint(
      "check===>${data.toString().contains("5,7")} >>${(selectedBallIndex.value ?? 0) + 1}",
    );
    if (data.toString().contains("5,7")&& !data.toString().toLowerCase().contains("WKT".toLowerCase())) {
      showBallValueSelectorBottomSheet(
        context: Get.context!,
        ballNumber: (selectedBallIndex.value ?? 0) + 1,
        onSelect: (value) {
          debugPrint("value===>${value}>>${selectedBallIndex.value}");
          setOverBallValue(
            overIndex: selectedOverIndex.value ?? 0,
            ballIndex: selectedBallIndex.value ?? 0,
            value: value,
            predictIndex: selectedPredictIndex.value ?? 0,

          );
          jumpNextBall();
        },
        overNumber: selectedOverIndex.value ?? 0,
      );
    } else if (data.toString().toLowerCase().contains('UNDO'.toLowerCase())) {
      setOverBallValue(
        overIndex: selectedOverIndex.value ?? 0,
        ballIndex: ((selectedBallIndex.value) ?? 0),
        value: "",
        predictIndex: selectedPredictIndex.value ?? 0,
      );
      jumpNextBall();
    } else if (data.toString().toLowerCase().contains('Out'.toLowerCase())) {
      setOverBallValue(
        overIndex: selectedOverIndex.value ?? 0,
        ballIndex: selectedBallIndex.value ?? 0,
        value: "OUT",
        predictIndex: selectedPredictIndex.value ?? 0,
      );
      jumpNextBall();
    } else if(
    data.toString().toLowerCase().contains('WD'.toLowerCase()) ||
        data.toString().toLowerCase().contains('NB'.toLowerCase()))
    {
       var isOverFilled =  isOverCompleted(over:overList[(selectedOverIndex.value ?? 0)].predictedList?[(selectedPredictIndex.value??0)]);


       setOverBallValue(
        overIndex: selectedOverIndex.value ?? 0,
        ballIndex: selectedBallIndex.value ?? 0,
        value: data.toString().toUpperCase(),
        predictIndex: selectedPredictIndex.value ?? 0,
      );
       // if(!isOverFilled.value && overBallLength().value<6){
       //   // return ;
       //   showInSnackBar(
       //       message: "Please fill all balls of over before adding extra ball");
       // }
       // debugPrint("isOverFilled===>${overBallLength(over:overList[(selectedOverIndex.value ?? 0)].predictedList?[(selectedPredictIndex.value??0)])}");

       jumpNextBall();
    }else if(data.toString().toLowerCase().contains('WKT'.toLowerCase())){
    setOverBallValue(
    overIndex: selectedOverIndex.value ?? 0,
    ballIndex: selectedBallIndex.value ?? 0,
    value: data.toString().toUpperCase(),
    predictIndex: selectedPredictIndex.value ?? 0,
    );
    jumpNextBall();

    }
    else {
      //LB
      setOverBallValue(
        overIndex: selectedOverIndex.value ?? 0,
        ballIndex: selectedBallIndex.value ?? 0,
        value: "LB",
        predictIndex: selectedPredictIndex.value ?? 0,
      );
      jumpNextBall();
    }
  }

  bool isAllOverBallSelected({required int overIndex}) {
    if ((overList[overIndex].predictedList?.last.firstBall != "") &&
        (overList[overIndex].predictedList?.last.secondBall != "") &&
        (overList[overIndex].predictedList?.last.thirdBall != "") &&
        (overList[overIndex].predictedList?.last.fourthBall != "") &&
        (overList[overIndex].predictedList?.last.fifthBall != "") &&
        (overList[overIndex].predictedList?.last.sixthBall != "")
    ) {
      return true;
    } else {
      return false;
    }
  }

  void hitJoinContest({required Function() onSuccess}) {
    var overPrediction = jsonHandleDataPayload();
    debugPrint("overPrediction===>${overPrediction}");

    repository
        .saveUserPredictionApi(
          userId: user.value?.id ?? "",
          matchId: liveMatch.value?.matchId ?? pool.value?.matchId ?? "",

          poolId: pool.value?.poolId,
          compitionType: pool.value?.poolId != null ? "kuruk" : "harover",
          overPrediction: overPrediction,
        )
        .then((value) {
          if (value != null && value['message'] != null) {
            showInSnackBar(
              message: value['message'] ?? "hitJoinContest development",
            );
            hitAddPaymentApi(
              onPaymentDone: () {
                onSuccess();
              },
            );
          }
        });
  }

  hitAddPaymentApi({amount, required Function() onPaymentDone}) {
    repository
        .completeTransactionApi(
      userId: user.value?.id,
      amount: isHarOver.value?19:pool.value?.joiningPrice??19,
      matchId: liveMatch.value?.matchId,
      type: "deduct",
    )
        .then((value) {
      debugPrint("hitAddPaymentApi===>$value}");

      if (value != null && value['message'] != null) {
        onPaymentDone();
      } else {}
    });
  }

  RxBool inningSwitch = true.obs;

  RxBool selectedBallAddSubState = true.obs;
  void toggleSelectedBallAddSub(){
    selectedBallAddSubState.value = !selectedBallAddSubState.value;
    selectedBallAddSubState.refresh();
  }
  jsonHandleDataPayload() {
    var listOver = overList.value.where(
          (over) {
        // Find if any predicted over in this list is "fully filled"
        final completedPrediction = over.predictedList?.any((predicted) =>
        (predicted.firstBall?.isNotEmpty ?? false) &&
            (predicted.secondBall?.isNotEmpty ?? false) &&
            (predicted.thirdBall?.isNotEmpty ?? false) &&
            (predicted.fourthBall?.isNotEmpty ?? false) &&
            (predicted.fifthBall?.isNotEmpty ?? false) &&
            (predicted.sixthBall?.isNotEmpty ?? false)
        );

        return completedPrediction == true;
      },
    ).toList();

    return save_prediction.SavePredictionModel(
      innings: [
        save_prediction.Innings(
          inning: 1,
          overs: List.generate(
            listOver.length,
            (index) => save_prediction.Overs(
              over: (listOver[index].overNumber??0),
              input:
              listOver[index].predictedList?.map((predict)=>[
                 predict.firstBall??"",
                 predict.secondBall??"",
                 predict.thirdBall??"",
                 predict.fourthBall??"",
                 predict.fifthBall??"",
                 predict.sixthBall??"",
              ]).toList()??
              [
                listOver[index].predictedList?.last.firstBall,
                listOver[index].predictedList?.last.secondBall,
                listOver[index].predictedList?.last.thirdBall,
                listOver[index].predictedList?.last.fourthBall,
                listOver[index].predictedList?.last.fifthBall,
                listOver[index].predictedList?.last.sixthBall,
              ],
            ),
          ).toList(),
        ),
      ],
    ).toJson();
  }

  handleUserData() async {
    preferenceManger.getSavedLoginData().then((value) {
      user.value = value;
      user.refresh();
      debugPrint("user=====>${user.value?.toJson()}");

     });
  }


  finalAmountToPay(){
    var amount = 0;
    overList.forEach((over){
      over.predictedList?.forEach((predict){
        if((predict.firstBall != "") &&
            (predict.secondBall != "") &&
            (predict.thirdBall != "") &&
            (predict.fourthBall != "") &&
            (predict.fifthBall != "")
            && (predict.sixthBall != ""))
        {
          amount = amount + 19;
        }
      });
    });
    return amount;
  }

  RxBool isOverCompleted({PredictedList? over}) {
    // List of all ball values in the over
    if (over == null) return false.obs;
    List<String> balls = [];
    balls.addIf(over.firstBall!="" && over.firstBall!=null, over.firstBall!);
    balls.addIf(over.secondBall!="" && over.secondBall!=null, over.secondBall!);
    balls.addIf(over.thirdBall!="" && over.thirdBall!=null, over.thirdBall!);
    balls.addIf(over.fourthBall!="" && over.fourthBall!=null, over.fourthBall!);
    balls.addIf(over.fifthBall!="" && over.fifthBall!=null, over.fifthBall!);
    balls.addIf(over.sixthBall!="" && over.sixthBall!=null, over.sixthBall!);

    over.extraBalls?.forEach((ball){
      if(ball!=null && ball.isNotEmpty){
        balls.add(ball);
      }
    });

    // Count legal deliveries only (exclude "WD" and "NB")
    int legalDeliveries = balls.where((ball) =>
    ball.isNotEmpty &&
        (
            !ball.toLowerCase().contains('wd') &&
                !ball.toLowerCase().contains('nb')
        )).length;

    return (legalDeliveries==6).obs ;
  }

  RxInt overBallLength({PredictedList? over}) {
    // List of all ball values in the over
    if (over == null) return 0.obs;
    List<String> balls = [];
    balls.addIf(over.firstBall!="" && over.firstBall!=null, over.firstBall!);
    balls.addIf(over.secondBall!="" && over.secondBall!=null, over.secondBall!);
    balls.addIf(over.thirdBall!="" && over.thirdBall!=null, over.thirdBall!);
    balls.addIf(over.fourthBall!="" && over.fourthBall!=null, over.fourthBall!);
    balls.addIf(over.fifthBall!="" && over.fifthBall!=null, over.fifthBall!);
    balls.addIf(over.sixthBall!="" && over.sixthBall!=null, over.sixthBall!);

    over.extraBalls?.forEach((ball){
      if(ball!=null && ball.isNotEmpty){
        balls.add(ball);
      }
    });

    // Count legal deliveries only (exclude "WD" and "NB")
    int legalDeliveries = balls.where((ball) =>
    ball.isNotEmpty &&
       (
           !ball.toLowerCase().contains('wd') &&
           !ball.toLowerCase().contains('nb')
       )).length;

    return (legalDeliveries.obs) ;
  }

}
