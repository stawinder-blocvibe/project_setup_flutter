import 'package:base_project/app/export.dart';
import 'package:base_project/presentation/modules/home/views/withdraw_cash_screen.dart';
import '../../authentication/models/response_models/user_data_model.dart';
import '../controllers/profile_controller.dart';
class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
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
          child: Column(
            children: [
              // Place the profile header at the top, outside the scrollable area
              Column(
                children: [
                  classNameTitle(
                      title: "My Profile",
                      prefix: GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.myInfoRoute);
                        },
                          child: const Hero(
                              tag: 'profile',
                              child:  Icon(CupertinoIcons.profile_circled,color: Colors.black,)))),
                  appDivider().marginOnly(top: margin_15)
                ],
              ),
              // The rest of the content is scrollable
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: margin_10,
                    children: [
                  
                  
                      customCard(
                        child: Column(
                          spacing: margin_8,
                          children: [
                            item(
                              title: "Guest User"
                            ),
                            appDivider(),
                  
                            Obx(()=> item(
                              asset: mobileAsset,
                                title: "+91 - ${currentUserDataModel.value.detail?.mobileNumber??"9877995251"}")),
                            appDivider(),
                  
                            item(title: "14 - 03 - 2001",asset: calendarIconAsset),
                          ],
                        ),
                      ),
                  
                      customCard(
                        child: Column(
                          spacing: margin_8,
                          children: [item(title: "Ball Street Wallet",onTap: (){
                            Get.toNamed(AppRoutes.addAmountWalletRoute);
                          })],
                        ),
                      ),
                  
                  
                      if(false)
                      customCard(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add Cash',
                            style: TextStyle(
                              color: const Color(0xFF003921),
                              fontSize: 14,
                              fontFamily: 'Afacad',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )),
                      customCard(
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: margin_5,
                              children: [
                                Text(
                                  'Payment Method',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black.withValues(alpha: 128),
                                    fontSize: 10,
                                     fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Obx(
                                  ()=> Text(
                                    "₹ "+
                                    walletBalance.value.toString(),
                                    style: TextStyle(
                                      color: const Color(0xFF003921),
                                      fontSize: 12,
                                       fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                  
                  
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                                onTap: (){
                                  Get.to(WithdrawCashScreen());
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFF3F5FB),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          color: const Color(0xFFEBEBEB),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      'Withdraw instantly',
                                      style: TextStyle(
                                        color: const Color(0xFF003921),
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                ) ),
                  
                          ],
                        ),
                      ),
                  
                      customCard(
                        child: Column(
                          spacing: margin_8,
                          children: [item(title: "Transaction History",onTap: (){
                            Get.toNamed(AppRoutes.transactionHistoryRoute);
                          })],
                        ),
                      ),
                      customCard(
                        child: Column(
                          spacing: margin_8,
                          children: [
                            item(title: "My Winnings",onTap: (){
                              Get.toNamed(AppRoutes.myWinningsRoute);
                            }),
                            appDivider(),
                  
                            item(title: "How to Play",onTap: (){
                              Get.toNamed(AppRoutes.howToPlayRoute);
                            }),
                            /*appDivider(),
                  
                            item(
                              title: "My info ",
                              onTap: () {
                                Get.toNamed(AppRoutes.myInfoRoute);
                              },
                  
                            ),*/
                          ],
                        ),
                      ),
                  
                      customCard(
                        child: Column(
                          spacing: margin_8,
                          children: [
                            item(title: "Terms & Conditions",onTap: (){
                              Get.toNamed(AppRoutes.termAndConditionRoute);
                            }),
                            appDivider(),
                  
                            item(title: "About US",onTap: (){
                              Get.toNamed(AppRoutes.aboutUsRoute);
                            }),
                            appDivider(),
                            item(title: "Rules and Regulations",onTap: (){
                              Get.toNamed(AppRoutes.rulesAndRegulationsRoute);
                            })
                            ,
                              appDivider(),
                              item(title: "Privacy & Policy",onTap: (){
                                Get.toNamed(AppRoutes.privacyAndPolicyRoute);
                              }
                            ),
                  
                          ],
                        ),
                      ),
                  
                      customCard(
                        child: Column(
                          spacing: margin_8,
                          children: [item(title: "24*7 Help & Support",onTap: (){
                            Get.toNamed(AppRoutes.helpAndSupportRoute);
                          })],
                        ),
                      ),
                  
                      logoutButton(),
                  
                      versionText(version: "1.0.0"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myProfileText() {
    return Stack(
      children: [
        Center(
          child: Text(
            'My profile',
            style: TextStyle(
              color: const Color(0xFF003921),
              fontSize: 18,
              fontFamily: 'Ancizar Serif',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadiusGeometry.circular(radius_5),
            ),
            child: Icon(Icons.close, size: 20),
          ),
        ),
      ],
    );
  }

  Widget logoutButton() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: const Color(0x33FF4242),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.20, color: const Color(0xFFFF4242)),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      child: item(title: "Log Out ",asset: Icons.login_rounded,onTap: (){
        preferenceManger.clearLoginData();
        currentUserDataModel.value = UserResponseModel();
        Get.offAllNamed(AppRoutes.loginRoute);
      }),
    );
  }

  Widget versionText({required String version}) {
    return Text(
      'Version $version',
      style: TextStyle(
        color: const Color(0xFF003921),
        fontSize: 8,

        fontWeight: FontWeight.w400,
      ),
    );
  }
}

/**/
