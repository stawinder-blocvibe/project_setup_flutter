import 'package:base_project/presentation/modules/home/models/pool_model.dart';
import 'package:get/get.dart';

import '../../../../app/export.dart';
import '../models/home_api_response.dart';

class LeaderboardWinningResultController extends GetxController with GetSingleTickerProviderStateMixin  {
  // Add your logic and variables here
  var winners = [].obs;
  var isLoading = false.obs;
  late TabController tabController;


  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
   }
  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }


  // Step 2: Prize list (dynamic data)
  final List<PrizeEntry> prizeList = [
    PrizeEntry(rank: "Rank 1", prize: "₹ 5 Lakhs"),
    PrizeEntry(rank: "# 2", prize: "₹ 5 Lakhs"),
    PrizeEntry(rank: "# 3", prize: "₹ 5 Lakhs", sectionHeader: "4 LAKHPATIS"),
    PrizeEntry(rank: "# 3 - 6", prize: "₹ 1 Lakhs"),
    PrizeEntry(rank: "# 7 - 10", prize: "₹ 50,000", sectionHeader: "Rank 7 And Below"),
    PrizeEntry(rank: "# 11 - 12", prize: "₹ 30,000", sectionHeader: "Rank 11 And Below"),
  ];

  RxInt selectedBreakUpIndexTab = 0.obs;


  Rx<LiveMatches?> liveMatch = Rxn();
  Rx<PoolModel?> pool = Rxn();
  handleArgument(){
    var args = Get.arguments;
    if(args!=null && args['liveMatch']!=null){
      liveMatch.value = args['liveMatch'];
      liveMatch.refresh();
      // contestListApiCall(matchId: liveMatch.value?.matchId);
    }

    if(args!=null && args['pool']!=null){
      pool.value = args['pool'];
      pool.refresh();
    }
  }

  @override
  void onReady() {
    handleArgument();
    super.onReady();
  }
}

// Step 1: Data model
class PrizeEntry {
  final String rank;
  final String prize;
  final String? sectionHeader;

  PrizeEntry({required this.rank, required this.prize, this.sectionHeader});
}



