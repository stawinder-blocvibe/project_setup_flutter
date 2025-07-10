import 'dart:math';
import 'dart:ui';

import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:base_project/presentation/modules/home/controllers/match_score_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../app/export.dart';
import '../bottom_sheet/ball_selection_bottom_sheet.dart';
import '../controllers/live_match_list_controller.dart';
import '../controllers/over_ball_selection_controller.dart';
import '../controllers/upcoming_match_list_controller.dart';

class OverBallSelectionScreen extends GetView<OverBallSelectionController> {
  final controller = Get.put(OverBallSelectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false, // Prevents screen from resizing and scrolling when keyboard appears
      backgroundColor: const Color(0xFFEFFAF1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
              ()=> appBarWithWallet(onlyWallet: true,
                    gradient:
                    controller.isHarOver.value?
                    gradientHarOver:gradientKuruk),//controller.isHarOver.value
              ),
          
              // partnershipWidget()
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoutes.matchScoreScreenRoute,arguments: {
                    "liveMatch":controller.liveMatch.value,
                  }
                  );
                },
                child: Stack(

                  children: [
          
          

                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      left: 0,
                        child: ImageFiltered(imageFilter: ImageFilter.blur(sigmaX: 4,sigmaY:  4),child:   AssetImageWidget(matchGroundAsset,imageWidth: Get.width,imageFitType: BoxFit.cover,imageHeight: height_100,),)),
                     // AssetImageWidget(matchGroundAsset,imageWidth: Get.width,imageFitType: BoxFit.cover,imageHeight: height_100,),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.matchScoreScreenRoute,arguments: {
                          "liveMatch":controller.liveMatch.value,
                        }
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
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
                            vsCircleWidget().marginSymmetric(
                                horizontal: margin_15),
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
                      ],)
                    ).marginOnly(top: margin_35),
          
                    Obx(()=>
                    playingTextWidget(teamName:controller.liveMatch.value?.teamAAbbr)),
                  ],
                ),
              ),
              partnershipWidget()
          
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

  playingTextWidget({teamName}) {
    return Center(
      child: Text(
        '${teamName??"CSK"} Is playing their Innings',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      ),
    ).marginOnly(top: margin_130,bottom: margin_20);
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
      // height: Get.height * 0.89,
      child: Column(
        // padding: EdgeInsets.zero,
        // shrinkWrap: true,
        children: [
          selectOverBlockWidget(),
          selectBallBlockWidget(title:"Select Ball" ),

          // Spacer(),

          if(false)
          SizedBox(
            height: 30,
            child: Text("${MediaQuery.of(Get.context!).size.height}- ${MediaQuery.of(Get.context!).size.aspectRatio}"),),
          buildCustomButtonGrid(),


        ],
      ).marginOnly(top: margin_20),
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
        ),
      ),
    );
  }


  Widget bgDefaultBall({data, onTap,isBallSelected,  required int index}) {
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
            AssetImageWidget(handleSelectBallBg(index: index)??ballSelectionDefaultAsset, imageWidth: height_35,
              imageHeight: height_35,),

            Text(
              "-"??data ?? "02",
              style:  TextStyle(
                color: handleTextColor(index:index),
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
        padding: EdgeInsets.symmetric(horizontal: margin_4),
        margin: EdgeInsets.symmetric(vertical: margin_2),
        decoration: isBallSelected?BoxDecoration(
          border: Border.all(color: greenButtonColor),
          borderRadius: BorderRadius.circular(12.r),
        ):null,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AssetImageWidget(//greenBgWithBorderAsset
              selectedBallAsset, imageWidth: height_30, imageHeight: height_30,),
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
        return controller.isOverHaveBall(overIndex: index)?
        selectedOver(data: "${index + 1}",  isOverSelected: controller.selectedOverIndex.value==index,
            onTap: (){
              controller.updateOverIndex(index: index, overValue: "${index + 1}");
            }):
        bgDefaultOver(

            data: "${index + 1}",
            isOverSelected: controller.selectedOverIndex.value==index,
            onTap: (){
              controller.updateOverIndex(index: index, overValue: "${index + 1}");
            }
        )  ;
      }),
    );
  }

  selectOverBlockWidget() {
    return Container(
      // height: height_200,
      width: Get.width,
      padding: EdgeInsets.only(bottom: margin_0),
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
              headingTextWidget(title: ("Select Over"),),
              Spacer(),


              controller.isHarOver.value?
              Row(
                spacing: margin_5,
                children: [inningCellKuruk(teamPlay:controller.liveMatch.value?.teamAAbbr,inning: 1),

                  if(false)
                  inningCellKuruk(teamPlay: controller.liveMatch.value?.teamBAbbr,inning: 2)],)
              :
    inningCellKuruk(teamPlay:controller.liveMatch.value?.teamAAbbr,inning: 1)??
              innigWidget().marginOnly(left: margin_5),

              if(false)
              Obx(
                  ()=> Switch(
                      inactiveTrackColor: Colors.grey,
                      value: controller.inningSwitch.value, onChanged: (value){
                  // controller.inningSwitch.value =  !controller.inningSwitch.value;
                  // controller.inningSwitch.refresh();
                }),
              ),


            ],
          ),
          Obx(()=>
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  trophyLogoWidget(width: width_150),
                  Container(
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(18),
                    //   border: Border.all(color: appGreen)
                    // ),
                    // padding: EdgeInsets.all(),
                      height: Get.height * 0.18,
                      child: overGridWidget(
                          items: List.generate(20, (index) => "$index"))),
                  // trophyLogoWidget()
                ],
              ),
          )


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
            // headingTextWidget(title: "Apply").marginOnly(left: margin_20,right: margin_20),
            if(false)
            addMoreOver(onTap: (){
              showBallSelectionBottomSheet(title:"Wide Ball",subTitle: "WD",subTitleOld: " (WD=1)",onInput: (value){
                debugPrint('Tapped: Wide Ball ==>${value}');
                controller.handleRightSideButtonTap(data: value );
    } );


            })
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
              return Obx(() =>
              controller.isBallHaveValue(overIndex: controller.selectedOverIndex.value,ballIndex: index)
                  ? selectedBall(
                  onTap: () {
                    controller.updateBallIndex(
                        index: index, ballValue: "${index + 1}");
                  },
                  data: "${controller.getBallValue(ballIndex: index,overIndex: controller.selectedOverIndex.value??0)}",
                  isBallSelected: controller.selectedBallIndex.value == index).marginOnly(
                  bottom: margin_10,

              )
                  : bgDefaultBall(
                  index:index,
                isBallSelected: controller.selectedBallIndex.value == index,
                  data: "${index + 1}", onTap: () {
                controller.updateBallIndex(
                    index: index, ballValue: "${index + 1}");
                  }
              ).marginOnly(bottom: margin_10));
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



  Widget buildCustomButtonGrid() {
    final List<Map<String, String>> gridButtons = [
      {'main': '0', 'sub': ''},
      {'main': '1', 'sub': ''},
      {'main': '2', 'sub': ''},
      {'main': '3', 'sub': ''},
      {'main': '4', 'sub': 'FOUR'},
      {'main': '6', 'sub': 'SIX'},
      /*{'main': 'WD', 'sub': ''},
      {'main': 'NB', 'sub': ''},
      {'main': 'BYE', 'sub': ''},*/
    ];

    final List<String> rightButtons = [ '5,7',"Out" ];//7', 'Out', 'LB'

    return Column(
      children: [
        Container(
            height: height_100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Left side: grid
                Expanded(
                  flex: 4,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: gridButtons.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.35,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                    ),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = gridButtons[index];
                      return InkWell(
                        onTap: () async {

                          debugPrint('Tapped:111 ${item['main']}');

                          // return;

                          var value= await controller.setOverBallValue(
                              overIndex: controller.selectedOverIndex.value ?? 0,
                              ballIndex: controller.selectedBallIndex.value ?? 0,
                              value: item['main']!);


                          debugPrint("value==>${value}");
                          if(value ==false ){
                            return ;
                          }

                          var isAllBallSelected = controller.isAllOverBallSelected(overIndex: controller.selectedOverIndex.value??0);

                          if(isAllBallSelected) {

                            walletBalance.value>(controller.isHarOver.value?19:controller.pool.value?.joiningPrice)?
                            handleBottomSheet()
                                :
                            showAddMoneyBottomSheet();
                          }
                          controller.jumpNextBall();

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  item['main']!,
                                  style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                                ),
                                if (item['sub']!.isNotEmpty)
                                  Text(
                                    item['sub']!,
                                    style: TextStyle(fontSize: 10, color: Colors.grey[400]),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Right side: vertical list of buttons
                Expanded(
                  flex: 2,
                  child: Column(
                    children: rightButtons.map((text) {
                      return Expanded(
                        child: InkWell(
                          onTap: () {
                            debugPrint("Tapped: $text");

                            if(text=="Out"){
                              showBallSelectionBottomSheet(title:"Wicket",subTitle: "WKT",subTitleOld: "", onInput: (value) {
                                debugPrint('Tapped: Wicket ==>${value}');
                                controller.handleRightSideButtonTap(data: value);
                              });
                             }else{
                              controller.handleRightSideButtonTap(data: text);
                            }



                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              color: Colors.grey.shade100,
                            ),
                            child: Center(
                              child: Text(
                                text,
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        Obx(
        ()=>(!controller.isHarOver.value)?SizedBox(): SizedBox(
            height: height_45,
            child: Row(
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap:()async {

                      showBallSelectionBottomSheet(title:"WD Ball",subTitle: "WD",subTitleOld: " (WD=1)", onInput: (value) {

                        debugPrint('Tapped: WD ==>${value}');
                        controller.handleRightSideButtonTap(data: value );
                      });
                      return;
                      await onTapHarOverKeyboard(value: "WD");},
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        color: Colors.grey.shade100,
                      ),
                      child: Text(
                        'WD',
                        style: TextStyle(
                          color: const Color(0xFF6F6F6F),
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: GestureDetector(
                    onTap:()async {
                      showBallSelectionBottomSheet(title:"NO Ball",subTitle: "NB",subTitleOld: " (NB=1)", onInput: (value) {
                        debugPrint('Tapped: No ball ==>${value}');
                        controller.handleRightSideButtonTap(data: value );
                      });
                      return;
                      await onTapHarOverKeyboard(value: "NB");},
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        color: Colors.grey.shade100,
                      ),
                      child: Text(
                        'NB',
                        style: TextStyle(
                          color: const Color(0xFF6F6F6F),
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ),
        )
      ],

    ).marginOnly(bottom: margin_30);
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
            if(false)
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
                  '₹ ${controller.isHarOver.value?19:controller.pool.value?.joiningPrice}',
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
                      Obx(
                        ()=> Text(
                          'Current balance: ₹ ${walletBalance.value}',
                          style:  TextStyle(
                            color: Colors.black.withValues(alpha: 128),
                            fontSize: font_10,

                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '₹ ${controller.isHarOver.value?19:controller.pool.value?.joiningPrice}',
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
                    if(false)
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: Color(0xFF7F7F7F),
                    ),
                  ],
                ),
                Text(
                  '₹ ${controller.isHarOver.value?19:controller.pool.value?.joiningPrice}',
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
                  Get.toNamed(AppRoutes.termAndConditionRoute);
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

            // appButton(buttonText: "Predict more".toUpperCase(),onTap: (){ Get.back();}),
            // SizedBox(height: 10),
            appButton(buttonText: "JOIN CONTEST",onTap: onJoin)
          ],
        ),
      ),
    );
  }

  void handleBottomSheet() {

    if(controller.pool.value?.isPoolPaymentCompleted==true){
      askToPredictMore(
          onPredictMore: (){

        },
          onSubmit: (){

            controller.hitJoinContest(
                onSuccess: (){
                  // walletBalance.value = walletBalance.value -(controller.isHarOver.value?19:controller.pool.value?.joiningPrice);
                  // walletBalance.refresh();
                  controller.pool.value = controller.pool.value?.copyWith(
                      isPoolPaymentCompleted: true
                  );
                  // showDialog(
                  //   context: Get.context!,
                  //   barrierDismissible: true,
                  //   builder: (context) => Dialog(
                  //     backgroundColor: Colors.transparent,
                  //     child: transactionSuccessTicketDialog((){
                  //       Get.back();
                  //       // Get.offAndToNamed(AppRoutes.mainParentRoute);
                  //     }),
                  //   ),
                  // );
                }
            );
          }
      );
      return;
    }
    var context = Get.context!;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) =>  confirmationBottomSheet(
          context: context,onClose: (){
        Get.back();
      },
          onJoin: (){
            Get.back();
            controller.hitJoinContest(
              onSuccess: (){
                walletBalance.value = walletBalance.value -(controller.isHarOver.value?19:controller.pool.value?.joiningPrice);
                walletBalance.refresh();
                controller.pool.value = controller.pool.value?.copyWith(
                  isPoolPaymentCompleted: true
                );
                showDialog(
                  context: Get.context!,
                  barrierDismissible: true,
                  builder: (context) => Dialog(
                    backgroundColor: Colors.transparent,
                    child: transactionSuccessTicketDialog((){
                      Get.back();
                      // Get.offAndToNamed(AppRoutes.mainParentRoute);
                    }),
                  ),
                );
              }
            );


          }
      ),
    );
  }

  Widget transactionSuccessTicketDialog(Function()? onClose) {
    return Center(
      child: TicketWidget(
        width: Get.width,
        height: Get.height*0.485,
        isCornerRounded: true,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [

                circleBgWidget(),
                Text(
                  "Thank you!",
                  style: TextStyle(
                    color: const Color(0xFF003921),
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
             
                Text(
                  "Your Transaction was Successful",
                  style: TextStyle(
                    color: Colors.black.withValues(alpha: 128),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
           AssetImageWidget(dividerDottedAsset).marginSymmetric(vertical: margin_12),
                dateTimeWidget(),

                amountStatus(amount: "${controller.isHarOver.value?19:controller.pool.value?.joiningPrice}"),


                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Payment Method",
                    style: TextStyle(
                      color: Colors.black.withValues(alpha: 128),
                      fontSize: 10,

                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),


                GestureDetector(
                  onTap:(){
                    Get.back();
                    Get.toNamed(AppRoutes.addAmountWalletRoute);
                  },
                  child: Container(
                     padding: const EdgeInsets.all(12),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF3F5FB),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: const Color(0xFFEBEBEB),
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Row(
                      children: [
                        AssetImageWidget(walletIconAsset,imageHeight: height_15,color: color_black.withOpacity(0.5),)??
                        Icon(Icons.account_balance_wallet, color: Colors.grey.shade700),
                        const SizedBox(width: 12),
                        Text(
                          "Ballstreet Wallet",
                          style: TextStyle(
                            color: const Color(0xFF003921),
                            fontSize: 14,

                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
               ],
            ),
            Positioned(
              right: 0,
              top: 0,
              child: GestureDetector(
                onTap: onClose,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                  child: Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade600,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  circleBgWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        AssetImageWidget(greenBgWithBorderAsset,imageWidth: height_50,imageHeight: height_50,),
        const Icon(
          Icons.check,
          color: Colors.white,
          size: 28,
        )
      ],
    );
  }

  dateTimeWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        dateTimeCell(time: DateFormat("d MMM, y").format(DateTime.now())),
        dateTimeCell(crossAxisAlignment: CrossAxisAlignment.end,time: DateFormat("h:MM a").format(DateTime.now()),date: "Time"),
      ],
    );
  }

  dateTimeCell({date,time,crossAxisAlignment}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: crossAxisAlignment??CrossAxisAlignment.start,
        children: [
          Text(
            date??'Date',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withValues(alpha: 128),
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
            Text(
            time??'20 June, 2017',
            maxLines: 1,
            style: const TextStyle(
              color: Color(0xFF003921),
              fontSize: 14,
               fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget amountStatus({amount}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AMOUNT ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black.withValues(alpha: 128),
                fontSize: 10,

                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '₹ ${amount ?? 49.00}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF003921),
                fontSize: 16,

                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 5, left: 5, right: 4, bottom: 5),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.50,
                color: const Color(0xFFD1D1D1),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child:const  Text(
            'Completed',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: const Color(0xFF003921),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }




  void showBallActionBottomSheet({
    required BuildContext context,
    required int overNumber,
    required int ballNumber,
    dynamic action,
    required VoidCallback onAccept,
    required VoidCallback onReject,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Over ${overNumber+1} - Ball ${ballNumber} - Action ${action}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onAccept();
                    },
                    icon: Icon(Icons.check, color: Colors.white),
                    label: Text("Accept",style: TextStyle(
                      color: Colors.white
                    ),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onReject();
                    },
                    icon: Icon(Icons.close, color: Colors.white),
                    label: Text("Reject",style: TextStyle(
                        color: Colors.white
                    )),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget inningCellKuruk({inning,teamPlay}){
    return Container(

      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      decoration: ShapeDecoration(
        color: inning ==1?const Color(0xFF003921):Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: inning ==1?Colors.grey.withOpacity(0.6): const Color(0xFF003921),
          ),
          borderRadius: BorderRadius.circular(60),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 2,
        children: [
          Text(
            'INNING $inning',
            style: TextStyle(
              color: inning==1?Colors.white: const Color(0xFF003921),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(

            child: Text(
              '(${teamPlay??"CSK"}) Batting',
              style: TextStyle(
                color: inning==1?Colors.white: const Color(0xFF003921),
                fontSize: 7,
                fontFamily: 'Maleah',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget innigWidget({title}){
    return Container(
      padding: const EdgeInsets.all(8).copyWith(left:margin_12,right:margin_15),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFF003921),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.white.withValues(alpha: 77),
          ),
          borderRadius: BorderRadius.circular(60),
        ),
      ),
      child:Row(
          spacing:15,
          children:[
        AssetImageWidget(
            overOverDefaultBgAsset,
          imageHeight:height_15
        ),
        Text(
          'INNING',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
             fontWeight: FontWeight.w500,
          ),
        ),
      ])
    );
  }
  Widget addMoreOver({onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: margin_20),
          padding: const EdgeInsets.all(8).copyWith(left:margin_12,right:margin_15),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFF003921),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.white.withValues(alpha: 77),
              ),
              borderRadius: BorderRadius.circular(60),
            ),
          ),
          child:Row(
              spacing:10,
              children:[
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(


                    padding: EdgeInsets.all(3),

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5.r)

                            ),
                    child: const Icon(CupertinoIcons.add,color: Colors.white,size: 10,),
                  ),
                ),
                Text(
                  'add more entries'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ])
      ),
    );
  }

  handleSelectBallBg({index}) {
    if(index==0){return ballFirstAsset;}
    else if(index==1){ return ballSecondAsset;}
    else if(index==2){ return ballThirdAsset;}
    else if(index==3){ return ballFourAsset;}
    else if(index==4){ return ballFifthAsset;}
    else if(index==5){ return ballSixthAsset;}
    return ballSixthAsset;
  }

  Color handleTextColor({required int index}) {
    if(index==0){
      return Colors.black;
    }else{
      return Colors.white;
    }
  }

  Future onTapHarOverKeyboard({value}) async {

    await controller.setOverBallValue(
        overIndex: controller.selectedOverIndex.value ?? 0,
        ballIndex: controller.selectedBallIndex.value ?? 0,
        value: value);



    var isAllBallSelected = controller.isAllOverBallSelected(overIndex: controller.selectedOverIndex.value??0);

    if(isAllBallSelected) {

      walletBalance.value>19?
      handleBottomSheet()
          :
      showAddMoneyBottomSheet();
    }
  }



}






Future<void> askToPredictMore(
  {
      required VoidCallback onPredictMore,
      required VoidCallback onSubmit,
    }) async {
  await showModalBottomSheet(
    context: Get.context!,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Do you want to predict more overs?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),

            // Buttons
            Column(
              spacing: margin_10,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                appButton(buttonText: 'Predict More',onTap: (){
                  Navigator.pop(context);
                  onPredictMore();
                }),
                appButton(buttonText: 'Submit Over',onTap: (){
                  Navigator.pop(context);
                  onSubmit();();
                })??
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    onSubmit();
                  },
                  icon: Icon(Icons.check),
                  label: Text("Submit Over"),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}


