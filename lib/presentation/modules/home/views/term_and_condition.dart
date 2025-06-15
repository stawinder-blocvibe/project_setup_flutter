import 'package:base_project/app/core/widget/asset_image.dart';
import 'package:base_project/app/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/core/values/app_assets.dart';
import '../../../../app/core/values/app_values.dart';
import '../controllers/profile_controller.dart';

class TermAndCondition extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          height: Get.height,
          margin: EdgeInsets.only(top: margin_10,right: margin_30),
          decoration: const ShapeDecoration(
            color:  Color(0xFFFDFDFD),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.50,
                color:  Color(0xFF14A56E),
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
//  'transaction history',
                classNameTitle(title:   'Term & Conditions',onTapBack: (){
                  Get.back();
                }),
                 //'24x7 Help & Support'
                customCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: margin_12,
                    children: [
                      headingText(),
                      subHeading(),


                      // headingText(),
                      // subHeading(title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),



                      headingText(),
                      subHeading(title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),


                      headingText(title: "Privacy policy"),
                      subHeading(title: "Lorem Ipsu is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),


                      headingText(title:"Terms"),
                      subHeading(title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),

                    ],
                  )
                ),





















              ],
            ),
          ),
        ),
      )
    );
  }



 Widget headingText({title}){
    return Text(
      title??'Lorem Ipsum',
      style: const TextStyle(
        color: const Color(0xFF003921),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
 }

  Widget subHeading({title}){
    return Text(
      title??'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
    style: TextStyle(
        color: const Color(0xFF666666),
    fontSize: 14,
     fontWeight: FontWeight.w400,
    ),
    );
  }

}
