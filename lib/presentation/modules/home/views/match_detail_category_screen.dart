import 'dart:math';
import 'dart:ui';

import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:base_project/presentation/modules/home/controllers/match_score_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../app/export.dart';
import '../controllers/live_match_list_controller.dart';
import '../controllers/match_detail_category_controller.dart';
import '../controllers/over_ball_selection_controller.dart';
import '../controllers/upcoming_match_list_controller.dart';

class MatchDetailCategoryScreen extends GetView<MatchDetailCategoryController> {
  final controller = Get.put(MatchDetailCategoryController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEFFAF1),
        body: ListView(
          children: [
            appBarWithWallet(onlyWallet:true),
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: Get.height * 0.8,
                  child: AssetImageWidget(
                    imageFitType: BoxFit.cover,
                    stadiumBullBall,
                    imageHeight: Get.height * 0.8,
                    imageWidth: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 0,
                   child: Container(
                    height: Get.height*0.635,
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
                              imageUrl: "",
                              imageHeight: height_40,
                              imageWidth: height_40,
                              placeHolder: punjabPlaceHolderAsset,
                              // radiusAll: 50.r,
                            ),
                            vsCircleWidget().marginSymmetric(horizontal: margin_15),
                            NetworkImageWidget(
                              imageUrl: "",
                              imageHeight: height_40,
                              imageWidth: height_40,
                              placeHolder: cskPlaceHolderAsset,
                              // radiusAll: 50.r,
                            ),
                            Obx(()=>  scoreSection(teamName: controller.liveMatch.value?.teamBAbbr)),
                          ],
                        ),
                      ],
                    ).marginOnly(top: margin_40),
                  ),
                ),
      
                playingTextWidget(),
      
                syncWidget(),
      
      
                partnershipWidget(),
      
              ],
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
          )
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

  playingTextWidget(){
    return Column(
      children: [
        Center(
          child: Text(
            'CSK Is playing their Innings',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        viewFullScoreBoard()
      ],
    ).marginOnly(top: margin_140);
  }

  Widget syncWidget(){
    return Positioned(
      right: 0,
        child: AssetImageWidget(syncIconAsset,imageWidth: height_40,imageHeight: height_40,).marginOnly(top: margin_190,right: margin_20));
  }

  Widget partnershipWidget(){
    return SizedBox(
      height: Get.height*0.90,
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          cricketCategoryCard(onTap: (){
            Get.toNamed(AppRoutes.overBallSelectionScreenRoute,arguments: {
              "liveMatch":controller.liveMatch.value,
            });
          }),
          cricketCategoryCard(
            onTap: (){
              Get.toNamed(AppRoutes.contestListScreenRoute,arguments: {
                "liveMatch":controller.liveMatch.value,
              });
            },
              gradient: const LinearGradient(colors: [
                Color(0xFF875CF2),
                Color(0xFF381C7D),
              ]),
              borderColor: Color(0xFF3A266D),
              title: "Kurukshetra\n(120 balls)",margin: EdgeInsets.all(margin_16,).copyWith(top: 0))
        ],
      ).marginOnly(top: margin_230),
    );
  }
 


  Widget viewFullScoreBoard() {
    return Stack(
      alignment: Alignment.center,
      children: [
       AssetImageWidget(viewFullScoreBoardBgAsset,imageWidth: height_150,),
        const Text(
          'View Full Scorecard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Segoe UI',
          ),
        ),
      ],
    );
  }














}

