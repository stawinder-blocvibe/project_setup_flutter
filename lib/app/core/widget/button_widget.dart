


import '../../export.dart';

class MaterialButtonWidget extends StatelessWidget {
  final String? buttonText;
  final buttonTextStyle;
  final Color? buttonColor;
  final Color? textColor;
  final double? buttonRadius;
  final double? minWidth;
  final double? minHeight;
  final double? verticalPadding;
  final double? horizontalPadding;
  final Function()? onPressed;
  final elevation;
  final borderColor;
  final borderWidth;
  final widget;
  final iconWidget;
  final isOutlined;

  const MaterialButtonWidget({
    Key? key,
    this.buttonText = "",
    this.buttonColor,
    this.buttonTextStyle,
    this.textColor,
    this.buttonRadius,
    required this.onPressed,
    this.elevation,
    this.borderColor,
    this.borderWidth,
    this.minWidth,
    this.minHeight,
    this.verticalPadding,
    this.horizontalPadding,
    this.widget,
    this.iconWidget,
    this.isOutlined = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        focusElevation: 0,
        highlightElevation: 0,
        highlightColor: Colors.transparent,
        height: minHeight,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        disabledColor: Colors.transparent,
        splashColor: Colors.transparent,
        minWidth: minWidth ?? Get.width,
        color: isOutlined ? buttonColor ?? Colors.white : (buttonColor ?? appColor),
        elevation: elevation ?? radius_0,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: isOutlined ? borderColor : Colors.transparent, width: isOutlined ? borderWidth ?? width_1 : width_0),
            borderRadius: BorderRadius.circular(buttonRadius ?? margin_25)),
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(vertical: verticalPadding ?? margin_7, horizontal: horizontalPadding ?? margin_20),
        child: widget ?? TextView(buttonText!, textStyle: buttonTextStyle ?? textStyleTitleSmall().copyWith(color: textColor ?? Colors.white)));
  }
}
