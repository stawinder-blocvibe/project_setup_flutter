
import 'dart:math';
import 'dart:ui';

import 'package:base_project/presentation/modules/home/controllers/match_score_controller.dart';

import '../../../../app/export.dart';
import '../controllers/live_match_list_controller.dart';
import '../controllers/upcoming_match_list_controller.dart';

class MatchScoreScreen extends GetView<MatchScoreController> {

//liveScore
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFAF1),
      body: SafeArea(
        child: Column(
          children: [
            appBarWithWallet(onlyWallet:true),



            Obx(
                ()=> Stack(
                children: [
                  const AssetImageWidget(matchGroundAsset),
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          color: Colors.transparent, // Required for BackdropFilter to work
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.matchScoreScreenRoute,arguments: {
                        "liveMatch":controller.liveMatch.value,
                      }
                      );
                    },
                    child: Column(
                      children: [
                        matchType(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Obx(()=> scoreSection(
                                teamName: controller.liveMatch.value?.teamAAbbr,
                            over: "${controller.liveScore.value?.teamaScore?.overs}",
                              score: controller.liveScore.value?.teamaScore?.completeScore,
                            )),
                            NetworkImageWidget(
                              imageUrl: controller.liveMatch.value?.teamALogoUrl??"",
                              imageHeight: height_40,
                              imageWidth: height_40,
                              placeHolder: punjabPlaceHolderAsset,
                              // radiusAll: 50.r,
                            ),
                            vsCircleWidget().marginSymmetric(
                                horizontal: margin_15),
                            NetworkImageWidget(
                              imageUrl: controller.liveMatch.value?.teamBLogoUrl??"",
                              imageHeight: height_40,
                              imageWidth: height_40,
                              placeHolder: cskPlaceHolderAsset,
                              // radiusAll: 50.r,
                            ),
                            Obx(()=>  scoreSection(teamName: controller.liveMatch.value?.teamBAbbr,
                              over: "${controller.liveScore.value?.teambScore?.overs}",
                              score: controller.liveScore.value?.teambScore?.completeScore,)),
                          ],
                        ),
                      ],
                    ).marginOnly(top: margin_40),
                  ),
                  playingTextWidget(teamName: controller.liveMatch.value?.teamAName),
                ],
              ),
            ),


                // partnershipWidget(),

            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: margin_20),
                children: [
                  Container(
                    // height: height_200,
                    width: Get.width,
                    padding: EdgeInsets.only(bottom: margin_20),
                    decoration: BoxDecoration(
              
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: appGreen)
                    ),
                    margin: EdgeInsets.only(left: margin_20,right: margin_20),
              
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 20,
                      children: [
                        partnershipCell(),
              
                        Obx(
                              ()=> parnersDetails(
                            centerScore: controller.liveScore.value?.teamaScore?.completeScore,
                            firstPlayerName: controller.liveScore.value?.batsman?.first.name,
                            firstPlayerScore: "${controller.liveScore.value?.batsman?.first.runs}(${controller.liveScore.value?.batsman?.first.balls})",
                            secondPlayerName: controller.liveScore.value?.batsman?.last.name,
                            secondPlayerScore:"${controller.liveScore.value?.batsman?.last.runs}(${controller.liveScore.value?.batsman?.last.balls})",
                          ),
                        ),
                        overBallDetails(),
                        if(false)
                        loremTextWidget(),
                      ],
                    ),
                  ),
                  Obx(
                        ()=> battingStatsCard(
                      firstPlayerName: controller.liveScore.value?.batsman?.first.name,
                      first_b: controller.liveScore.value?.batsman?.first.balls.toString(),
                      firstPlayerChaukaCount: controller.liveScore.value?.batsman?.first.fours.toString(),
                      firstPlayerShakkaCount: controller.liveScore.value?.batsman?.first.sixes.toString(),
                      secondPlayerName: controller.liveScore.value?.batsman?.last.name,
                      second_b: controller.liveScore.value?.batsman?.last.balls.toString(),
                      secondPlayerChaukaCount: controller.liveScore.value?.batsman?.last.fours.toString(),
                      secondPlayerShakkaCount: controller.liveScore.value?.batsman?.last.sixes.toString(),
              
                    ),
                  ),
                  Obx(
                        ()=> ballingStatsCard(
                      ballerName: controller.liveScore.value?.bowler?.name.toString(),
                      // missedCount: controller.liveScore.value?.bowler?.,
                      overCount: controller.liveScore.value?.bowler?.overs.toString(),
                      runsCount: controller.liveScore.value?.bowler?.runs.toString(),
                      wideCount: controller.liveScore.value?.bowler?.wickets.toString(),
                    ),
                  )
                ],
              ),
            )


          ],
        ),
      ),
    );
  }


  Widget matchType({title}){
    return Center(
      child: Text(
        title??'TATA IPL, 2025',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
           fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
  Widget scoreSection({teamName,score='0' ,over='0.0'}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        SizedBox(
          width: 47,
          child: Text(
            teamName??'PUN',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          width: 47,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              Text(
                '$score',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 47,
                child: Text(
                  '$over ov',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget vsCircleWidget(){
    return Container(
      width: 45,
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        color: Colors.grey,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),

        ),
      ),
      child:  Text(
        'Vs',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget playingTextWidget({teamName}){
    return Center(
      child: Text(
        '$teamName Is playing their Innings',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      ),
    ).marginOnly(top: margin_160);
  }

  Widget syncWidget(){
    return Positioned(
      right: 0,
        child: AssetImageWidget(syncIconAsset,imageWidth: height_40,imageHeight: height_40,).marginOnly(top: margin_180,right: margin_20));
  }

  Widget partnershipWidget(){
    return Expanded(
      // color: Colors.red,

      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          Container(
            // height: height_200,
            width: Get.width,
          padding: EdgeInsets.only(bottom: margin_20),
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: appGreen)
            ),
            margin: EdgeInsets.only(left: margin_20,right: margin_20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                partnershipCell(),

                Obx(
                    ()=> parnersDetails(
                    centerScore: controller.liveScore.value?.teamaScore?.completeScore,
                     firstPlayerName: controller.liveScore.value?.batsman?.first.name,
                    firstPlayerScore: "${controller.liveScore.value?.batsman?.first.runs}(${controller.liveScore.value?.batsman?.first.balls})",
                     secondPlayerName: controller.liveScore.value?.batsman?.last.name,
                    secondPlayerScore:"${controller.liveScore.value?.batsman?.last.runs}(${controller.liveScore.value?.batsman?.last.balls})",
                  ),
                ),
                overBallDetails(),
                loremTextWidget(),
              ],
            ),
          ),
          Obx(
            ()=> battingStatsCard(
              firstPlayerName: controller.liveScore.value?.batsman?.first.name,
              first_b: controller.liveScore.value?.batsman?.first.balls.toString(),
              firstPlayerChaukaCount: controller.liveScore.value?.batsman?.first.fours.toString(),
              firstPlayerShakkaCount: controller.liveScore.value?.batsman?.first.sixes.toString(),
              secondPlayerName: controller.liveScore.value?.batsman?.last.name,
              second_b: controller.liveScore.value?.batsman?.last.balls.toString(),
              secondPlayerChaukaCount: controller.liveScore.value?.batsman?.last.fours.toString(),
              secondPlayerShakkaCount: controller.liveScore.value?.batsman?.last.sixes.toString(),

            ),
          ),
          Obx(
              ()=> ballingStatsCard(
              ballerName: controller.liveScore.value?.bowler?.name.toString(),
              // missedCount: controller.liveScore.value?.bowler?.,
              overCount: controller.liveScore.value?.bowler?.overs.toString(),
              runsCount: controller.liveScore.value?.bowler?.runs.toString(),
              wideCount: controller.liveScore.value?.bowler?.wickets.toString(),
            ),
          )
        ],
      ).marginOnly(top: margin_20),
    );
  }

  partnershipCell(){
    return GestureDetector(
      onTap: (){
        debugPrint("Partnership Cell Clicked");
        // repository.testApi();
      },
      child: Container(
        height: height_25,
        width: width_100,

        alignment: Alignment.center,

        margin: const EdgeInsets.only(top: 20),
        decoration: ShapeDecoration(
          color: const Color(0xFFDD2727),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
        ),
        child:  Text(
          'Partnership',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,

            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget parnersDetails({ firstPlayerName, secondPlayerName,firstPlayerScore, secondPlayerScore,centerScore,firstPlayerImage, secondPlayerImage}) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 5,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 6,
            children: [
              Container(
                width: 50,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 1,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 1,
                        children: [
                          Text(
                            firstPlayerName??'Kl Rahul',
                            style: TextStyle(
                              color: const Color(0xFF003921),
                              fontSize: 10,
                               fontWeight: FontWeight.w700,
                            ),
                          ),
                         ],
                      ),
                    ),
                    Container(
                      width: 39,
                      height: 1,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.99, 0.50),
                          end: Alignment(-0.00, 0.50),
                          colors: [const Color(0xFFD27D08), const Color(0xD8FFCB3C)],
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    Text(
                      firstPlayerScore??'12(27)',
                      style: TextStyle(
                        color: const Color(0xFF003921),
                        fontSize: 14,
                        fontFamily: 'Maleah',
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                  ],
                ),
              ),
              profileWithGreenBg(imageAsset:firstPlayerImage??klRahulProfileAsset),

            ],
          ),
          Text(
            centerScore??'12(27)',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF003921),
              fontSize: 18,
              fontFamily: 'Maleah',
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 6,
            children: [
              profileWithGreenBg(imageAsset:secondPlayerImage??rjJadegaProfileAsset),
              Container(
                width: 50,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 1,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 1,
                        children: [
                          Text(
                            secondPlayerName??'R Jadeja',
                            style: TextStyle(
                              color: const Color(0xFF003921),
                              fontSize: 10,
                               fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            width: 39,
                            height: 1,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.99, 0.50),
                                end: Alignment(-0.00, 0.50),
                                colors: [const Color(0xFFD27D08), const Color(0xD8FFCB3C)],
                              ),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      secondPlayerScore??'12(27)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF003921),
                        fontSize: 14,
                        fontFamily: 'Maleah',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  profileWithGreenBg({required String imageAsset}) {
    return SizedBox(
      height: height_40,
      width: height_40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AssetImageWidget(
            playerBgCircleAsset,
            imageHeight: height_40,
            imageWidth: height_40,
          ),
          NetworkImageWidget(
            imageUrl: imageAsset,
            placeHolder: imageAsset,
            imageHeight: height_30,
            imageWidth: height_30,
            imageFitType: BoxFit.cover,
            radiusAll: 50,
          ),

        ],
      ),
    );
  }

  Widget overBallDetails(){
    return Container(
      child: Column(
        spacing: 10,
        children: [
          AssetImageWidget(dividerScoreBoardAsset,imageHeight: height_1,imageWidth: Get.width,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controller.ballList.map((e)=> ballCell(e:e)).toList(),
          ),
          AssetImageWidget(dividerScoreBoardAsset,imageHeight: height_1,imageWidth: Get.width,),
        ],
      ),
    );
  }
  final random = Random();
  Widget ballCell({e}) {
    // Generate a random color
    Color randomColor = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      margin: const EdgeInsets.only(right:4),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: randomColor.withOpacity(0.8)??const Color(0xFF62B563),
        shape: RoundedRectangleBorder(
          side:   BorderSide(
            width: 0.30,
            color: randomColor??const Color(0xFF3C793C),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(
        '$e',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  loremTextWidget() {
    return Text(
      'Lorem ipsum is a dummy or placeholder text commonly used. ',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: const Color(0xFF003921),
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
    ).marginSymmetric(horizontal: margin_40);
  }



  Widget battingStatsCard({
    firstPlayerName,
    secondPlayerName,
    first_b,
    firstPlayerChaukaCount,
    firstPlayerShakkaCount,
    second_b,
    secondPlayerChaukaCount,
    secondPlayerShakkaCount
  }) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5FFF7),
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(

            children: [
              const Text(
                'Batsman',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 8),
              if(false)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Batting Stats',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              const Text('S', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 30),
              const Text('B', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 30),
              const Text("4’s", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 30),
              const Text("6’s", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(thickness: 1, height: 25,color:Colors.grey),
          // Row 1: KL Rahul
          Row(
            children: [
                Text(
                firstPlayerName??'Kl Rahul',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.circle, size: 8, color: Colors.red),
              const Spacer(),
              const Text('S'),
              const SizedBox(width: 30),
                Text(first_b??'5'),
              const SizedBox(width: 30),
                Text(firstPlayerShakkaCount??"4’s"),
              const SizedBox(width: 30),
                Text(firstPlayerShakkaCount??"6’s"),
              SizedBox(
                width: 12,
              )
            ],
          ),
          const SizedBox(height: 12),
          // Row 2: R Jadeja
          Row(
            children:  [
              Text(
                secondPlayerName??'R Jadeja',
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Text('S'),
              SizedBox(width: 30),
              Text(second_b??'5'),
              SizedBox(width: 30),
              Text(secondPlayerChaukaCount??"4’s"),
              SizedBox(width: 30),
              Text(secondPlayerShakkaCount??"6’s"),
              SizedBox(
                width: 12,
              )
            ],
          ),
        ],
      ),
    );
  }
  Widget ballingStatsCard({
    ballerName ,
    overCount ,
    missedCount,
    runsCount ,
    wideCount
}) {
    return Container(
      margin: const EdgeInsets.all(20).copyWith(top: 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5FFF7),
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            children: [
              const Text(
                'Baller ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 8),
              if(false)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Balling Stats',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              const Text('O', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 30),
              const Text('M', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 30),
              const Text("R", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 30),
              const Text("W", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(thickness: 1, height: 25,color:Colors.grey),
          // Row 1: KL Rahul
          Row(
            children: [
               Text(
                 ballerName??'Lasith Malinga',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.circle, size: 8, color: Colors.red),
              const Spacer(),
                Text(overCount??'5'),
              const SizedBox(width: 30),
              const Text('B'),
              const SizedBox(width: 30),
                Text(runsCount??"26"),
              const SizedBox(width: 30),
                Text(wideCount??"2"),
            ],
          ),

        ],
      ),
    );
  }

}