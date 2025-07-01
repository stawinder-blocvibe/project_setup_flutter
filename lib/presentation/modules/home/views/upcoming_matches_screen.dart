
import '../../../../app/export.dart';
import '../controllers/live_match_list_controller.dart';
import '../controllers/upcoming_match_list_controller.dart';
import '../models/home_api_response.dart';

class UpcomingMatchesScreen extends GetView<UpcomingMatchListController> {
  final controller = Get.put(UpcomingMatchListController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        backgroundColor: const Color(0xFFEFFAF1),
        body: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBarWithWallet(onlyWallet:false),
            const Text(
              'Upcoming Matches',
              style: TextStyle(
                color:  Color(0xFF004225),
                fontSize: 22,
                fontFamily: 'TAN - SONGBIRD',
                fontWeight: FontWeight.w400,
              ),
            ).marginOnly(left: margin_20),
            Obx(
                ()=> Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: margin_20),
                    itemCount: controller.upcomingMatchesList.length,
                    shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var upcomingMatch = controller.upcomingMatchesList[index];
                    return upcomingMatchCell(
                        upcomingMatch:upcomingMatch,
                        onTap: (){
                          Get.toNamed(AppRoutes.matchDetailCategoryScreenRoute, arguments: {
                          'liveMatch': LiveMatches(
                          date: upcomingMatch.date,
                          title: upcomingMatch.title,
                          teamALogoUrl: upcomingMatch?.teamALogoUrl,
                          teamBLogoUrl: upcomingMatch?.teamBLogoUrl,
                          type: upcomingMatch?.type,
                          venue: upcomingMatch?.venue,
                          startDatetime: upcomingMatch?.startDatetime,
                          matchId: upcomingMatch?.matchId,
                          teamBName: upcomingMatch?.teamBName,
                          teamBAbbr: upcomingMatch?.teamBAbbr,
                          teamAName: upcomingMatch?.teamAName,
                          teamAAbbr: upcomingMatch?.teamAAbbr,
                          status: upcomingMatch?.status,
                          externalMatchId: upcomingMatch?.externalMatchId,
                          time: upcomingMatch?.time,

                          ),});


return;
                          Get.toNamed(AppRoutes.overBallSelectionScreenRoute);
                        });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }





  Widget topWidget({isT20 = true}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 20,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          decoration:   ShapeDecoration(
            color: isT20?const Color(0xFFDD2727): const Color(0xFFFFD359),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
          ),
          child: Text(
            'T20',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontFamily:fontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Text(
          'TATA IPL,',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF004225),
            fontSize: 14,
            fontFamily: 'Maleah',
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'Qualifier 1',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontSize: 13,
            fontFamily: 'Maleah',
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'Maharaja yadavindra...',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontSize: 13,
            fontFamily: 'Maleah',
            fontWeight: FontWeight.w700,
          ),
        ).marginOnly(right: margin_10),
      ],
    ).marginOnly(top: margin_10);
  }
  centerWidget({isT20 = true}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 25,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NetworkImageWidget(
              imageUrl: "",
              imageHeight: height_40,
              imageWidth: height_40,
              placeHolder: punjabPlaceHolderAsset,
              // radiusAll: 50.r,
            ),
            SizedBox(width: 6),
            Text(
              'PUN',
              style: TextStyle(
                color: const Color(0xFF004225),
                fontSize: 12,
                fontFamily: 'TAN - SONGBIRD',
                fontWeight: FontWeight.w600,
                height: 3,
                letterSpacing: 1.20,
              ),
            ),
          ],
        ),

        isT20?
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Vs',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 20,
                fontFamily: 'Maleah',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ):dayTimingWidget(),

        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'CSK',
              style: TextStyle(
                color: const Color(0xFF004225),
                fontSize: 12,
                fontFamily: 'TAN - SONGBIRD',
                fontWeight: FontWeight.w600,
                height: 3,
                letterSpacing: 1.20,
              ),
            ),
            SizedBox(width: 6),
            NetworkImageWidget(
              imageUrl: "",
              imageHeight: height_40,
              imageWidth: height_40,
              placeHolder: cskPlaceHolderAsset,
              // radiusAll: 50.r,
            ),
          ],
        ),
      ],
    );
  }
  Widget bottomWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
      decoration: BoxDecoration(
        color: appGreen,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Text(
            'PUN -120/3',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFF8FFF8),
              fontSize: 12,
              fontFamily:fontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(width: 1, color: Colors.white, height: height_12),
          SizedBox(width: 10),
          ballList(),
        ],
      ),
    );
  }

  Widget dayTimingWidget(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Tomorrow',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withValues(alpha: 153),
            fontSize: 14,
            fontFamily: 'Maleah',
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          '12:00 PM',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withValues(alpha: 153),
            fontSize: 14,
            fontFamily: 'Maleah',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
  ballList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: controller.ballList
            .map((name) => Container(
          margin: EdgeInsets.only(right: margin_4),
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: ShapeDecoration(
            color: const Color(0x19FFCB00),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.30,
                color: const Color(0xFFD27D08),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontFamily: 'Poltawski Nowy',
              fontWeight: FontWeight.w400,
            ),
          ),
        ))
            .toList(),
      ),
    );
  }



}