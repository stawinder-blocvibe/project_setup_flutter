

import 'package:base_project/presentation/modules/home/controllers/my_contest_result_card_controller.dart';

import '../../../../app/export.dart';
import '../../my_matches/controllers/my_match_kuruk_contest_controller.dart';
import '../../my_matches/presentations/my_match_kuruk_contest.dart';

class MyContestResultCard extends GetView<MyContestResultCardController> {
    MyContestResultCard({super.key});

    final controller = Get.put(MyContestResultCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBarWithWallet(),
          Text(
            "My Contest",
            style: TextStyle(
              color: Color(0xFF003921),
              fontSize: 24,
              fontFamily: 'Ancizar Serif',
              fontWeight: FontWeight.w800,
            ),
          ).marginOnly(top: margin_10,left: margin_10),

          Obx(
              ()=> controller.liveMatch.value?.isPredictHarOverMatch==true? cricketCategoryCard
              (
                titleFont:20.0,
                title: "Har over\ncrorepati",
                subTitle: "Call a complete OVER right, 1 Massive prize, 1 CRORE*\n\n",
                onTap: (){

                  // Get.toNamed(AppRoutes.harOverBallSelectionRoute,arguments: {
                  Get.toNamed(AppRoutes.overBallSelectionResultScreenRoute,arguments: {
                    "liveMatch":controller.liveMatch.value,
                  });

                  // Get.toNamed(AppRoutes.overBallSelectionScreenRoute,arguments: {
                  //   "liveMatch":controller.liveMatch.value,
                  // });
                }).marginOnly(top: margin_20):const SizedBox(),
          ),

          Obx(
                ()=> controller.liveMatch.value?.isPredictHarInningMatch==true? cricketCategoryCard

              (
              // scale: ,
                subTitle: "120 balls , your call, Most accurate wins 1 CRORE* (Winner According to LEADERBOARD)",
                onTap: () async {
                  // debugPrint("liveMatch.value===>${controller.liveMatch.value?.toJson()}");
                  // Get.toNamed(AppRoutes.overBallSelectionResultScreenRoute,arguments: {
                  //   "liveMatch":controller.liveMatch.value,
                  // });

                  debugPrint("liveMatch.value===>${controller.liveMatch.value?.matchId}");

                  await Get.toNamed(AppRoutes.myMatchKurukContestRoute,arguments: {
                    'matchId':controller.liveMatch.value?.matchId,
                    'liveMatch':controller.liveMatch.value,
                  });

                  Get.delete<MyMatchKurukContestController>();
                },
                gradient: const LinearGradient(colors: [
                  Color(0xFF875CF2),
                  Color(0xFF381C7D),
                ]),
                titleFont:20.0,
                borderColor: Color(0xFF3A266D),
                title: "Har inning crorepati\n(120 balls)".toUpperCase(),
                margin: EdgeInsets.all(margin_16,).copyWith(top: 0)).marginOnly(top: margin_20):const SizedBox(),
          )
        ],
      )),
    );
  }
}
