

import 'package:base_project/app/export.dart';

class ScreenHeading extends StatelessWidget {
  final String title;
  final textStyle;
  final actionIcon;
  final topMargin;
  final leading;
  final hideShadow;

  ScreenHeading({
    Key? key,
    required this.title,
    this.actionIcon,
    this.textStyle,
    this.topMargin,
    this.leading,
    this.hideShadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        if (hideShadow == false)
          BoxShadow(
              color: Colors.grey.shade300,
              offset: Offset(0, 2),
              blurRadius: 2,
              spreadRadius: 1)
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leading != null ? leading : SizedBox(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(title,
                  textStyle: textStyle ??
                      textStyleHeadlineMedium().copyWith(color: appColor)),
            ],
          ),
          Spacer(),
          actionIcon ?? Container()
        ],
      ).paddingOnly(
          left: margin_15,
          right: margin_15,
          bottom: topMargin ?? margin_8,
          top: topMargin ?? margin_5),
    );
  }
}
