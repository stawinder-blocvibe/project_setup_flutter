import 'dart:math';
import 'dart:ui';

import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:base_project/presentation/modules/home/controllers/match_score_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../app/export.dart';
import '../controllers/live_match_list_controller.dart';
import '../controllers/over_ball_selection_controller.dart';
import '../controllers/over_ball_selection_result_controller.dart';
import '../controllers/upcoming_match_list_controller.dart';

class OverBallSelectionResultScreen extends GetView<OverBallSelectionResultController> {
  final controller = Get.put(OverBallSelectionResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFAF1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              appBarWithWallet(onlyWallet: true),
              Stack(
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
                            Obx(()=> scoreSection(teamName: controller.liveMatch.value?.teamAAbbr)),
                            Obx(
                              ()=> NetworkImageWidget(
                                imageUrl:controller.liveMatch.value?.teamALogoUrl?? "",
                                imageHeight: height_40,
                                imageWidth: height_40,
                                placeHolder: punjabPlaceHolderAsset,
                                // radiusAll: 50.r,
                              ),
                            ),
                            vsCircleWidget().marginSymmetric(
                                horizontal: margin_15),
                            Obx(
                              ()=> NetworkImageWidget(
                                imageUrl: controller.liveMatch.value?.teamBLogoUrl??"",
                                imageHeight: height_40,
                                imageWidth: height_40,
                                placeHolder: cskPlaceHolderAsset,
                                // radiusAll: 50.r,
                              ),
                            ),
                            Obx(()=>  scoreSection(teamName: controller.liveMatch.value?.teamBAbbr)),
                          ],
                        ),
                      ],
                    ).marginOnly(top: margin_40),
                  ),
                  Obx(()=> playingTextWidget(teamNamePlaying: controller.liveMatch.value?.teamAName)),
                ],
              ),

              partnershipWidget().marginOnly(top: margin_30),


          
            ],
          ),
        ),
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

 Widget playingTextWidget({teamNamePlaying}) {
    return Center(
      child: Text(
        '$teamNamePlaying Is playing their Innings',
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
      height: Get.height * 0.90,
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          selectOverBlockWidget(),
          selectBallBlockWidget(title:"Ball" ),

       // actualBallOvers.value = indexBasedActualBalls(index: 0);
          //         actualBallOvers.refresh();

       // selectionBall
          Obx(
              ()=> controller.actualBallOvers.isEmpty?
              SizedBox():
              resultBallBlockWidget(title: "Actual ball", ballList:controller.indexBasedActualBalls(index: controller.selectedBallIndex.value??0)
              )
          ),

          // testCOlumn()

        ],
      ).marginOnly(top: 0??margin_230),
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

  Widget bgDefaultOver({data,onTap,isOverSelected}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        decoration: isOverSelected?BoxDecoration(
          border: Border.all(color: greenButtonColor),
          borderRadius: BorderRadius.circular(12.r),
        ):null,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AssetImageWidget(blueBallBgAsset, imageWidth: height_35,
              imageHeight: height_35,),
            Text(
              data ?? "02",
              style: const TextStyle(
                color: Colors.white??Color(0xFF004225),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget bgDefaultBall({data, onTap,isBallSelected}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: margin_3),
        decoration: isBallSelected?BoxDecoration(
          border: Border.all(color: greenButtonColor),
          borderRadius: BorderRadius.circular(12.r),
        ):null,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AssetImageWidget(blueBallBgAsset, imageWidth: height_35,
              imageHeight: height_35,),
            Text(
              data ?? "02",
              style: const TextStyle(
                color: Colors.white??Color(0xFF004225),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
 

  Widget selectedBall({data,onTap,isBallSelected}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        decoration: isBallSelected?BoxDecoration(
          border: Border.all(color: greenButtonColor),
          borderRadius: BorderRadius.circular(12.r),
        ):null,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AssetImageWidget(//greenBgWithBorderAsset
              goldenBallBgAsset??selectedBallAsset, imageWidth: height_35, imageHeight: height_35),
            Text(
              data ?? "02",
              style: const TextStyle(
                color: Colors.black??Color(0xFF004225),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget selectedOver({data,onTap,isOverSelected}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: isOverSelected?BoxDecoration(
          border: Border.all(color: greenButtonColor),
          borderRadius: BorderRadius.circular(12.r),
        ):null,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AssetImageWidget(
              greenBgWithBorderAsset, imageWidth: height_35, imageHeight: height_35,),

            AssetImageWidget(//greenBgWithBorderAsset
              selectedBallAsset, imageWidth: height_35, imageHeight: height_35,).marginAll(margin_8),
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
      ),
    );
  }


// Function to create a dynamic GridView with 7 items per row
  Widget overGridWidget({required List<String> items}) {
    return Obx(
      ()=> GridView.count(
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
          return
          controller.testMyPredictedOverList.contains((index+1))?
              selectedBall(
                onTap: (){
                  controller.updateBallIndex(ballValue:((index+1).toString()),index: index );
                  controller.actualBallOvers.value = controller.indexBasedActualBalls(index: index);
                  controller.actualBallOvers.refresh();
                  controller.myBalls.toList().forEach((ball){

                    debugPrint("myBallsmyBallsmyBalls=>${ball.toJson()}");
                  });
                  },
                  data: (index+1).toString(),
                isBallSelected: controller.selectedBallIndex.value==index
              ):
          bgDefaultOver(

              data: "${index + 1}",
              isOverSelected: controller.selectedBallIndex.value==index,
            onTap: (){
              controller.updateBallIndex(ballValue:((index+1).toString()),index: index );
              controller.actualBallOvers.value = controller.indexBasedActualBalls(index: index);
              controller.actualBallOvers.refresh();
              },
          ) ;

        }),
      ),
    );
  }

  selectOverBlockWidget() {
    return Container(
      // height: height_200,
      width: Get.width,
      padding: EdgeInsets.only(bottom: margin_15),
      // decoration: BoxDecoration(
      //
      //   borderRadius: BorderRadius.circular(18),
      //   border: Border.all(color: appGreen)
      // ),
      margin: EdgeInsets.only(left: margin_20, right: margin_20),


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Row(
            children: [
              headingTextWidget(title: "Over"),

            ],
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              trophyLogoWidget(width: width_150),


              Container(
                  height: Get.height * 0.18,
                  // padding: EdgeInsets.all(margin_10),
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20.r),
                  //     border: Border.all(color:  Color(0xFF14A56E))
                  // ),
                  child: overGridWidget(
                      items: List.generate(20, (index) => "$index"))),
              // trophyLogoWidget()
            ],
          ),

        ],
      ),
    );
  }

  Widget trophyLogoWidget({height, width}) {
    return AssetImageWidget(greenCupTrophy, imageHeight: height ?? height_100,
      imageWidth: width ?? height_100,);
  }

  selectBallBlockWidget({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            headingTextWidget(title: title).marginOnly(left: margin_20),

          ],
        ),
        SizedBox(
          height: height_50,
          width: Get.width,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(left: margin_20, right: margin_20),
            itemCount: 6,
            itemBuilder: (context, index) {

              return  Obx(
                  ()=> bgDefaultBall(
                    isBallSelected: false,
                    data: handleBallData(index: index, overMatch: "${index+1}")
                ).marginOnly(bottom: margin_10),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: height_10,);
            },),
        )
      ],
    );
  }


  Widget resultBallBlockWidget({required String title,required List<String> ballList}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            headingTextWidget(title: title).marginOnly(left: margin_20),
            // headingTextWidget(title: "Apply").marginOnly(left: margin_20,right: margin_20),

          ],
        ),
        SizedBox(
          height: height_50,
          width: Get.width,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(left: margin_20, right: margin_20),
            itemCount: ballList.length,
            itemBuilder: (context, index) {
              var ball = ballList[index];
              return
               selectedBall(
                  data: ball??"",
                  isBallSelected: false).marginOnly(
                bottom: margin_10,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: height_10,);
            },),
        )
      ],
    );
  }







  Widget confirmationBottomSheet(
      {required BuildContext context, Function()? onClose, Function()? onJoin}) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Light greenish background from image
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            // Header row with title and close button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
          Text(
          'Confirmation',
          style: TextStyle(
            color: const Color(0xFF003921),
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
                InkWell(
                  onTap: onClose,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF173D27), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.close, color: Color(0xFF173D27), size: 20),
                  ),
                ),
              ],
            ),

            // SizedBox(height: 8),

            // Subtitle
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 3,
              children: [
                Text(
                  'Amount Unutilised + Winning =',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withValues(alpha: 128),
                    fontSize: font_12,

                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 2,
                  children: [
                    Text(
                      '6,288',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black.withValues(alpha: 128),
                        fontSize: font_13,

                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            // Entry and amount row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Entry',
                  style: TextStyle(
                    color: const Color(0xFF003921),
                    fontSize: font_16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '₹ 19',
                  style: TextStyle(
                    color: const Color(0xFF003921),
                    fontSize: font_16,

                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            // Wallet checkbox row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: true,
                  onChanged: (v) {},
                  activeColor: Color(0xFF173D27),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wallet',
                        style:  TextStyle(
                          color: const Color(0xFF003921),
                          fontSize: font_16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Current balance: ₹ 5000',
                        style:  TextStyle(
                          color: Colors.black.withValues(alpha: 128),
                          fontSize: font_10,

                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '₹ 19',
                  style: TextStyle(
                    color: const Color(0xFF003921),
                    fontSize: font_16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // To Pay row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'To Pay',
                      style: TextStyle(
                        color: const Color(0xFF003921),
                        fontSize: 16,

                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: Color(0xFF7F7F7F),
                    ),
                  ],
                ),
                Text(
                  '₹ 19',
                  style: TextStyle(
                    color: const Color(0xFF003921),
                    fontSize: font_16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Terms text
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: (){
                  showInSnackBar(message: "under-development");
                },
                child: RichText(
                  text: TextSpan(
                    text: 'I Agree With the Standard  ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: font_10,

                      fontWeight: FontWeight.w400,
                    ),
                    children: [

                      TextSpan(
                        text: 'T&Cs',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),

            appButton(buttonText: "JOIN CONTEST",onTap: onJoin)
          ],
        ),
      ),
    );
  }
















  String handleBallData({required int index, required String overMatch}) {

    var MYOver = controller.myBalls.firstWhereOrNull((over)=>over.overNumber.toString()==((controller.selectedBallIndex.value??0)+1).toString());

    if(MYOver==null){
      return overMatch;
    }

    if(index==0){
      return MYOver.firstBall??overMatch;
    }
    if(index==1){
      return MYOver.secondBall??overMatch;
    }
    if(index==2){
      return MYOver.thirdBall??overMatch;
    }
    if(index==3){
      return  MYOver.fourthBall??overMatch;
    }
    if(index==4){
      return MYOver.fifthBall??overMatch;
    }
    if(index==5){
      return MYOver.sixthBall??overMatch;

    }
    return "";

  }

  testCOlumn() {
    return Column(
      children: [

        AssetImageWidget(blueBallBgAsset, imageWidth: height_35,
          imageHeight: height_35,),
        AssetImageWidget(goldenBallBgAsset, imageWidth: height_35,
          imageHeight: height_35,),
      ],
    );
  }
}
