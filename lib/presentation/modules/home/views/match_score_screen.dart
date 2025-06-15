
import 'dart:math';
import 'dart:ui';

import 'package:base_project/presentation/modules/home/controllers/match_score_controller.dart';

import '../../../../app/export.dart';
import '../controllers/live_match_list_controller.dart';
import '../controllers/upcoming_match_list_controller.dart';

class MatchScoreScreen extends GetView<MatchScoreController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFAF1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              appBarWithWallet(onlyWallet:true),
          
          
              Stack(
                children: [
                  Expanded(child: AssetImageWidget(
                      imageFitType: BoxFit.cover,
                      stadiumBullBall,
                      imageHeight: Get.height*0.8,
                      imageWidth: double.infinity
          
                  )),
                  Positioned(
                    bottom: 0,
                     child: Container(
                      height: Get.height*0.645,
                      width: Get.width,
                      color: const Color(0xFFEFFAF1),
                    ),
                  ),
          
          
          
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(1),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Column(
                        children: [
                          matchType(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Obx(()=> scoreSection(teamName: controller.liveMatch.value?.teamAAbbr)),
                              NetworkImageWidget(
                                imageUrl: controller.liveMatch.value?.teamALogoUrl??"",
                                imageHeight: height_40,
                                imageWidth: height_40,
                                placeHolder: punjabPlaceHolderAsset,
                                // radiusAll: 50.r,
                              ),
                              vsCircleWidget().marginSymmetric(horizontal: margin_15),
                              NetworkImageWidget(
                                imageUrl: controller.liveMatch.value?.teamBLogoUrl??"",
                                imageHeight: height_40,
                                imageWidth: height_40,
                                placeHolder: cskPlaceHolderAsset,
                                // radiusAll: 50.r,
                              ),
                              Obx(()=> scoreSection(teamName: controller.liveMatch.value?.teamBAbbr)),
                            ],
                          ),
                        ],
                      ).marginOnly(top: margin_40),
                    ),
                  ),


                  // if(controller.liveMatch.value.externalMatchId)
                  Obx(()=> playingTextWidget(teamName: controller.liveMatch.value?.teamAAbbr)),
                  syncWidget(),
          
                  partnershipWidget(),
          
                ],
              )
          
            ],
          ),
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
  Widget scoreSection({teamName}){
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
                '226 - 8',
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
                  '18.9 ov',
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
    return Container(
      // color: Colors.red,
      height: Get.height*0.90,
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
                parnersDetails(),
                overBallDetails(),
                loremTextWidget(),
              ],
            ),
          ),
          battingStatsCard(),
          ballingStatsCard()
        ],
      ).marginOnly(top: margin_230),
    );
  }

  partnershipCell(){
    return Container(
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
    );
  }

  Widget parnersDetails(){
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
                            'Kl Rahul',
                            style: TextStyle(
                              color: const Color(0xFF003921),
                              fontSize: 12,
                              fontFamily: 'Maleah',
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
                      '12(27)',
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
              profileWithGreenBg(imageAsset:klRahulProfileAsset),

            ],
          ),
          Text(
            '12(27)',
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
              profileWithGreenBg(imageAsset:rjJadegaProfileAsset),
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
                            'R Jadeja',
                            style: TextStyle(
                              color: const Color(0xFF003921),
                              fontSize: 12,
                              fontFamily: 'Maleah',
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
                      '12(27)',
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
          AssetImageWidget(
            imageAsset??rjJadegaProfileAsset,
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



  Widget battingStatsCard() {
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
          const Divider(thickness: 1, height: 25),
          // Row 1: KL Rahul
          Row(
            children: [
              const Text(
                'Kl Rahul',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.circle, size: 8, color: Colors.red),
              const Spacer(),
              const Text('S'),
              const SizedBox(width: 30),
              const Text('5'),
              const SizedBox(width: 30),
              const Text("4’s"),
              const SizedBox(width: 30),
              const Text("6’s"),
            ],
          ),
          const SizedBox(height: 12),
          // Row 2: R Jadeja
          Row(
            children: const [
              Text(
                'R Jadeja',
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Text('S'),
              SizedBox(width: 30),
              Text('5'),
              SizedBox(width: 30),
              Text("4’s"),
              SizedBox(width: 30),
              Text("6’s"),
            ],
          ),
        ],
      ),
    );
  }
  Widget ballingStatsCard() {
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
                'Batsman',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 8),
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
          const Divider(thickness: 1, height: 25),
          // Row 1: KL Rahul
          Row(
            children: [
              const Text(
                'Lasith Malinga',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.circle, size: 8, color: Colors.red),
              const Spacer(),
              const Text('5'),
              const SizedBox(width: 30),
              const Text('B'),
              const SizedBox(width: 30),
              const Text("26"),
              const SizedBox(width: 30),
              const Text("2"),
            ],
          ),

        ],
      ),
    );
  }

}