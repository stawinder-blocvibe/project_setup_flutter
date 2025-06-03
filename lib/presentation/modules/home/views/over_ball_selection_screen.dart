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
      height: Get.height * 0.90,
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          selectOverBlockWidget(),
          selectBallBlockWidget(),
          buildCustomButtonGrid()

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
                  height: Get.height * 0.18,
                  child: overGridWidget(
                      items: List.generate(20, (index) => "$index"))),
              trophyLogoWidget()
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
            padding: EdgeInsets.only(left: margin_20, right: margin_20),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Obx(() =>
              controller.selectedBallIndex.value == index
                  ? selectedBall(data: "${index + 1}").marginOnly(
                  bottom: margin_10)
                  : bgDefaultBall(data: "${index + 1}", onTap: () {
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



  Widget buildCustomButtonGrid() {
    final List<Map<String, String>> gridButtons = [
      {'main': '0', 'sub': ''},
      {'main': '1', 'sub': ''},
      {'main': '2', 'sub': ''},
      {'main': '3', 'sub': ''},
      {'main': '4', 'sub': 'FOUR'},
      {'main': '6', 'sub': 'SIX'},
      {'main': 'WD', 'sub': ''},
      {'main': 'NB', 'sub': ''},
      {'main': 'BYE', 'sub': ''},
    ];

    final List<String> rightButtons = ['UNDO', '5, 7', 'Out', 'LB'];

    return Container(
      height: 192,
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
                  onTap: () {
                    // handle grid button tap
                    debugPrint('Tapped: ${item['main']}');
                    handleBottomSheet();
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
                      handleBottomSheet();
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
                  '₹ 49',
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
                  '₹ 49',
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
                  '₹ 00',
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

            SizedBox(height: 30),

            appButton(buttonText: "JOIN CONTEST",onTap: onJoin)
          ],
        ),
      ),
    );
  }

  void handleBottomSheet() {
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
            // Get.back();
            showDialog(
              context: Get.context!,
              barrierDismissible: true,
              builder: (context) => Dialog(
                backgroundColor: Colors.transparent,
                child: transactionSuccessTicketDialog((){
                  Get.back();
                }),
              ),
            );
          }
      ),
    );
  }

  Widget transactionSuccessTicketDialog(Function()? onClose) {
    return Center(
      child: TicketWidget(
        width: Get.width,
        height: Get.height*0.428,
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

                amountStatus(),


                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Payment Method",
                    style: TextStyle(
                      color: Colors.black.withValues(alpha: 128),
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                Container(
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
        dateTimeCell(),
        dateTimeCell(crossAxisAlignment: CrossAxisAlignment.end,time: "11:30 AM",date: "Time"),
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

  Widget amountStatus(){
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
              '₹ 49.00',
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


}
