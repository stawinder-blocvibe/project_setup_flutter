

import '../../export.dart';

class LogOutDialogWidget extends StatelessWidget {
  final String title;
  final String description;
  final String? yesKey;
  final String? noKey;
  final Function()? onYesPressed;

  LogOutDialogWidget({
    Key? key,
    required this.title,
    required this.description,
    this.noKey,
    this.yesKey,
    this.onYesPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            width: Get.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(margin_5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _dialogTitle(),
                _logoutSubTitle(),
              ],
            ).marginAll(margin_20)),
        _dialogButton()
      ],
    ).marginAll(margin_10);
  }

  Widget _dialogTitle() => TextView(
        title,
        textStyle: textStyleHeadingMedium(),
        textAlign: TextAlign.start,
      ).paddingOnly(bottom: margin_6);

  Widget _logoutSubTitle() => TextView(
        description,
        maxLines: 4,
        textStyle: textStyleTitleSmall(),
        textAlign: TextAlign.start,
      ).paddingOnly(bottom: margin_10);

  Widget _dialogButton() {
    return Row(
      children: [
        noButton(),
        SizedBox(width: margin_15),
        yesButton(),
      ],
    ).marginOnly(top: margin_10, bottom: margin_20);
  }

  yesButton() {
    return Expanded(
        child: MaterialButtonWidget(
      onPressed: onYesPressed,
      buttonRadius: margin_5,
      buttonColor: Colors.white,
      textColor: Colors.black,
      buttonText: yesKey ?? keyYes.tr,
    ));
  }

  noButton() {
    return Expanded(
        child: MaterialButtonWidget(
      onPressed: () {
        Get.back();
      },
      buttonColor: Colors.white,
      buttonRadius: margin_5,
      textColor: Colors.black,
      buttonText: noKey ?? keyNo.tr,
    ));
  }
}
