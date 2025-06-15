import 'package:base_project/app/core/widget/asset_image.dart';
import 'package:base_project/app/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/core/values/app_assets.dart';
import '../../../../app/core/values/app_values.dart';
import '../controllers/profile_controller.dart';

class AboutUs extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          margin: EdgeInsets.only(top: margin_10, right: margin_30),
          decoration: const ShapeDecoration(
            color: Color(0xFFFDFDFD),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.50, color: Color(0xFF14A56E)),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
          padding: EdgeInsets.all(margin_20),
          child: SingleChildScrollView(
            child: Column(
              spacing: margin_10,
              children: [
                classNameTitle(
                  title: 'About Us',
                  onTapBack: () {
                    Get.back();
                  },
                ),
                //'24x7 Help & Support'
                customCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: margin_12,
                    children: [
                      Center(
                        child: AssetImageWidget(
                          ballStreetHorizontalLogo,
                          imageHeight: height_20,
                          imageWidth: height_140,
                        ).marginOnly(left: margin_20),
                      ),
                      ourVisionText(),
                      capitalLargeText(),

                      appSpanText(),

                      AssetImageWidget(
                        bullWicketPitchBallAsset,
                        imageHeight: height_180,
                        imageWidth: Get.width,
                        // color:Colors.grey,
                      ).marginOnly(left: margin_20),

                      capitalLargeText(),
                      subHeading(
                        title:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard “ dummy text ever since the 1500s, when an unknown ” - printer took a galley of type and scrambled it to make a type specimen book. ",
                      ),



                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ourVisionText() {
    return Text(
      'Our vision',
      style: TextStyle(
        color: const Color(0xFF003921),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget headingText({title}) {
    return Text(
      title ?? 'Lorem Ipsum',
      style: const TextStyle(
        color: const Color(0xFF003921),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget subHeading({title}) {
    return Text(
      title ??
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
      style: TextStyle(
        color: const Color(0xFF666666),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget capitalLargeText() {
    return Text(
      'LOREM IPSUM IS SIMPLY',
      style: TextStyle(
        color: const Color(0xFF003921),
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  appSpanText() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard “ dummy text ever since the 1500s, when an unknown ',
            style: TextStyle(
              color: const Color(0xFF666666),
              fontSize: 15,
              fontFamily: 'Afacad',
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: ' printer (took a galley of type and scrambled it to make) a type specimen book.',
            style: TextStyle(
              color: const Color(0xFF003921),
              fontSize: 15,
              fontFamily: 'Afacad',
              fontWeight: FontWeight.w500,
              letterSpacing: -0.30,
            ),
          ),
        ],
      ),
    );
  }
}
