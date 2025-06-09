import 'package:base_project/app/core/values/app_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:win32/win32.dart';
import '../../../../app/core/utils/helper_widget.dart';
import '../../../../app/export.dart';
import '../controllers/leaderboard_winning_result_controller.dart';

class LeaderboardWinningResultScreen
    extends GetView<LeaderboardWinningResultController> {
  var controller = Get.put(LeaderboardWinningResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      body: Column(
        children: [
          appBarWithWallet(onlyWallet: true),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [guranteedPlusPrizeWidget(), stockWidget()],
              ),
              amountTextWidget().marginOnly(top: margin_20),
              leftPart(rangeDividerWidth: Get.width),
              appButton(buttonText: "Join Contest",onTap: (){

                Get.until((route) => route.settings.name == AppRoutes.overBallSelectionScreenRoute);
                // Get.toNamed(AppRoutes.overBallSelectionScreenRoute);
              }).marginOnly(top: margin_10),
              Container(
                alignment: Alignment.centerLeft,
                width: Get.width * 0.5,
                child: rightPart(),
              ),
            ],
          ).paddingAll(margin_20),
          tabBarWidget(),
          tabBarData(),
        ],
      ),
    );
  }

  Widget guranteedPlusPrizeWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2.73,
      children: [
        const Icon(Icons.verified_rounded, color: Colors.blue, size: 20),
        Text(
          'Guaranteed',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withValues(alpha: 153),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'plus*',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF003921),
            fontSize: 12,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Prize  Pool',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF666666),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget stockWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 2.73,
      children: [
        const Icon(
          CupertinoIcons.chart_bar_square,
          color: Colors.blue,
          size: 20,
        ),
        Text(
          'Max Price Pool',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withValues(alpha: 153),
            fontSize: 12,
            fontStyle: FontStyle.italic,
            fontFamily: 'Afacad',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget amountTextWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 2.73,
      children: [
        Text(
          '5 Lakh',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF003921),
            fontSize: 24.55,
            fontFamily: 'Afacad',
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          '5 Lakh',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF003921),
            fontSize: 24.55,
            fontFamily: 'Afacad',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget tabBarWidget() {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        controller: controller.tabController,
        labelColor: const Color(0xFF003921),
        unselectedLabelColor: Colors.grey,
        indicatorColor: const Color(0xFF003921),
        tabs: const [
          Tab(text: 'Leaderboard'),
          Tab(text: 'Winning'),
          Tab(text: 'Result'),
        ],
      ),
    );
  }

  Widget tabBarData() {
    return Expanded(
      child: DefaultTabController(
        length: 3,
        child: TabBarView(
          controller: controller.tabController,
          children: [
            // Leaderboard Tab
            leaderBoardWidget(),
            // Winning Tab
            winingWidget(),
            // Result Tab
             resultWidget().marginOnly(right: margin_10),
          ],
        ),
      ),
    );
  }

  leaderBoardWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        beTheFirstText(),
        Divider(color: Colors.grey).marginSymmetric(vertical: margin_10),

        SizedBox(
          width: 162,
          child: Text(
            'All Team (20,35,6)',
            style: TextStyle(
              color: const Color(0xFF666666),
              fontSize: 16,
              fontFamily: 'Afacad',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Divider(color: Colors.grey).marginSymmetric(vertical: margin_10),

        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: 10,
            shrinkWrap: true,
            separatorBuilder: (a, b) {
              return Divider(
                color: Colors.grey,
              ).marginSymmetric(vertical: margin_10);
            },
            itemBuilder: (context, index) {
              return leaderBoardCellWidget();
            },
          ),
        ),
      ],
    ).marginOnly(left: margin_10,);
  }

  Widget leaderBoardCellWidget() {
    return Row(
      children: [
        NetworkImageWidget(
          imageUrl: "",
          placeHolder: klRahulProfileAsset,
          imageHeight: height_30,
          imageWidth: height_30,
          radiusAll: 40.r,
          imageFitType: BoxFit.cover,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 15,
          children: [
            Text(
              'Anuj singh',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF003921),
                fontSize: 18,
                fontFamily: 'Afacad',
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: ShapeDecoration(
                color: const Color(0x33666666),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 15,
                children: [
                  Text(
                    'T3',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF6A6A6A),
                      fontSize: 8,
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  beTheFirstText() {
    return Text(
      'Be the first in your network to Join this Contest.',
      style: TextStyle(
        color: const Color(0xFF666666),
        fontSize: 14,
        fontFamily: 'Afacad',
        fontWeight: FontWeight.w400,
      ),
    ).marginOnly(top: margin_20);
  }

  winingWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        beTheFirstText(),
        Divider(color: Colors.grey).marginSymmetric(vertical: margin_10),
        guarantedMaximumBreakupWidget(),
        Divider(color: Colors.grey).marginSymmetric(vertical: margin_10),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: margin_20),
            shrinkWrap: true,
            itemCount: controller.prizeList.length,
            itemBuilder: (context, index) {
              final entry = controller.prizeList[index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Header (if any)
                  if (entry.sectionHeader != null)
                    sectionDivider(entry.sectionHeader!),

                  // Top banner for Rank 1 (centered)
                  if (entry.rank == "Rank 1") ...[
                    const Center(
                      child: Text(
                        "Rank 1",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),
                    Center(
                      child: Text(
                        entry.prize,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ] else
                    prizeRow(entry.rank, entry.prize),
                ],
              );
            },
          ),
        ),
      ],
    ).marginOnly(left: margin_10);
  }

  Widget guarantedMaximumBreakupWidget() {
    return Container(
      margin: EdgeInsets.only(right: margin_10),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      decoration: ShapeDecoration(
        color: const Color(0xFFF2F3F8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Obx(
          ()=> Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.selectedBreakUpIndexTab.value = 0;
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration:controller.selectedBreakUpIndexTab.value==1?BoxDecoration():ShapeDecoration(
                    color: const Color(0xFFF2F3F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 2,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Text(
                    'Guaranteed Breakup',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF003921),
                      fontSize: 14,
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Obx(
            ()=> Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.selectedBreakUpIndexTab.value = 1;
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration:controller.selectedBreakUpIndexTab.value==0?BoxDecoration():ShapeDecoration(
                    color: const Color(0xFFF2F3F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 2,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Text(
                    'maximum Breakup',
                    style: TextStyle(
                      color: const Color(0xFF515966),
                      fontSize: 14,
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget prizeRow(String rank, String prize) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(rank, style: const TextStyle(fontSize: 16)),
          Text(
            prize,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ).marginOnly(right: margin_10);
  }

  Widget sectionDivider(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: <Widget>[
          const Expanded(child: Divider(color: Colors.grey)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          const Expanded(child: Divider(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget resultWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        beTheFirstText(),
        Divider(color: Colors.grey).marginSymmetric(vertical: margin_10),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return upcomingMatchCell( onTap: (){
                Get.toNamed(AppRoutes.overBallSelectionScreenRoute);
              });
            },
            itemCount: 5,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
      ],
    ).marginOnly(left: margin_10);
  }
}
