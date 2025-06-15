
import 'package:base_project/presentation/modules/home/models/home_api_response.dart';

import '../../../../app/export.dart';
import '../controllers/live_match_list_controller.dart';

class LiveMatchesScreen extends GetView<LiveMatchListController> {
  final controller = Get.put(LiveMatchListController());

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
              'Live Matches',
              style: TextStyle(
                color: const Color(0xFF004225),
                fontSize: 22,
                fontFamily: 'TAN - SONGBIRD',
                fontWeight: FontWeight.w400,
              ),
            ).marginOnly(left: margin_20),
            Obx(
                ()=> Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: margin_20),
                    itemCount: controller.liveMatches.length,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                    var liveMatch = controller.liveMatches[index];
                  return liveMatchCell(liveMatch:liveMatch).marginOnly(bottom: margin_10);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }



  Widget liveMatchCell({required LiveMatches liveMatch}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFEFFAF1),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: greenButtonColor),
      ),
      child: Column(
        spacing: 12,
        children: [

          topWidget(liveMatch:liveMatch),

          centerWidget(liveMatch:liveMatch),

          bottomWidget(liveMatch:liveMatch),
        ],
      ),
    );
  }


  Widget topWidget({required LiveMatches liveMatch,isT20 = true}) {
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
            liveMatch.type??'T20',
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
        SizedBox(
          width: Get.width*0.39,
          child: Text(

            liveMatch.venue??'Maharaja yadavindra...',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 13,
              fontFamily: 'Maleah',
              fontWeight: FontWeight.w700,
            ),
          ).marginOnly(right: margin_10),
        ),
      ],
    ).marginOnly(top: margin_10);
  }

  centerWidget({isT20 = true, required LiveMatches liveMatch}) {
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
              imageUrl: liveMatch.teamALogoUrl??"",
              imageHeight: height_40,
              imageWidth: height_40,
              placeHolder: punjabPlaceHolderAsset,
              // radiusAll: 50.r,
            ),
            SizedBox(width: 6),
            Text(
              liveMatch.teamAAbbr??'PUN',
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
        ):dayTimingWidget(dateTime: liveMatch.startDatetime),

        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              liveMatch.teamBAbbr??'CSK',
              style: const TextStyle(
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
              imageUrl: liveMatch.teamBLogoUrl??"",
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

  Widget bottomWidget({required LiveMatches liveMatch}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
      decoration: BoxDecoration(
        color: appGreen,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        spacing: 10,
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

          ballList(),
        ],
      ),
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