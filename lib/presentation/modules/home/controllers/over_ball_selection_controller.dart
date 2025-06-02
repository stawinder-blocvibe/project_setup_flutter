
import '../../../../app/export.dart';

class OverBallSelectionController extends GetxController {

  List<String> ballList= [
    "W",
    "6",
    "4",
    "6",
    "NB",
    "0","NB",
    "0",

  ];

  Rx<int?> selectedBallIndex = Rx(null);

  void updateBallIndex({required int index, required String ballValue}) {
    if (selectedBallIndex.value == index) {
      selectedBallIndex.value = null; // Deselect if already selected
    } else {
      selectedBallIndex.value = index; // Select the new index
    }
    selectedBallIndex.refresh();
    debugPrint("Selected Ball: $ballValue at index: $index");
  }

  List<dynamic> keyboardListGrid = [
    1,2,3,4,5,6,"WD","NB","BYE"
  ];
  List<dynamic> keyboardListList = [
    "UNDO","5,7","OUT","LB"
  ];
}