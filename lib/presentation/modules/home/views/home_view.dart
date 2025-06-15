import 'dart:math';

import 'package:base_project/app/export.dart';
import 'package:base_project/presentation/modules/home/models/home_api_response.dart';
import 'package:carousel_slider/carousel_slider.dart';



import '../controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFAF1),
      body: Column(
        children: [
          appBarWithWallet(onlyWallet: true,isHomeScreen: true),
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


        bannerCarousel()??
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
                Get.toNamed(AppRoutes.liveMatchesScreenRoute,arguments: {
                  'liveMatches': controller.homeApiResponse.value?.liveMatches,
                });
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

  Widget matchCarouselList() => Obx(
      ()=> SizedBox(
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
            itemCount: controller.homeApiResponse.value?.liveMatches?.length??0,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              var liveMatch = controller.homeApiResponse.value?.liveMatches?[index];
              return InkWell(
                onTap: () {
                  // Get.toNamed(AppRoutes.matchScoreScreenRoute);
                  Get.toNamed(AppRoutes.matchDetailCategoryScreenRoute,arguments: {
                    'liveMatch': liveMatch,
                  });
                },
                child: _cardView(liveMatch: liveMatch!),
              );
            },
        )),
  );

  Widget bannerCarousel() => Obx(
        () {
      final banners = controller.homeApiResponse.value?.banners;
      if (banners == null || banners.isEmpty) {
        return Container(color: Colors.red, height: height_50);
      }
      return SizedBox(
        height: Get.height * 0.11,
        child: CarouselSlider.builder(
          options: CarouselOptions(
            onPageChanged: (value, r) {
              controller.carousalBannerImageIndex.value = value;
              controller.update();
              debugPrint("carousalBannerImageIndex Index: ${controller.carousalBannerImageIndex.value}");
            },
            viewportFraction: 1.0,
            height: Get.height * 0.11,
            autoPlay: true,
            enableInfiniteScroll: false,
            reverse: false,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enlargeCenterPage: false,
          ),
          itemCount: banners.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            // final imageUrl = banners[index] ?? "";
            debugPrint("Banner Index: $index, Real Index: $realIndex, ");
            return NetworkImageWidget(
              imageUrl: "",
              placeHolder: leaderBoardAsset,
              imageHeight: Get.height * 0.2,
              imageWidth: Get.width,
              imageFitType: BoxFit.cover,
              radiusAll: 10.r,

              color: greenButtonColor,
              // Add caching and fade effect if supported by NetworkImageWidget
              // Example: fadeInDuration: Duration(milliseconds: 300),
              // cache: true,
            ).marginSymmetric(horizontal: margin_10);
          },
        ),
      );
    },
  );

  Widget _cardView({required LiveMatches liveMatch}) {
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

          topWidget(liveMatch:liveMatch),

          centerWidget(liveMatch:liveMatch),

          bottomWidget(liveMatch:liveMatch),
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
              controller.homeApiResponse.value?.liveMatches?.length??3,
              (index) {

                return Container(
                  height: height_8,
                  width: height_8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.carousalIndex.value == index
                        ? Colors.grey
                        : Colors.grey.shade300,
                  ),
                ).marginAll(margin_2);
              },
            ),
          ),
        ),
      ).marginOnly(top: margin_5);

  Widget topWidget({required LiveMatches liveMatch,isT20 = true}) {
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
            liveMatch.type??'T20',
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
        SizedBox(
          width: Get.width*0.39,
          child: Text(

            liveMatch.venue??'Maharaja yadavindra...',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 13,
              fontFamily: 'Maleah',
              fontWeight: FontWeight.w700,
            ),
          ).marginOnly(right: margin_10),
        ),
      ],
    ).marginOnly(top: margin_10);
  }

  centerWidget({isT20 = true, required LiveMatches liveMatch}) {
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
              imageUrl: liveMatch.teamALogoUrl??"",
              imageHeight: height_40,
              imageWidth: height_40,
              placeHolder: punjabPlaceHolderAsset,
              // radiusAll: 50.r,
            ),
            SizedBox(width: 6),
            Text(
              liveMatch.teamAAbbr??'PUN',
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
        ):dayTimingWidget(dateTime: liveMatch.startDatetime),

        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              liveMatch.teamBAbbr??'CSK',
              style: const TextStyle(
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
              imageUrl: liveMatch.teamBLogoUrl??"",
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

  Widget bottomWidget({required LiveMatches liveMatch}) {
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
                Get.toNamed(AppRoutes.upcomingMatchesScreenRoute,arguments: {
                  'upcomingMatches': controller.homeApiResponse.value?.upcomingMatches,
                });
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
        Obx(
        ()=>controller.homeApiResponse.value?.upcomingMatches?.isEmpty==true
            ?
        SizedBox.shrink():
        ListView.builder(
            itemBuilder: (context, index) {
              var upcomingMatch = controller.homeApiResponse.value?.upcomingMatches?[index];
              return upcomingMatchCell(
                  upcomingMatch:upcomingMatch,
                  onTap: (){
                Get.toNamed(AppRoutes.overBallSelectionScreenRoute);
              });
            },
            itemCount: min(4, controller.homeApiResponse.value?.upcomingMatches?.length??0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
      ],
    );
  }




}

