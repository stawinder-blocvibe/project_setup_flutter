

import 'package:base_project/app/export.dart';
import 'package:base_project/presentation/modules/home/controllers/profile_controller.dart';

class WithdrawCashScreen extends GetView<ProfileController> {
  const WithdrawCashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(

          spacing: margin_15,
          children: [


            normalAppBar(onBackPress: (){
              Get.back();
            }),
            yourWinningWidget().paddingAll(margin_10),
            Center(
              child: amountBox(),
            ),
            Text(
              'Min. ${rupee}50 ,Max ${rupee}crore per day',
              style: TextStyle(
                color: const Color(0xFF003921),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ).marginOnly(top: margin_5),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Send Winning To',
                style: TextStyle(
                  color: const Color(0xFF003921),
                  fontSize: 18,
                   fontWeight: FontWeight.w400,
                ),
              ),
            ).marginOnly(left: margin_20),

            appDivider(color: const Color(0xFFDEDEDE),),
            Row(
              spacing: margin_10,
              children: [
                Container(
                  padding: const EdgeInsets.all(5.08),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, 0.50),
                      end: Alignment(1.00, 0.50),
                      colors: [Colors.white, const Color(0xFFECFFEB)],
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.32,
                        color: const Color(0xFF14A56E),
                      ),
                      borderRadius: BorderRadius.circular(5.08),
                    ),

                ),
                  child: Icon(Icons.account_balance),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BANK OF INDIA',
                      style: TextStyle(
                        color: const Color(0xFF003921),
                        fontSize: 16,
                         fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'XXXX XXXX XXXX 2345',
                      style: TextStyle(
                        color: const Color(0xFF003921),
                        fontSize: 16,
                         fontWeight: FontWeight.w400,
                      ),
                    ),

                  ],
                )
              ],
            ).marginOnly(left: margin_20),
            appDivider(color: const Color(0xFFDEDEDE),),

          ],
        ),
      ),
    );
  }

  Widget yourWinningWidget(){
    return Row(
      children: [
        AssetImageWidget(firstPrizeAsset),
        Text(
          'Your Winnings',
          style: TextStyle(
            color: const Color(0xFF666666),
            fontSize: 16,
             fontWeight: FontWeight.w500,
          ),
        ).marginOnly(left: margin_10),
        Spacer(),
        Obx(
          ()=> Text(
            "₹ "+'${walletBalance.value}',
            style: TextStyle(
              color:Colors.black,
              fontSize: 16,
               fontWeight: FontWeight.w600,
            ),
          ),
        )

      ],
    );
  }

  Widget amountBox(){
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 19),
      margin:  EdgeInsets.symmetric(horizontal: height_70),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            rupee +'50.00',
            style: TextStyle(
              color: const Color(0xFF003921),
              fontSize: 32,
               fontWeight: FontWeight.w500,
            ),
          ),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.black)
            ),
            child: Icon(Icons.close,size: 18,),
          ).marginOnly(left: margin_10)
        ],
      ),
    );
  }
}
