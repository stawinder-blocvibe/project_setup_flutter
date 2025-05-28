

import 'package:base_project/app/export.dart';

class AuthenticationScreenHeading extends StatelessWidget {
  final String title;
  final textStyle;

  AuthenticationScreenHeading({
    Key? key,
    required this.title,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.centerLeft, child: TextView(title, textStyle: textStyle ?? textStyleHeadlineMedium().copyWith(color: appColor)))
        .paddingOnly(top: margin_5, bottom: margin_10);
  }
}
