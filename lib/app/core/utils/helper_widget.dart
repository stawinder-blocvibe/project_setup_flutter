import 'package:flutter_html/flutter_html.dart';


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

Widget appBarWithWallet({ bool onlyWallet = false}){
  return Container(
    height: height_60,
    width: Get.width,
    decoration: BoxDecoration(
      color: appGreen
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AssetImageWidget(ballStreetHorizontalLogo,imageHeight: height_20,imageWidth: height_140,).marginOnly(left: margin_20)
        ,
        onlyWallet?
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 12),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.black.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AssetImageWidget(addCashAsset,imageWidth: height_20,imageHeight: height_20,).marginOnly(right: margin_8),
              Text(
                'Add Cash',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: font_12,
                  fontFamily:fontFamily,
                  fontWeight: FontWeight.w500,
                  height: 1.50,
                  letterSpacing: -0.23,
                ),
              ).marginOnly(top: margin_2)
            ],
          ),
        ).marginOnly(right: margin_20):
        AssetImageWidget(walletIconAsset,imageWidth: height_20,imageHeight: height_20,).marginOnly(right: margin_20),

      ],
    ),
  );

}
Widget cricketCategoryCard({title,subTitle,description,margin,onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: margin??const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: const Color(0xFFE7F0E9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.shade700),
      ),
      child: Column(
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
                      title??'Har Over Crorepati',
                      style: const TextStyle(
                        fontSize: 19 ,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0E3E25),
                      ),
                    ).marginOnly(top: margin_10),
                    const  SizedBox(height: 8),
                    Text(
                      maxLines: 3,
                      subTitle??'Lorem ipsum is a dummy or placeholder text commonly used. lorem ipsum is a dummy or placeholder text commonly used.',
                      style: const TextStyle(

                        fontSize: 14,
                        color: Color(0xFF0E3E25),
                      ),
                    ).marginOnly(bottom: margin_7),
                  ],
                ),
              ),

               AssetImageWidget(ballBullWicketAsset,imageHeight: height_70,imageWidth: height_60,)
            ],
          ).marginOnly(left: 16.r),

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
    ),
  );
}
Widget trophyLogoWidget({height, width}) {
  return AssetImageWidget(greenCupTrophy, imageHeight: height ?? height_100,
    imageWidth: width ?? height_100,);
}

Widget contestCellWidget({onTap}){
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
                        '5 Lakhs',
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
                      '49',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  leftPart(),
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
Widget leftPart({rangeDividerWidth}) {
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
                    '1 Left',
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
                    '2 Spots',
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
Widget rightPart(){
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    spacing: width_8,
    children: [

      AssetImageWidget(firstPrizeAsset,imageHeight: height_15),
      const Text(
        'Lakhs',
        textAlign: TextAlign.center,
        style: TextStyle(
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

 Widget upcomingMatchCell({onTap}) {
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
        "0","NB",
        "0",
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
            fontFamily: 'Poltawski Nowy',
            fontWeight: FontWeight.w400,
          ),
        ),
      ))
          .toList(),
    ),
  );
}