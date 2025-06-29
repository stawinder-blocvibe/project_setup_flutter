

import 'package:base_project/presentation/modules/home/controllers/my_contest_result_card_controller.dart';

import '../../../../app/export.dart';

class MyContestResultCard extends GetView<MyContestResultCardController> {
    MyContestResultCard({super.key});

    final controller = Get.put(MyContestResultCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBarWithWallet(),
          Text(
            "My Contest",
            style: TextStyle(
              color: Color(0xFF003921),
              fontSize: 24,
              fontFamily: 'Ancizar Serif',
              fontWeight: FontWeight.w800,
            ),
          ).marginOnly(top: margin_10,left: margin_10),
          cricketCategoryCard(onTap: (){
            if(controller.liveMatch.value!=null)
            Get.toNamed(AppRoutes.overBallSelectionScreenRoute,arguments: {
              "liveMatch":controller.liveMatch.value,
            });
          }),
          if(false)
          cricketCategoryCard
            (
              onTap: (){
                // Get.toNamed(AppRoutes.contestListScreenRoute,arguments: {
                //   "liveMatch":controller.liveMatch.value,
                // });
              },
              gradient: const LinearGradient(colors: [
                Color(0xFF875CF2),
                Color(0xFF381C7D),
              ]),
              borderColor: Color(0xFF3A266D),
              title: "Kurukshetra\n(120 balls)",
              margin: EdgeInsets.all(margin_16,).copyWith(top: 0))
        ],
      )),
    );
  }
}
