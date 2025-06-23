  import 'package:base_project/app/export.dart';
import 'package:base_project/presentation/modules/home/models/home_api_response.dart';
 import '../controllers/my_matches_controller.dart';

class MyMatchesScreen extends GetView<MyMatchesController> {
   var controller = Get.put(MyMatchesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appBarWithWallet(onlyWallet: true,onTapBack: (){

          }),
          Expanded(
            child: CustomScrollView(
              slivers: [
                // Padding around the sliver list
            
                SliverPadding(
                  padding:  EdgeInsets.all(margin_20),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        // Header text
                        Padding(
                          padding:  EdgeInsets.only(bottom: margin_10),
                          child: Text(
                            "My Match's",
                            style: TextStyle(
                              color: Color(0xFF003921),
                              fontSize: 24,
                              fontFamily: 'Ancizar Serif',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),


                        // Match list widget
                        myMatchesListWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }

  Widget myMatchesListWidget() {

    return
      Obx(
          ()=>controller.myMatchList.isEmpty?AssetImageWidget(emptyListGifAsset).marginAll(margin_100): ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.myMatchList.length,
          itemBuilder: (context,index){
            var match = controller.myMatchList[index];
            var upcomm = UpcomingMatches().copyWith(
              matchId: match.matchId,
              time: match.time,
              date: match.date,
              type: match.type,
              title: match.title,
              externalMatchId: match.externalMatchId,
              startDatetime: match.startDatetime,
              status: match.status,
              teamAAbbr: match.teamAAbbr,
              teamALogoUrl: match.teamALogoUrl,
              teamAName: match.teamAName,
              teamBAbbr: match.teamBAbbr,
              teamBLogoUrl: match.teamBLogoUrl,
              teamBName: match.teamBName,
              venue: match.venue,
            );

            var liveMatch = LiveMatches().copyWith(
              matchId: match.matchId,
              time: match.time,
              date: match.date,
              type: match.type,
              title: match.title,
              externalMatchId: match.externalMatchId,
              startDatetime: match.startDatetime,
              status: match.status,
              teamAAbbr: match.teamAAbbr,
              teamALogoUrl: match.teamALogoUrl,
              teamAName: match.teamAName,
              teamBAbbr: match.teamBAbbr,
              teamBLogoUrl: match.teamBLogoUrl,
              teamBName: match.teamBName,
              venue: match.venue,
            );
        return upcomingMatchCell(upcomingMatch: upcomm,onTap: (){

          Get.toNamed(AppRoutes.overBallSelectionResultScreenRoute,arguments: {
            "isEdit":true,
            'liveMatch':liveMatch,
            'unComing':upcomm,
          });
          
          return ;
          Get.toNamed(AppRoutes.overBallSelectionResultScreenRoute,arguments: {
            "isEdit":true,
            'liveMatch':liveMatch,
            'unComing':upcomm,
          });
        });
            }),
      );
  }
}
