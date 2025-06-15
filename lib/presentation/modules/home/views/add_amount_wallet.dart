import 'package:base_project/app/core/widget/asset_image.dart';
import 'package:base_project/app/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/core/values/app_assets.dart';
import '../../../../app/core/values/app_values.dart';
import '../controllers/profile_controller.dart';

class AddAmountWallet extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          height: Get.height,

          padding:  EdgeInsets.all(margin_20),
          child: Column(

            spacing: margin_10,
            children: [


              Container(
                padding: EdgeInsets.all(margin_20).copyWith(bottom: 0),
                // height: height_200,
                width: Get.width,

                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFF003921),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Column(
                  spacing: margin_10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_back_ios,color: Colors.white,),
                    hellowText(name: "Satwinder Shergill"),

                    Text(
                       'Would you like to be a crorepati today',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Afacad',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.26,
                      ),
                    ),

                    walletBullCard()
                  ],
                ),

              ),

              Row(
                spacing: margin_10,
                children: [
                  amountPrizeCell(prize: "₹ 50.00"),
                  amountPrizeCell(prize: "₹ 100.00"),
                  amountPrizeCell(prize: "₹ 500.00"),
                ],
              ),
              SizedBox(
                height: height_36,
                  child: amountPrizeCell(prize: "Other amount")),

              introductionCard(),

              Spacer(),
              checkWithText(),
              appButton(onTap: (){},buttonText: "Add  ₹500"),



















            ],
          ),
        ),
      )
    );
  }


  Widget hellowText({name}){
    return Text(
      'Hello $name,',
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontFamily: 'Afacad',
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget walletBullCard(){
    return Container(//
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.50, 1.00),
          end: Alignment(0.50, 0.00),
          colors: [const Color(0xFFEC8525), const Color(0xFFFDB31C)],
        ),
        color: const Color(0xFFD27D08),
        borderRadius: BorderRadius.circular(10.r)

      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          trophyLogoWidget(height: height_100,width: Get.width*0.7),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wallet\nBalance',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                         fontWeight: FontWeight.w400,
                      ),
                    ),

                    Text(
                      '₹ 500.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'Afacad',
                        fontWeight: FontWeight.w500,
                      ),
                    ).marginOnly(top: margin_10)
                  ],
                ),
              ),
            Spacer(),

            AssetImageWidget(ballBullWicketAsset,imageWidth: Get.width*0.3,imageHeight: height_100,)
            ],
          ),
        ],
      ),
    );
  }


  Widget amountPrizeCell({prize}){
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),

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
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          prize??'50.00',
          style: TextStyle(
            color: const Color(0xFF003921),
            fontSize: 14,
             fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget introductionCard(){
    return Container(
      padding: EdgeInsets.all(margin_12),
      decoration: ShapeDecoration(
        color: const Color(0xFF003921),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Introducing',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                   fontWeight: FontWeight.w700,
                ),
              ),

              Text(
                'Ball Street',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                   fontWeight: FontWeight.w500,
                  letterSpacing: -0.44,
                ),
              ),
              SizedBox(
                width: 152,
                child: Text(
                  'Show your skill on 6 balls\nGet 1 crore. Every over',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                     fontWeight: FontWeight.w500,
                    letterSpacing: -0.24,
                  ),
                ),
              ).marginOnly(top: margin_10)
            ],
          ),
          Spacer(),
          AssetImageWidget(coinsAsset,imageWidth: Get.width*0.3,imageHeight: height_100,)

        ],
      ),
    );
  }

  Widget checkWithText(){
    return Row(
      children: [
        Checkbox(value: true, onChanged: (value){

        }),
        Text(
          'A long established fact that a reader will be..',
          style: TextStyle(
            color: const Color(0xFF666666),
            fontSize: 14,
            fontFamily: 'Afacad',
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }

}
