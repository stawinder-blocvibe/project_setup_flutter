
import 'package:base_project/presentation/modules/main_parent/controllers/main_parent_controller.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../app/export.dart';

class MainParentScreen extends GetView<MainParentController> {
  final controller = Get.find<MainParentController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DoubleBack(
        child: SafeArea(
          child: Scaffold(
            extendBody: true,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            backgroundColor: Colors.transparent,
            body: controller.homeList[controller.bottomNavIndex.value],
            bottomNavigationBar: _bottomNav(),
          ),
        ),
      ),
    );
  }

  _bottomNav() => Container(
    // height: height_70 ,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        AssetImageWidget(appBarBgAsset,radiusAll: margin_10,).marginAll(margin_8).paddingSymmetric(vertical: margin_6,),
        Container(
          margin: EdgeInsets.all(margin_8),
          padding: EdgeInsets.symmetric(vertical: margin_6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius_12),
            border: Border.all(color: Colors.transparent,),

            color: Colors.transparent,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius_12),
            child: BottomNavigationBar(
              currentIndex: controller.bottomNavIndex.value,
              type: BottomNavigationBarType.fixed,
              enableFeedback: false,
              backgroundColor: Colors.transparent,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              selectedLabelStyle: textStyleBody1().copyWith(
                  fontSize: font_12,

                  fontWeight: FontWeight.w500,
                  color: Colors.transparent),
              unselectedLabelStyle: textStyleBody1().copyWith(
                  fontSize: font_12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade400),
              onTap: (index) {
                if (index != 2) {
                  controller.updateBottomNavIndex(index);
                }
              },
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey.shade400,
              selectedIconTheme: IconThemeData(color: appColor),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: _bottomIcon(
                        icon: CupertinoIcons.home,
                        color: controller.bottomNavIndex.value == 0
                            ? Colors.white
                            : greyColor),

                    label: "Home".tr),
                BottomNavigationBarItem(
                    icon: _bottomIcon(
                        icon: Icons.sports_cricket,
                        color: controller.bottomNavIndex.value == 1
                            ? Colors.white
                            : greyColor),
                    label: "My Match's".tr),
                BottomNavigationBarItem(
                  icon: SizedBox.shrink(), // Reserved space for Predict
                  label: "",
                ),
                BottomNavigationBarItem(
                    icon: _bottomIcon(
                        icon: Icons.waterfall_chart,
                        color: controller.bottomNavIndex.value == 3
                            ? Colors.white
                            : greyColor),
                    label: "My Winnings".tr),
                BottomNavigationBarItem(
                    icon: _bottomIcon(
                        icon: CupertinoIcons.profile_circled,
                        color: controller.bottomNavIndex.value == 4
                            ? Colors.white
                            : greyColor),
                    label: "Profile".tr),
              ],
            ),
          ),
        ),

        /// Custom Predict Button
        Positioned.fill(
          top: 25,
          child: Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () => controller.updateBottomNavIndex(2),
              child:
              AssetImageWidget(redBullAsset,imageWidth: height_25,
                imageHeight: height_25,imageFitType: BoxFit.cover,)??
              Container(
                width: 80,
                height: 80,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(272.22),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 4,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 6.48,
                      top: 6.48,
                      child:


                      Container(
                        width: 67.04,
                        height: 67.04,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(0.50, 1.00),
                            end: Alignment(0.50, 0.00),
                            colors: [
                                Color(0xFFEC8525),
                                Color(0xFFFDB31C)
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(272.22),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Predict',
                            style: textStyleBody1().copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: font_10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );



  /* Widget _bottomIcon(imageUrl, {color}) => AssetImageWidget(
        imageUrl,
        imageHeight: height_20,
        color: color,
      );*/


  Widget _bottomIcon( {color,required IconData icon}) => Icon(icon,color: color,size: height_20,);
}
