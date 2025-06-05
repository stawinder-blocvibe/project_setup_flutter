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

Widget contestCellWidget(){
  return  Container(
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
  );


}
Widget leftPart(){
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
        width: Get.width *0.3,
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