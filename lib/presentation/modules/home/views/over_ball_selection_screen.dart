
import 'dart:math';
import 'dart:ui';

import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:base_project/presentation/modules/home/controllers/match_score_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../app/export.dart';
import '../controllers/live_match_list_controller.dart';
import '../controllers/over_ball_selection_controller.dart';
import '../controllers/upcoming_match_list_controller.dart';

class OverBallSelectionScreen extends GetView<OverBallSelectionController> {
  final controller = Get.put(OverBallSelectionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFAF1),
      body: Column(
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
                          scoreSection(),
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
                          scoreSection(teamName: "CSK"),
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

  playingTextWidget(){
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
          selectOverBlockWidget(),
          selectBallBlockWidget(),

        ],
      ).marginOnly(top: margin_230),
    );
  }


  Widget headingTextWidget({title}){
    return Text(
      title?? 'Select Ball',
      style: const TextStyle(
        color:   Color(0xFF003921),
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.66,
      ),
    );
  }

  Widget bgDefaultOver({data}){
    return Stack(
      alignment: Alignment.center,
      children: [
        AssetImageWidget(overOverDefaultBgAsset,imageWidth: height_35,imageHeight: height_35,),
        Text(
          data??"02",
          style: const TextStyle(
            color:  Color(0xFF004225),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }


  Widget bgDefaultBall({data,onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AssetImageWidget(ballSelectionDefaultAsset,imageWidth: height_35,imageHeight: height_35,),
          Text(
            data??"02",
            style: const TextStyle(
              color:  Color(0xFF004225),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
  Widget selectedBall({data}){
    return Stack(
      alignment: Alignment.center,
      children: [
        AssetImageWidget(selectedBallAsset,imageWidth: height_35,imageHeight: height_35,),
        Text(
          data??"02",
          style: const TextStyle(
            color:  Color(0xFF004225),
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
      crossAxisCount: 7, // 7 items per row
      shrinkWrap: true, // Makes height dynamic
      physics: const NeverScrollableScrollPhysics(), // Disables scrolling
      crossAxisSpacing: 8, // Space between columns
      mainAxisSpacing: 8, // Space between rows
      children: List.generate(items.length, (index) {
        return bgDefaultOver(data: "${index+1}")??Container(
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
      margin: EdgeInsets.only(left: margin_20,right: margin_20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          headingTextWidget(title: "Select Over"),
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
                  height:Get.height*0.18,
                  child: overGridWidget(items:List.generate(20, (index)=> "$index"))),
              trophyLogoWidget()
            ],
          ),
          // partnershipCell(),
          // parnersDetails(),
          // overBallDetails(),
          // loremTextWidget(),
        ],
      ),
    );
  }

  Widget trophyLogoWidget({height, width}) {
    return AssetImageWidget(greenCupTrophy,imageHeight: height??height_100,imageWidth: width??height_100,);
  }

  selectBallBlockWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headingTextWidget(title: "Select Ball").marginOnly(left: margin_20),
        SizedBox(
          height: height_50,
          width: Get.width,
          child: ListView.separated(
            shrinkWrap: true,
             scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: margin_20,right: margin_20),
             itemCount: 6,
              itemBuilder: (context,index){
            return Obx(()=>
              controller.selectedBallIndex.value == index
                ? selectedBall(data: "${index+1}").marginOnly(bottom: margin_10)
                : bgDefaultBall(data: "${index+1}",onTap: (){
                  controller.updateBallIndex(index: index,ballValue: "${index+1}");
                  showCustomBottomSheet();
              }
              ).marginOnly(bottom: margin_10));
          }, separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: height_10,);
          },),
        )
      ],
    );
  }


  void showCustomBottomSheet() {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: false, // Don't expand to full height
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 20,
              bottom: 20,
            ),
            child: keyBoardBody(),
          ),
        );
      },
    );
  }

Widget keyBoardBody(){

    // return buildStaggeredGridView(children: controller.keyboardListGrid);
    return gridViewWidget(items: controller.keyboardListGrid)?? Row(
      children: [
        gridViewWidget(items: controller.keyboardListGrid)
      ],
    );
}
  Widget gridViewWidget({required List<dynamic> items}) {
    return AutoHeightGridView(
      padding: EdgeInsets.zero,
      crossAxisCount: 3, // 4 items per row
      shrinkWrap: true, // Makes height dynamic
      physics: const NeverScrollableScrollPhysics(), // Disables scrolling
      crossAxisSpacing: 2, // Space between columns
      mainAxisSpacing: 2, // Space between rows
      itemCount: items.length,
      builder: (BuildContext context, int index) {
        return Container(height: height_50,color: Colors.grey,width: height_50,);
      },
    );
  }


  /// Function widget that builds an auto-height staggered grid view.
  Widget buildStaggeredGridView({
    required List<Widget> children,
    int crossAxisCount = 2,
    double mainAxisSpacing = 2,
    double crossAxisSpacing = 2,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8),
  }) {
    return MasonryGridView.count(
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing,
      padding: padding,
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }




}