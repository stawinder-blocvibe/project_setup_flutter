/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:base_project/app/export.dart';

class TextFieldDialogWidget extends StatelessWidget {
  final String title;
  final String textFieldTitle;
  final String textFieldHint;
  final Function(String) onYesButtonPressed;

  TextFieldDialogWidget({
    Key? key,
    required this.title,
    required this.textFieldTitle,
    required this.textFieldHint,
    required this.onYesButtonPressed,
  }) : super(key: key);

  final TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            width: Get.width,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(margin_5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_logoutSubTitle(), Form(key: formKey, child: _textField())],
            ).marginAll(margin_20)),
        _dialogButton()
      ],
    ).marginAll(margin_10);
  }

  Widget _logoutSubTitle() => TextView(
        title,
        maxLines: 3,
        textStyle: textStyleTitleMedium(),
        textAlign: TextAlign.start,
      ).paddingOnly(bottom: margin_10);

  _textField() => TextFieldWidget(
        contentPadding: EdgeInsets.symmetric(horizontal: margin_15, vertical: margin_13),
        fillColor: Colors.white,
        borderEnabled: true,
        isBorderColor: true,
        isShadow: false,
        hint: textFieldHint,
        labelText: textFieldTitle,
        textController: textEditingController,
        maxLength: 80,
        inputType: TextInputType.name,
        inputAction: TextInputAction.next,
        validate: (value) => Validator.fieldChecker(value: value, message: textFieldTitle),
      ).paddingOnly(bottom: margin_15);

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
        if (formKey.currentState!.validate()) {
          onYesButtonPressed(textEditingController.text);
        }
      },
      buttonRadius: margin_5,
      buttonColor: Colors.red,
      textColor: Colors.white,
      buttonText: keyYes.tr,
    ));
  }

  noButton() {
    return Expanded(
        child: MaterialButtonWidget(
      onPressed: () {
        Get.back();
      },
      buttonColor: greenButtonColor,
      buttonRadius: margin_5,
      textColor: Colors.white,
      buttonText: keyNo.tr,
    ));
  }
}
