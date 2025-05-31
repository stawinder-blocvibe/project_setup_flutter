import 'package:base_project/app/export.dart';

class OnBoardingWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  const OnBoardingWidget({
    Key? key,
    required this.title,
    required this.subTitle,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.transparent, body: _bodyWidget());
  }

  Widget _bodyWidget() =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,

          children: [
            Center(child: titleWidget()),
            Center(child: subTitleWidget()),
      ]).paddingOnly(top: margin_5);


  Widget titleWidget() {
    return Text(
      title??'Welcome back to Ball Street',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'TAN - SONGBIRD',
        fontWeight: FontWeight.w400,
        height: 2.25,
        letterSpacing: 1.60,
      ),
    );
  }

  Widget subTitleWidget() {
    return Text(
      subTitle??'Predict matches, earn rewards &\nclimb the leaderboard!',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'Maleah',
        fontWeight: FontWeight.w700,
        letterSpacing: 0.16,
      ),
    );
  }
}
