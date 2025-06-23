import 'dart:math';

import 'package:base_project/app/core/utils/helper_function.dart';
import 'package:base_project/presentation/modules/home/models/home_api_response.dart';
import 'package:base_project/presentation/modules/home/models/pool_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:win32/win32.dart';
import 'package:base_project/app/routes/app_routes.dart';

import '../../export.dart';

String mainDateFormatter = "yyyy-MM-dd HH:mm:ss";
String showDayFormatter = "yyyy-MM-dd";

Center resultNotFound({message}) => Center(
      child: Text(
        message ??"No result found",
        style: textStyleBodyMedium(),
      ),
    );

Widget loadingWidget() => Center(
        child: CircularProgressIndicator(
      color: colorAppColor,
      backgroundColor: Colors.white,
    ));

utcToLocalLatest(var date, var format) {
  DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date, true);
  var df = DateFormat(format).format(dateTime);
  return df;
}

String changeDateIntoString(DateTime date, String? formatter) {
  try {
    String formattedDate =
        DateFormat(formatter ?? mainDateFormatter).format(date);
    return formattedDate;
  } catch (e) {
    return "";
  }
}

Widget html({required String data}) {
  return Html(
    data: data,
  );
}

ReadMoreTextWidget readMoreWidget({required normalOrHtmlText, bool showReadMore = true}) =>
    ReadMoreTextWidget(
      normalOrHtmlText
              .replaceAll(RegExp(r'<[^>]*>'), '')
              .trim()
              .toString()
              .capitalizeFirst ??
          "" + " ",
      lessStyle: TextStyle(color: colorAppColor),
      moreStyle: TextStyle(color: colorAppColor),
      trimLines: showReadMore ? 1 : 100,
      trimMode: TrimType.Line,
      style: TextStyle(color: Colors.grey.shade600),
      textAlign: TextAlign.justify,
    );


Widget appButton({ String? buttonText,  Widget? child, Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Stack(
      alignment: Alignment.center,
      children: [
        AssetImageWidget(yellowButtonBg,),
        child ?? Text(
          buttonText??"test",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: const Color(0xFF014426),
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget appBarWithWallet({ isHomeScreen = false,bool onlyWallet = false,onTapBack}){
  return Container(
    height: height_60,
    width: Get.width,
    child: Stack(
      alignment: Alignment.center,
      children: [
        AssetImageWidget(appBarBgAsset,imageHeight: height_60,imageFitType: BoxFit.cover,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // AssetImageWidget(ballStreetHorizontalLogo,imageHeight: height_20,imageWidth: height_140,).marginOnly(left: margin_20)

            isHomeScreen==true?AssetImageWidget(leftBullRightBallAsset).marginAll(margin_10):
            GestureDetector(
                onTap: onTapBack??(){
                  Get.back();
                },
                child: Icon(CupertinoIcons.chevron_back,color: Colors.white,).marginOnly(left: margin_15)),
            Spacer(),
            geniusButton(onTap:(){}).marginOnly(right: margin_10),
            onlyWallet?
            GestureDetector(
              onTap: (){
                Get.toNamed(AppRoutes.addAmountWalletRoute);
              },
              child: Container(
                height: height_30,
                padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 12),
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AssetImageWidget(addCashAsset,imageWidth: height_20,imageHeight: height_20,).marginOnly(right: margin_8),
                    Obx(
                      ()=>
                          Text(
                            (walletBalance.value>0)?
                        "₹ ${walletBalance.value}":"Add Cash",
                        textAlign: TextAlign.center,
                        style:const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      ).marginOnly(top: margin_2),
                    )
                  ],
                ),
              ).marginOnly(right: margin_20),
            ):
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                AssetImageWidget(walletIconAsset,imageWidth: height_20,imageHeight: height_20,) ,
                Obx(
                ()=>Text(  "₹ ${walletBalance.value??"100"}" ,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ).marginOnly(top: margin_5,left: margin_5),
                )
              ],
            ).marginOnly(right: margin_20),

          ],
        ),
      ],
    ),
  );

}

handleWalletBalance() {
  //HelperFunction.isWalletBalanceZero()
  if (walletBalance.value) {
    return "Add Cash";
  } else{
    return null;
  }
  return "Add Cash";
}

Widget geniusButton({required  Function() onTap}) {
  return Chip(
    shape: StadiumBorder(
      side: BorderSide(color: Colors.white24), // Optional outline
    ),
    backgroundColor: Color(0xFF237E53), // Custom green
    avatar: AssetImageWidget(premiumIconAsset,imageFitType: BoxFit.cover,imageHeight: height_20,imageWidth: height_20,),
    label: Text(
      'Genius',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    padding: EdgeInsets.symmetric(horizontal: 11, vertical: 6),
  );
}
Widget cricketCategoryCard({title,subTitle,description,margin,onTap,gradient,borderColor}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: margin??const EdgeInsets.all(16),

      decoration: BoxDecoration(
        gradient: gradient?? const LinearGradient(colors: [
          Color(0xFFFA6162),
          Color(0xFFFE2224),
        ]),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor??const Color(0xFF7E0001)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          trophyLogoWidget(width: Get.width,height: height_100),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Row(

                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Left Text Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          title??'Har Over\nCrorepati',
                          style: const TextStyle(
                            fontSize: 19 ,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ).marginOnly(top: margin_10),
                        const  SizedBox(height: 8),
                        Text(
                          maxLines: 3,
                          subTitle??'Lorem ipsum is a dummy or placeholder text commonly used. lorem ipsum is a dummy or placeholder text commonly used.',
                          style: const TextStyle(

                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ).marginOnly(bottom: margin_7),
                      ],
                    ),
                  ),

                   AssetImageWidget(ballBullWicketAsset,imageHeight: height_100,imageWidth: height_90,)
                ],
              ).marginOnly(left: 16.r),

              if(false)
              // Bottom banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF275D3B),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.r),
                    bottomRight: Radius.circular(12.r),
                  ),
                ),
                child:  Center(
                  child: Text(
                    description??'Lorem ipsum is a dummy or placeholder',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: font_13,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
Widget trophyLogoWidget({height, width}) {
  return AssetImageWidget(greenCupTrophy, imageHeight: height ?? height_100,
    imageWidth: width ?? height_100,);
}

Widget contestCellWidget({onTap, required PoolModel pool}){
  return  GestureDetector(
      onTap:onTap,
    child: Container(
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, 0.50),
          end: Alignment(1.00, 0.50),
          colors: [Colors.white, const Color(0xFFECFFEB)],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50,
            color: const Color(0xFF14A56E),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Positioned(
              child: trophyLogoWidget(height: height_100,width: height_150)),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Text(
                        'Prize Pool',
                        style: TextStyle(
                          color: const Color(0xFF003921),
                          fontSize: 10,
                          fontFamily: 'Afacad',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        pool.winningPrice.toString()??'5 Lakhs',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF003921),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ).marginOnly(bottom: margin_15),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF003921),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    child:   Text(
                      pool.joiningPrice.toString()??'49',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  leftPart(sport: min(3,pool.maxParticipants??3).toString()),
                  rightPart()
                ],
              ),


            ],
          ).paddingAll( margin_20),
        ],
      ),
    ),
  );


}
Widget leftPart({rangeDividerWidth,sport}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 6,
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 6,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    ' ${sport??"2"} Left',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFFF4242),
                      fontSize: 12,
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Opacity(
                    opacity: 0.60,
                    child: Container(
                      width: 1,
                      height: 8,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFBFBFBF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(

                    '${sport??2} Spots',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF003921),
                      fontSize: 12,
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      Container(
        width: rangeDividerWidth??Get.width *0.3,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 83,
              height: 2,
              decoration: ShapeDecoration(
                color: const Color(0xFFFF4242),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 2,
                decoration: ShapeDecoration(
                  color: const Color(0x7FFF4242),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
Widget rightPart({winPrize}){
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    spacing: width_8,
    children: [

      AssetImageWidget(firstPrizeAsset,imageHeight: height_15),
        Text(
        '${winPrize??"5 Lakhs"}',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: const Color(0xFF003921),
          fontSize: 10,
          fontFamily: 'Afacad',
          fontWeight: FontWeight.w500,
        ),
      ),
      AssetImageWidget(trophyOutlineAsset,imageHeight: height_15),
      const Text(
        '50%',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color(0xFF003921),
          fontSize: 10,
          fontFamily: 'Afacad',
          fontWeight: FontWeight.w500,
        ),
      ),
      AssetImageWidget(loaderPngAsset,imageHeight: height_15,),
      const Text(
        '40',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color(0xFF003921),
          fontSize: 10,
          fontFamily: 'Afacad',
          fontWeight: FontWeight.w500,
        ),
      )
    ],
  );
}

 Widget upcomingMatchCell({onTap, UpcomingMatches? upcomingMatch}) {
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

           topWidget(isT20: false,upcomingMatch:upcomingMatch).marginOnly(top:margin_5 ),
            centerWidget(isT20: false,upcomingMatch:upcomingMatch),
          SizedBox(height: height_10,)
        ],
      ),
    ).marginOnly(bottom: margin_10),
  );
}
Widget topWidget({isT20 = true, UpcomingMatches? upcomingMatch}) {
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
          upcomingMatch?.type??'T20',
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
        width: Get.width * 0.39,
        child: Text(
          maxLines: 1,overflow: TextOverflow.ellipsis,
          upcomingMatch?.venue??'Maharaja yadavindra...',
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

Widget centerWidget({isT20 = true, UpcomingMatches? upcomingMatch}) {
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
            imageUrl: upcomingMatch?.teamALogoUrl??"",
            imageHeight: height_40,
            imageWidth: height_40,
            placeHolder: punjabPlaceHolderAsset,
            // radiusAll: 50.r,
          ),
          SizedBox(width: 6),
          Text(
            (upcomingMatch?.teamAAbbr??'PUN').substring(0, 2),
            // upcomingMatch?.teamAAbbr??'PUN',
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
      ):
      dayTimingWidget(dateTime: upcomingMatch?.startDatetime??DateTime.now().toString()),

      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(

            child: Text(
              (upcomingMatch?.teamBAbbr??'CSK').substring(0, 2),
              style: TextStyle(

                color: const Color(0xFF004225),
                fontSize: 12,
                fontFamily: 'TAN - SONGBIRD',
                fontWeight: FontWeight.w600,
                height: 3,
                letterSpacing: 1.20,
              ),
            ),
          ),
          SizedBox(width: 6),


          NetworkImageWidget(
            imageUrl: upcomingMatch?.teamBLogoUrl??"",
            imageHeight: height_40,
            imageWidth: height_40,
            imageFitType: BoxFit.cover,
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
Widget dayTimingWidget({dateTime}){
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        getDayLabel(date:DateTime.parse(dateTime) )??'Tomorrow',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black.withValues(alpha: 153),
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
      Text(
        HelperFunction.formatTimeToAmPm(DateTime.parse(dateTime))??'12:00 PM',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black.withValues(alpha: 153),
          fontSize: 14,

          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}
ballList() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        "W",
        "6",
        "4",
        "6",
        "NB",
        "0",  "6",
      ]
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

            fontWeight: FontWeight.w400,
          ),
        ),
      ))
          .toList(),
    ),
  );
}
  String getDayLabel({required DateTime date}) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final target = DateTime(date.year, date.month, date.day);

  final diffDays = target.difference(today).inDays;

  if (diffDays == 0) {
    return "Today";
  } else if (diffDays == 1) {
    return "Tomorrow";
  } else if (diffDays > 1) {
    return "In $diffDays days";
  } else {
    return "Past"; // Optional: "Yesterday", or "X days ago"
  }
}

Widget customCard({required Widget child}){

  return Container(
    padding: const EdgeInsets.all(12),
    margin: EdgeInsets.all(margin_5),
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      shadows: const [
        BoxShadow(
          color: Color(0x26003921),
          blurRadius: 4,
          offset: Offset(0, 0),
          spreadRadius: 0,
        )
      ],
    ),
    child: child,
  );
}
Widget item({needNextButton=false,title,asset,onTap}){
  return GestureDetector(
    onTap: onTap,
    child: Row(
      spacing: margin_8,
      children: [
        (asset is IconData)?
        Icon(asset,color: Colors.black,size: 20):
        AssetImageWidget(
          asset??profileIconAsset,imageFitType: BoxFit.cover,imageHeight: height_24,imageWidth: height_24,),

        Text(
          title??'Satwinder Shergill',
          style: TextStyle(
            color: const Color(0xFF003921),
            fontSize: 14,
            fontFamily: 'Afacad',
            fontWeight: FontWeight.w400,
          ),
        ),
        Spacer(),
        if(needNextButton==true)
          Icon(Icons.navigate_next_rounded,size: height_24,)
      ],
    ),
  );
}
Widget appDivider(){
  return Container(
    width: double.infinity,
    height: 1,
    padding: const EdgeInsets.all(10),
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(color: const Color(0x19003921)),
  );
}
Widget classNameTitle({title,onTapBack,onTapClose}) {
  return Stack(
    children: [
      Center(
        child: Text(
          title??'My profile',
          style: TextStyle(
            color: const Color(0xFF003921),
            fontSize: 18,
            fontFamily: 'Ancizar Serif',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      if(onTapClose!=null)
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadiusGeometry.circular(radius_5),
            ),
            child: Icon(Icons.close, size: 20),
          ),
        ),

      if(onTapBack!=null)
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            padding: EdgeInsets.all(margin_2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadiusGeometry.circular(radius_5),
            ),
            child: GestureDetector(
                onTap: onTapBack,
                child: Icon(Icons.arrow_back_ios_rounded, size: 15)),
          ),
        ),
    ],
  );
}

Widget inningWidget(){
  return Container(
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
    padding: const EdgeInsets.all(8),
    // child: ,
  );
}

void showAddMoneyBottomSheet() {
  showModalBottomSheet(
    context: Get.context!,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.account_balance_wallet_rounded, size: 48, color: Colors.amber[800]),
            const SizedBox(height: 16),
            Text(
              "Add Money to Wallet",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              "You need to add money to your wallet before proceeding.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.amber[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: Icon(Icons.add_circle_outline, size: 20,color: Colors.white,),
                label: Text("Add Money", style: TextStyle(fontSize: 16,color: Colors.white)),
                onPressed: () {
                  Get.back();
                  Get.toNamed(AppRoutes.addAmountWalletRoute);

                  // Navigator.pop(context); // Close bottom sheet
                  // Navigator.pushNamed(context, "/add-money"); // Route to add money page
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

