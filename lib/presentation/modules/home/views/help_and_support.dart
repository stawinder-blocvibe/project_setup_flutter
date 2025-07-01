import 'package:base_project/app/core/widget/asset_image.dart';
import 'package:base_project/app/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/core/values/app_assets.dart';
import '../../../../app/core/values/app_values.dart';
import '../controllers/profile_controller.dart';

class HelpAndSupport extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          height: Get.height,
          margin: EdgeInsets.only(top: margin_10,right: margin_30),
          decoration: const ShapeDecoration(
            color: Color(0xFFFDFDFD),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.50,
                color: Color(0xFF14A56E),
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
          padding:  EdgeInsets.all(margin_20),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(

              spacing: margin_10,
              children: [

                classNameTitle(title:   '24*7 Help & Support',onTapBack: (){
                  Get.back();
                }),
                 //'24*7 Help & Support'
                customCard(
                  child: Column(
                    spacing: margin_8,
                    children: [
                      Text(
                        '24*7 Help & Support - BALL STREET  ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF003921),
                          fontSize: 14,
                           fontWeight: FontWeight.w400,
                        ),
                      ),

                      Text(
                        "Welcome to BALL STREET support, we are here for your 24*7, because the game never stops, and neither do we.",
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

                customCard(
                    child: Column(
                      spacing: margin_5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    /*  mostAskQuestion(),
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
                     */
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

                        SizedBox(height: 50,)

                      ],
                    ))



















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
