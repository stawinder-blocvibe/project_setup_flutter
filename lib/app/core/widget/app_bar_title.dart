  

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../values/app_values.dart';
import '../values/text_styles.dart';

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
