import 'dart:math';
import 'dart:ui';

import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:base_project/presentation/modules/home/controllers/match_score_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../app/export.dart';
import '../controllers/contest_list_screen_controller.dart';
import '../controllers/live_match_list_controller.dart';
import '../controllers/over_ball_selection_controller.dart';
import '../controllers/upcoming_match_list_controller.dart';

class ContestListScreen extends GetView<ContestListScreenController> {
  final controller = Get.put(ContestListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFAF1),
      body: Column(
        children: [
          appBarWithWallet(onlyWallet: true),


          Stack(
            children: [
              AssetImageWidget(
                imageFitType: BoxFit.cover,
                stadiumBullBall,
                imageHeight: Get.height * 0.8,
                imageWidth: double.infinity
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: Get.height * 0.645,
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
                          scoreSection(),
                          NetworkImageWidget(
                            imageUrl: "",
                            imageHeight: height_40,
                            imageWidth: height_40,
                            placeHolder: punjabPlaceHolderAsset,
                            // radiusAll: 50.r,
                          ),
                          vsCircleWidget().marginSymmetric(
                              horizontal: margin_15),
                          NetworkImageWidget(
                            imageUrl: "",
                            imageHeight: height_40,
                            imageWidth: height_40,
                            placeHolder: cskPlaceHolderAsset,
                            // radiusAll: 50.r,
                          ),
                          scoreSection(teamName: "CSK"),
                        ],
                      ),
                    ],
                  ).marginOnly(top: margin_40),
                ),
              ),

              playingTextWidget(),
              Positioned(
                right: 0,
                child: syncWidget(),
              ),
              partnershipWidget(),

            ],
          )

        ],
      ),
    );
  }


  Widget matchType({title}) {
    return Center(
      child: Text(
        title ?? 'TATA IPL, 2025',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget scoreSection({teamName}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        SizedBox(
          width: 47,
          child: Text(
            teamName ?? 'PUN',
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

  Widget vsCircleWidget() {
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
      child: Text(
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

  playingTextWidget() {
    return Center(
      child: Text(
        'CSK Is playing their Innings',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      ),
    ).marginOnly(top: margin_160);
  }

  Widget syncWidget() {
    return GestureDetector(
      onTap: (){
       /* showDialog(
          context: Get.context!,
          barrierDismissible: true,
          builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            child: transactionSuccessTicketDialog((){
              Get.back();
            }),
          ),
        );*/
      },
      child: AssetImageWidget(
        syncIconAsset, imageWidth: height_40, imageHeight: height_40,)
          .marginOnly(top: margin_180, right: margin_20),
    );
  }

  Widget partnershipWidget() {
    return Container(
      // color: Colors.red,
      margin: EdgeInsets.symmetric(horizontal: margin_20),
      height: Get.height * 0.90,
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          contestTextWidget(),
          Column(
            children: List.generate(10, (e)=>contestCellWidget().marginOnly(bottom: margin_10)),
          )
        ],
      ).marginOnly(top: margin_230),
    );
  }


  Widget headingTextWidget({title}) {
    return Text(
      title ?? 'Select Ball',
      style: const TextStyle(
        color: Color(0xFF003921),
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.66,
      ),
    );
  }

  Widget bgDefaultOver({data}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AssetImageWidget(overOverDefaultBgAsset, imageWidth: height_35,
          imageHeight: height_35,),
        Text(
          data ?? "02",
          style: const TextStyle(
            color: Color(0xFF004225),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }


  Widget bgDefaultBall({data, onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AssetImageWidget(ballSelectionDefaultAsset, imageWidth: height_35,
            imageHeight: height_35,),
          Text(
            data ?? "02",
            style: const TextStyle(
              color: Color(0xFF004225),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  Widget selectedBall({data}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AssetImageWidget(
          selectedBallAsset, imageWidth: height_35, imageHeight: height_35,),
        Text(
          data ?? "02",
          style: const TextStyle(
            color: Color(0xFF004225),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }


// Function to create a dynamic GridView with 7 items per row
  Widget overGridWidget({required List<String> items}) {
    return GridView.count(
      padding: EdgeInsets.zero,
      crossAxisCount: 7,
      // 7 items per row
      shrinkWrap: true,
      // Makes height dynamic
      physics: const NeverScrollableScrollPhysics(),
      // Disables scrolling
      crossAxisSpacing: 8,
      // Space between columns
      mainAxisSpacing: 8,
      // Space between rows
      children: List.generate(items.length, (index) {
        return bgDefaultOver(data: "${index + 1}") ?? Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.green[700],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            items[index],
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        );
      }),
    );
  }

  contestTextWidget() {
    return Text(
      'Contest',
      style: TextStyle(
        color: const Color(0xFF003921),
        fontSize: 24,
        fontFamily: 'Ancizar Serif',
        fontWeight: FontWeight.w800,
      ),
    );
  }


















}
