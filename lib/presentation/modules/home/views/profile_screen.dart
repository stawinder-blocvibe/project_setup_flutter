 import 'package:base_project/app/export.dart';
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
          decoration: ShapeDecoration(
            color: const Color(0xFFFDFDFD),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.50, color: const Color(0xFF14A56E)),
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
                myProfileText(),
                customCard(
                  child: Column(
                    spacing: margin_8,
                    children: [
                      // item(),
                      // appDivider(),

                      Obx(()=> item(
                          title: "+91 - ${currentUserDataModel.value.detail?.mobileNumber??"9877995251"}")),
                      // appDivider(),

                      // item(title: "14 - 03 - 2001"),
                    ],
                  ),
                ),

                customCard(
                  child: Column(
                    spacing: margin_8,
                    children: [item(title: "Ballstreet wallet",onTap: (){
                      Get.toNamed(AppRoutes.addAmountWalletRoute);
                    })],
                  ),
                ),

                customCard(
                  child: Column(
                    spacing: margin_8,
                    children: [
                      item(title: "My winnings",onTap: (){
                        Get.toNamed(AppRoutes.myWinningsRoute);
                      }),
                      appDivider(),

                      item(title: "How to Play"),
                      appDivider(),

                      item(
                        title: "My info ",
                        onTap: () {
                          Get.toNamed(AppRoutes.myInfoRoute);
                        },

                      ),
                    ],
                  ),
                ),

                customCard(
                  child: Column(
                    spacing: margin_8,
                    children: [item(title: "transaction history",onTap: (){
                      Get.toNamed(AppRoutes.transactionHistoryRoute);
                    })],
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

                      item(title: "About us",onTap: (){
                        Get.toNamed(AppRoutes.aboutUsRoute);
                      }),

                    ],
                  ),
                ),

                customCard(
                  child: Column(
                    spacing: margin_8,
                    children: [item(title: "24x7 Help & Support",onTap: (){
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
