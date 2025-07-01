import 'package:base_project/app/core/utils/helper_function.dart';
import 'package:base_project/app/core/widget/asset_image.dart';
import 'package:base_project/app/export.dart';
import 'package:base_project/presentation/modules/home/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/core/values/app_assets.dart';
import '../../../../app/core/values/app_values.dart';
import '../controllers/profile_controller.dart';
import '../controllers/transaction_history_controller.dart';


class TransactionHistory extends GetView<TransactionHistoryController> {
  final  controller = Get.put(TransactionHistoryController());

//transactionDetailApi
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
          child: Column(
            children: [
              // Stick the header at the top
              classNameTitle(title: 'Transaction History', onTapBack: () {
                Get.back();
              }),
              SizedBox(height: margin_10),
              // Make the rest of the content scrollable
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: margin_10,
                    children: [
                      Obx(() =>
                        controller.transactionList.isEmpty
                          ? Container(
                              height: Get.height * 0.8,
                              alignment: Alignment.center,
                              child: AssetImageWidget(
                                emptyListGifAsset,
                                imageFitType: BoxFit.cover,
                              ).marginAll(margin_100),
                            )
                          : Column(
                              children: List.generate(
                                controller.transactionList.length,
                                (index) => controller.transactionList[index].type != "deduct"
                                    ? addAmountCell(transaction: controller.transactionList[index])
                                    : deductAmountCell(transaction: controller.transactionList[index]),
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget addAmountCell({required TransactionModel transaction}){
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, 0.50),
            end: Alignment(1.00, 0.50),
            colors: [Color(0xFFECFFEB), const Color(0xFFECFFEB)],
          ),
          borderRadius: BorderRadiusGeometry.circular(8),
          border: Border.all(color: Colors.green)
        ),
        child: Column(
          spacing: margin_8,
          children: [
            Row(
              children: [
                Text(
                  'Add to wallet',
                  style: TextStyle(
                    color: const Color(0xFF003921),
                    fontSize: 14,
                     fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                Text(
                  '+ ₹${transaction.amount}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF003921),
                    fontSize: 13.47,
                     fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  '01 Jun, 10:28 PM',
                  style: TextStyle(
                    color: const Color(0xFF666666),
                    fontSize: 9,
                    fontFamily: 'Afacad',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                Text(
                  'Successful',
                  style: TextStyle(
                    color: const Color(0xFF666666),
                    fontSize: 9,
                     fontWeight: FontWeight.w400,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget deductAmountCell({required TransactionModel transaction}){
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.teal.withOpacity(0.1),
          borderRadius: BorderRadiusGeometry.circular(8),
          border: Border.all(color: Colors.grey)
        ),
        child: Column(
          spacing: margin_8,
          children: [
            // Fixed header at the top of the cell, not scrollable
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Match entry Charge',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '- ₹${transaction.amount}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 13.47,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                // appDivider().marginOnly(top: margin_8),
              ],
            ),
            // The rest of the content is scrollable if needed
            Row(
              children: [
                Text(
                  "18 Jun, 10:28 PM"??HelperFunction.formatDateTime( dateTimeString: transaction.createdAt!),
                  style: TextStyle(
                    // color:Colors.red.withOpacity(0.7),
                    color:Colors.black.withOpacity(0.7),
                    fontSize: 9,
                     fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Text(
                  'Successful',
                  style: TextStyle(
                    // color: Colors.grey.withOpacity(0.7),
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 9,
                     fontWeight: FontWeight.w400,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }


}
