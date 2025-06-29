import 'package:base_project/app/core/widget/asset_image.dart';
import 'package:base_project/app/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/core/values/app_assets.dart';
import '../../../../app/core/values/app_values.dart';
import '../../player/video_player_screen.dart';
import '../controllers/profile_controller.dart';

class HowToPlay extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());


  // Big Buck Bunny - Popular test video
 var bunny=  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

// Elephant Dream - High quality test video
  var elephant = "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4";

// For Bigger Blazes - Action test video
  var bucket1 =  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4";

// For Bigger Fun - Entertainment test video
  var bucket2 =  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4";


  var title= "Big Buck Bunny";
  var url=  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
  var thumbnail= "https://peach.blender.org/wp-content/uploads/bbb-splash.png";
  var duration=  "10:34";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          height: Get.height,
          margin: EdgeInsets.only(top: margin_10,right: margin_30),
          decoration: ShapeDecoration(
            color: const Color(0xFFFDFDFD),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.50,
                color: const Color(0xFF14A56E),
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
          padding:  EdgeInsets.all(margin_20),
          child: SingleChildScrollView(
            child: Column(

              spacing: margin_10,
              children: [

                classNameTitle(title:   'How to Play',onTapBack: (){
                  Get.back();
                }),
                 //'24x7 Help & Support'
                customCard(
                  child: Column(
                    spacing: margin_8,
                    children: [
                      Text(
                        "No recent activity yet to show",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF003921),
                          fontSize: 14,
                           fontWeight: FontWeight.w400,
                        ),
                      ),

                      Text(
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
                         textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF666666),
                          fontSize: 10,
                           fontWeight: FontWeight.w400,
                        ),
                      ).marginSymmetric(horizontal: margin_10),
                    ],
                  )
                ),

             Container(
               width: Get.width,
               padding: const EdgeInsets.all(12),
               decoration: ShapeDecoration(
                 gradient: LinearGradient(
                   begin: Alignment(0.00, 0.50),
                   end: Alignment(1.00, 0.50),
                   colors: [const Color(0xFFF0FBFF), const Color(0xFFF0FAFF)],
                 ),
                 shape: RoundedRectangleBorder(
                   side: BorderSide(
                     width: 0.20,
                     color: const Color(0xFF4255FF),
                   ),
                   borderRadius: BorderRadius.circular(7),
                 ),
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     'HAR OVER CROREPATI',
                     style: TextStyle(
                       color: const Color(0xFF003921),
                       fontSize: 24,
                        fontWeight: FontWeight.w600,
                     ),
                   ),
                   cricketCategoryCard(
                       titleFont:24.0,
                       margin: EdgeInsets.only(top: margin_20),
                       subTitle: "Call a complete OVER right, 1 Massive prize, 1 CRORE*",
                       onTap: (){



                       }).marginOnly(top: margin_10),


                 ],
               ),
             ),
             Container(
               width: Get.width,
               padding: const EdgeInsets.all(12),
               decoration: ShapeDecoration(
                 gradient: LinearGradient(
                   begin: Alignment(0.00, 0.50),
                   end: Alignment(1.00, 0.50),
                   colors: [const Color(0xFFF0FBFF), const Color(0xFFF0FAFF)],
                 ),
                 shape: RoundedRectangleBorder(
                   side: BorderSide(
                     width: 0.20,
                     color: const Color(0xFF4255FF),
                   ),
                   borderRadius: BorderRadius.circular(7),
                 ),
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     'HAR INNING CROREPATI',
                     style: TextStyle(
                       color: const Color(0xFF003921),
                       fontSize: 24,
                        fontWeight: FontWeight.w600,
                     ),
                   ),
                   cricketCategoryCard(
                     onTap: (){
                       Get.to(
                           VideoPlayerScreen(
                             videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                       ));
                     },
                     titleFont:18.0,
                     margin: EdgeInsets.only(top: margin_30),
                       subTitle: "120 balls , your call, Most accurate wins 1CRORE* (Winner According to LEADERBOARD)",
                       gradient: const LinearGradient(colors: [
                         Color(0xFF875CF2),
                         Color(0xFF381C7D),
                       ]),
                       borderColor: Color(0xFF3A266D),
                       title: "HAR INNING CROREPATI (120 BALLS)".toUpperCase(),
                    )


                 ],
               ),
             ),
             /*   customCard(
                    child: Column(
                      spacing: margin_5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    *//*  mostAskQuestion(),
                      appDivider(),
                      titleText(),
                      appDivider(),
                      titleText(title: "Lorem Ipput is simply dummy text ?"),
                      appDivider(),
                      titleText(title: "Lorem Ipput is simply dummy text ?"),
                      appDivider(),
                      titleText(title: "Lorem Ipput is simply dummy text ?"),
                      appDivider(),
                      titleText(title: "It is a long established fact that a reader will be distracted by the readable content ?"),
                     *//*
                    Text(
                    'Need help?',
                    style: TextStyle(
                        color: const Color(0xFF003921),
                  fontSize: 14,
                   fontWeight: FontWeight.w400,
                ),
          ),
                      appDivider(),
                      Text(
                        'Choose any option below - we are active 24 hours a day, 7 days a Week. PHONE SUPPORT',
                        style: TextStyle(
                          color: const Color(0xFF666666),
                          fontSize: 13,
                          fontFamily: 'Afacad',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      // appDivider(),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                color: const Color(0xFF666666),
                                fontSize: 14,
                                 fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '(10 AM - 4 PM)',
                              style: TextStyle(
                                color: const Color(0xFF003921),
                                fontSize: 14,
                                 fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text:'  (Monday - Friday)',
                              style: TextStyle(
                                color: Colors.black.withValues(alpha: 128),
                                fontSize: 12,
                                 fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      )

                    ],
                )),


                customCard(
                    child: Column(
                      spacing: margin_12,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        mostAskQuestion(title: "Contact Us".toUpperCase(),style: TextStyle(
                          color:  Color(0xFF003921),
                          fontSize: 14,
                           fontWeight: FontWeight.w400,
                        ),),
                        // appDivider(),
                        item(title: "+91 8100201919",asset: mobileAsset,titleStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                        appDivider(),
                        mostAskQuestion(title: "Whatsapp Help Desk",
                          style: TextStyle(
                          color:  Color(0xFF003921),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),),
                        item(title: "https://ballstreet.in/help-desk",
                            asset: phoneAsset
                        ),

                        appDivider(),

                        mostAskQuestion(title: "EMAIL Support",
                          style: TextStyle(
                            color:  Color(0xFF003921),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),),
                        item(
                            title: "support@ballstreet.club",
                            asset: mailIconAsset,
                          iconSize: 28.0,
                          iconColor: Colors.black.withOpacity(0.5)


                        ),
                         appDivider(),
                        item(
                          asset: addressIconAsset,
                          title: "Address : C-30 (F/04) first floor , sec -63 Noida -201301 (U.P)",),

                      ],
                    ))*/



















              ],
            ),
          ),
        ),
      )
    );
  }



  Widget mostAskQuestion ({title,style}){
    return Text(
      title??'Most Asked Qutions',
      style: style??TextStyle(
        color: const Color(0xFF003921),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget titleText({title}){
    return Text(
     title?? 'Lorem Ipsum is simply dummy text of the ?',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: const Color(0xFF666666),
        fontSize: 13,
         fontWeight: FontWeight.w400,
      ),
    );
  }
}
