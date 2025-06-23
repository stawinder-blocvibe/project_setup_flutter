  


import '../../export.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final String dialogType;
  final String description;
  final Function(String) onButtonPressed;

  AlertDialogWidget({
    Key? key,
    required this.title,
    required this.dialogType,
    required this.description,
    required this.onButtonPressed,
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
        textStyle: textStyleHeadingLarge(),
        textAlign: TextAlign.start,
      ).paddingOnly(bottom: margin_10);

  Widget _logoutSubTitle() => TextView(
        description,
        maxLines: 3,
        textStyle: textStyleTitleMedium(),
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
      onPressed: () {
        onButtonPressed(dialogType);
      },
      buttonRadius: margin_5,
      buttonColor: Colors.white,
      textColor: Colors.black,
      buttonText: keyYes.tr,
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
      buttonText: keyNo.tr,
    ));
  }
}
