import 'dart:math';

import 'package:base_project/app/export.dart';
import 'package:base_project/presentation/modules/home/models/pool_model.dart';
import '../../home/models/home_api_response.dart';
import '../controllers/my_match_kuruk_contest_controller.dart';

class MyMatchKurukContest extends GetView<MyMatchKurukContestController> {

  var controller = Get.put(MyMatchKurukContestController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,

              delegate: _MyHeaderDelegate(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appBarWithWallet(),
                    contestTextWidget().paddingOnly(top: margin_20,left: margin_20,right: margin_20),
                  ],
                ),
              ),
            ),
            Obx(
                ()=> SliverList(

                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var cellWidget = controller.predictedPoolList[index];
                    return contestCellWidget(
                      onTap: (){
                        Get.toNamed(AppRoutes.overBallSelectionResultScreenRoute,arguments: {
                          "liveMatch":controller.liveMatch.value,
                        });
                      },
                      margin: EdgeInsets.only(left:margin_20,right: margin_20,top: 0),
                      wantPaidText: true,
                      pool: cellWidget,
                    );
                  },
                  childCount: controller.predictedPoolList.length,
                ),
                              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget contestTextWidget() {
    return Text(
      'Contest',
      style: TextStyle(
        color: const Color(0xFF003921),
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  _MyHeaderDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: Colors.white,
      child: child,
    );
  }

  @override
  double get maxExtent => 100 + 24 + 40; // Adjust as needed for your header height
  @override
  double get minExtent => maxExtent;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
