import 'package:base_project/app/core/widget/asset_image.dart';
import 'package:base_project/app/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/core/values/app_assets.dart';
import '../../../../app/core/values/app_values.dart';
import '../bottom_sheet/add_money_bottom_sheet.dart';
import '../bottom_sheet/add_wallet_amount_sheet.dart';
import '../controllers/add_amount_controller.dart';
import '../controllers/profile_controller.dart';

class AddAmountWallet extends GetView<AddAmountController> {
  final controller = Get.put(AddAmountController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
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
                    color: const Color(0xFF14A56E),
          
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Column(
                    spacing: margin_10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap:(){
                            Get.back();
          },
                          child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                      hellowText(name: "Crorepati "),
          
          
                      Text(
                         'Would you like to be a crorepati today',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                           fontWeight: FontWeight.w500,
                          letterSpacing: -0.26,
                        ),
                      ),
          
                      Obx(()=> walletBullCard(balance: walletBalance.value))
                    ],
                  ),
          
                ),
          
                Obx(
                  ()=> Row(
                    // spacing: margin_10, // spacing is not a property of Row, use SizedBox for spacing
                    children: [
                      amountPrizeCell(prize: "₹ 50.00", isSelected: controller.selectedAmountIndex.value == 0, onTap: () {
                        controller.selectedAmountIndex.value = 0;
                        controller.selectedAmountIndex.refresh();
                      }),
                      SizedBox(width: margin_10),
                      amountPrizeCell(prize: "₹ 100.00", isSelected: controller.selectedAmountIndex.value == 1, onTap: () {
                        controller.selectedAmountIndex.value = 1;
                        controller.selectedAmountIndex.refresh();
                      }),
                      SizedBox(width: margin_10),
                      amountPrizeCell(prize: "₹ 500.00", isSelected: controller.selectedAmountIndex.value == 2, onTap: () {
                        controller.selectedAmountIndex.value = 2;
                        controller.selectedAmountIndex.refresh();
                      }),
                    ],
                  ),
                ),
                // Fix for 'Other amount' cell: don't use Expanded, just a regular widget
                amountPrizeCell(prize: "Other amount", isSelected: controller.selectedAmountIndex.value == 3, useExpanded: false, onTap: () {
                  controller.selectedAmountIndex.value = 3;
                  controller.selectedAmountIndex.refresh();
                  // AddMoneyBottomSheet.show(context);
                  showAddWalletAmountSheet(context,addAmount: (amount){
                    Navigator.pop(context);
                    controller.otherAmount.value = amount;
                    controller.otherAmount.refresh();
                    return ;
                    Navigator.pop(context); // Close bottom sheet
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("₹$amount added to your wallet")),
                    );
                  });
                }),
          
                introductionCard(),
          
          
                // checkWithText(),
          
          
                // Spacer(),
                SizedBox(height: 20,),
                  Stack(
          
                    children: [
                      Transform.scale(
                          scale: 1.1,
                          child: AssetImageWidget(cardOnPaymentAsset,imageWidth: Get.width,imageFitType: BoxFit.cover,)),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Obx(()=> appButton(onTap: (){
                          controller.addAmountCall(
                              amount: handleAmount(),
                              onPaymentDone: (){
                                showInSnackBar(message: "Payment Done");
                                Navigator.pop(Get.context!);
                              }
                          );
                        },buttonText: "Add  ₹${handleAmount()}")),
                      ),
                    ],
                  ),
              ],
            ),
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

  Widget walletBullCard({balance}){
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
                      '₹ ${balance??"5000"}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
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


  Widget amountPrizeCell({prize, required bool isSelected, onTap, bool useExpanded = true}) {
    Widget cell = GestureDetector(
      onTap: onTap,
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
              width: isSelected ? 1 : 0.50,
              color: isSelected ? Colors.yellow : const Color(0xFF14A56E),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          prize ?? '50.00',
          style: TextStyle(
            color: const Color(0xFF003921),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
    return useExpanded ? Expanded(child: cell) : cell;
  }

  Widget introductionCard(){
    return Container(
      padding: EdgeInsets.all(margin_12),
      decoration: ShapeDecoration(
        color:const Color(0xFF14A56E),
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
        Flexible(
          child: Text(
            'A long established fact that a reader will be..',
            style: TextStyle(
              color: const Color(0xFF666666),
              fontSize: 14,
              fontFamily: 'Afacad',
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }

  handleAmount() {


    if(controller.selectedAmountIndex.value==0){
      return 50.00;
    }
    else if(controller.selectedAmountIndex.value==1){
      return 100.00;
    }
    else if(controller.selectedAmountIndex.value==2){
      return 500.00;
    }
    return controller.otherAmount.value??0;
  }

}
