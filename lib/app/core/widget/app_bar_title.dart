
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_project/app/core/values/app_values.dart';
import 'package:base_project/app/core/values/text_styles.dart';

class AppBarTitle extends StatelessWidget {
  final String text;

  const AppBarTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyleHeadingSmall(),
      textAlign: TextAlign.center,
    ).paddingOnly(top: margin_18);
  }
}
