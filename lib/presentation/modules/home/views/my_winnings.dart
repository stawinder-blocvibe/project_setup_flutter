import 'package:base_project/app/core/widget/asset_image.dart';
import 'package:base_project/app/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/core/values/app_assets.dart';
import '../../../../app/core/values/app_values.dart';
import '../controllers/profile_controller.dart';

class MyWinnings extends StatelessWidget {
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
                classNameTitle(title:   'My Winnings',onTapBack: (){
                  Get.back();
                }),
                 //'24x7 Help & Support'


                Column(

                  children: List.generate(12, (index)=>index%2==1? addAmountCell()
                      :deductAmountCell()).toList(),
                )





















              ],
            ),
          ),
        ),
      )
    );
  }

  Widget addAmountCell(){
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
                  'CSK vs RCB, TATA IPL T20',
                  style: TextStyle(
                    color: const Color(0xFF003921),
                    fontSize: 14,
                     fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                Text(
                  '+ ₹5000.00',
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
                  '01 may, 10:28 PM',
                  style: TextStyle(
                    color: const Color(0xFF666666),
                    fontSize: 9,
                     fontWeight: FontWeight.w400,
                  ),
                ),
                // Spacer(),
                // Text(
                //   'successful',
                //   style: TextStyle(
                //     color: const Color(0xFF666666),
                //     fontSize: 9,
                //     fontFamily: 'Afacad',
                //     fontWeight: FontWeight.w400,
                //   ),
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget deductAmountCell(){
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, 0.50),
            end: Alignment(1.00, 0.50),
            colors: [const Color(0xFFFFF0F0), const Color(0xFFFFF0F0)],
          ),
          borderRadius: BorderRadiusGeometry.circular(8),
          border: Border.all(color: Colors.red)
        ),
        child: Column(
          spacing: margin_8,
          children: [
            Row(
              children: [
                Text(
                  'CSK vs RCB, TATA IPL T20',
                  style: TextStyle(
                    color: Colors.red.withOpacity(0.8),
                    fontSize: 14,
                     fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                Text(
                  '- ₹49',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red.withOpacity(0.8),
                    fontSize: 13.47,
                     fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  '12 may, 10:28 PM',
                  style: TextStyle(
                    color:Colors.red.withOpacity(0.7),
                    fontSize: 9,
                     fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                Text(
                  'successful',
                  style: TextStyle(
                    color: Colors.red.withOpacity(0.7),
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
