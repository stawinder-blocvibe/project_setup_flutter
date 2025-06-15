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

                classNameTitle(title:   '24x7 Help & Support',onTapBack: (){
                  Get.back();
                }),
                 //'24x7 Help & Support'
                customCard(
                  child: Column(
                    spacing: margin_8,
                    children: [
                      Text(
                        'No recent activity yet to show',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF003921),
                          fontSize: 14,
                           fontWeight: FontWeight.w400,
                        ),
                      ),

                      Text(
                        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF666666),
                          fontSize: 10,
                           fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                ),

                customCard(
                    child: Column(
                      spacing: margin_5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mostAskQuestion(),
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
                      appDivider(),

                    ],
                )),


                customCard(
                    child: Column(
                      spacing: margin_5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        mostAskQuestion(title: "Contacts"),
                        appDivider(),
                        item(title: "bull@street.info",),
                        appDivider(),
                        item(title: "+91 9898989898",),
                        appDivider(),
                        item(title: "0591 - 261000",),
                        appDivider(),
                        item(title: "A- 126, Block A, Shivalik Colony,\n Malviya Nagar,New Delhi\n Delhi 110017, India",),

                      ],
                    ))



















              ],
            ),
          ),
        ),
      )
    );
  }



  Widget mostAskQuestion ({title}){
    return Text(
      title??'Most Asked Qutions',
      style: TextStyle(
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
