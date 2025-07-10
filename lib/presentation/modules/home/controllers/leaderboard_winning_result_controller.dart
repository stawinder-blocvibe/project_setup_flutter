import 'package:base_project/presentation/modules/home/models/leaderboard_user.dart';
import 'package:base_project/presentation/modules/home/models/pool_model.dart';
import 'package:get/get.dart';

import '../../../../app/export.dart';
import '../models/home_api_response.dart';
import '../models/slot_cell.dart';

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
      debugPrint("match_and_pool_id===>${liveMatch.value?.matchId} ==>${pool.value?.poolId}");

    }

    if(args!=null && args['pool']!=null){
      pool.value = args['pool'];
      pool.refresh();

      debugPrint("pool_model===>${pool.value?.matchId} ==>${pool.value?.poolId}");
      getLeaderBoardApiCall();
    }
  }


  RxList<SlotCell> winingPrizesList = RxList();
  hitWinningResultApiCall(){
    repository.winingPrizesListApi(matchId: liveMatch.value?.matchId??pool.value?.matchId).then((value){
      if(value is List<SlotCell>){
        winingPrizesList.value = value;
        winingPrizesList.refresh();
      }else{
        winingPrizesList.value = [];
        winingPrizesList.refresh();
      }

    });
  }

  RxList<LeaderboardUser> LeaderboardUserList = RxList();
  getLeaderBoardApiCall(){
    repository.getLeaderBoardApi(
        matchId: liveMatch.value?.matchId??pool.value?.matchId,
        poolId:pool.value?.poolId
    ).then((value){

     debugPrint("value===>${value}");

     if (value['isSuccess'] == true &&
         value['data'] != null &&
         (value['data'] as List).isNotEmpty) {

       var list = (value['data'] as List)
           .map((user) => LeaderboardUser.fromJson(user))
           .toList();

       LeaderboardUserList.value = list;
       LeaderboardUserList.refresh();

       debugPrint("value__length===>${LeaderboardUserList.value.length}");
     }
     return;

      if(value is List<SlotCell>){
        winingPrizesList.value = value;
        winingPrizesList.refresh();
      }else{
        winingPrizesList.value = [];
        winingPrizesList.refresh();
      }

    });
  }

  @override
  void onReady() {
    handleArgument();
    hitWinningResultApiCall();

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



