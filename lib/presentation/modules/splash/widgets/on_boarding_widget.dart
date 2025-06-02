import 'package:base_project/app/export.dart';

class OnBoardingWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const OnBoardingWidget({
    Key? key,
      this.title,
      this.subTitle,

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
      style:   TextStyle(
        color: Colors.white,
        fontSize: font_20,
        fontWeight: FontWeight.w600
      ),
    );
  }

  Widget subTitleWidget() {
    return Text(
      subTitle??'Predict matches, earn rewards &\nclimb the leaderboard!',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: font_16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
