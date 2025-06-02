import 'package:base_project/app/core/values/app_assets.dart';
import 'package:base_project/app/core/widget/asset_image.dart';
import 'package:base_project/app/export.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFAF1),
      body: Column(
        children: [
          appBarWithWallet(onlyWallet: true),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: AssetImageWidget(
                    imageHeight: Get.height * 0.4,
                    imageWidth: Get.width * 0.7,
                    greenCupTrophy,
                  ),
                ).marginOnly(top: margin_100),
                SingleChildScrollView(
                  child: homeWidgets(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget leaderBoardWidget() {
    return AssetImageWidget(
      leaderBoardAsset,
      imageHeight: Get.height * 0.11,
      imageWidth: Get.width,
      imageFitType: BoxFit.cover,
      radiusAll: 10.r,
    );
  }

  Widget homeWidgets() {
    return Column(
      spacing: 10,
      children: [
        leaderBoardWidget(),

        liveMatchesWidget(),

        upComingMatches(),
      ],
    ).paddingAll(margin_20);
  }

  Widget liveMatchesWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Live Matches',
              style: TextStyle(
                color: const Color(0xFF004225),
                fontSize: font_19,
                fontFamily: fontFamily,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.toNamed(AppRoutes.liveMatchesScreenRoute);
              },
              child: Row(
                spacing: 4,
                children: [
                  Text(
                    'View All',
                    style: TextStyle(
                      color: appColor,
                      fontSize: font_14,
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: appColor,
                    size: 16,
                  )
              
                ],
              ),
            )
          ],
        ),
        SizedBox(
          child: Column(
            children: [
              matchCarouselList(),
              _carouselIndicator(),
            ],
          ),
        ),
      ],
    );
  }

  Widget matchCarouselList() => SizedBox(
        height: height_115, // Ensures a fixed height for the carousel
        child: CarouselSlider.builder(
          options: CarouselOptions(
            onPageChanged: (value, r) {
              controller.carousalIndex.value = value;
              controller.update();
              debugPrint("Carousel Index: \\${controller.carousalIndex.value}");
            },
            viewportFraction: 1.0,
            height: height_115,
            autoPlay: true,
            enableInfiniteScroll: false,
            reverse: false,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enlargeCenterPage: false,
          ),
          itemCount: controller.liveMatchesList.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.matchScoreScreenRoute);
              },
              child: _cardView(index),
            );
          },
      ));

  Widget _cardView(int index) {
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

          topWidget(),

          centerWidget(),

          bottomWidget(),
        ],
      ),
    );
  }

  Widget _carouselIndicator() => Container(
        height: height_18,
        alignment: Alignment.center,
        width: Get.width,
        margin: EdgeInsets.only(bottom: margin_0),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.liveMatchesList.length,
              (index) => Container(
                height: height_8,
                width: height_8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.carousalIndex.value == index
                      ? Colors.grey
                      : Colors.grey.shade300,
                ),
              ).marginAll(margin_2),
            ),
          ),
        ),
      ).marginOnly(top: margin_5);

  Widget topWidget({isT20 = true}) {
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
            'T20',
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
        Text(
          'Maharaja yadavindra...',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontSize: 13,
            fontFamily: 'Maleah',
            fontWeight: FontWeight.w700,
          ),
        ).marginOnly(right: margin_10),
      ],
    ).marginOnly(top: margin_10);
  }

  centerWidget({isT20 = true}) {
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
              imageUrl: "",
              imageHeight: height_40,
              imageWidth: height_40,
              placeHolder: punjabPlaceHolderAsset,
              // radiusAll: 50.r,
            ),
            SizedBox(width: 6),
            Text(
              'PUN',
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
        ):dayTimingWidget(),

        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'CSK',
              style: TextStyle(
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
              imageUrl: "",
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

  Widget bottomWidget() {
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

  Widget upComingMatches() {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Row
          (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upcoming Matches',
              style: TextStyle(
                color: const Color(0xFF004225),
                fontSize: font_19,
                fontFamily: fontFamily,
                fontWeight: FontWeight.w600,
              ),
            ),

            GestureDetector(
              onTap: (){
                Get.toNamed(AppRoutes.upcomingMatchesScreenRoute);
              },
              child: Row(
                spacing: 4,
                children: [
                  Text(
                    'View All',
                    style: TextStyle(
                      color: appColor,
                      fontSize: font_14,
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: appColor,
                    size: 16,
                  )

                ],
              ),
            )
          ],
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            return upcomingMatchCell( onTap: (){
              Get.toNamed(AppRoutes.overBallSelectionScreenRoute);
            });
          },
          itemCount: 5,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }

  upcomingMatchCell({onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFEFFAF1),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: greenButtonColor),
        ),
        child: Column(
          spacing: 12,
          children: [

            topWidget(isT20: false).marginOnly(top:margin_5 ),

            centerWidget(isT20: false),
            SizedBox(height: height_10,)
          ],
        ),
      ).marginOnly(bottom: margin_10),
    );
  }

  Widget dayTimingWidget(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Tomorrow',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withValues(alpha: 153),
            fontSize: 14,
            fontFamily: 'Maleah',
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          '12:00 PM',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withValues(alpha: 153),
            fontSize: 14,
            fontFamily: 'Maleah',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

