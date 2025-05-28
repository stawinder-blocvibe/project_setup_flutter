/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:flutter/material.dart';
import 'package:base_project/app/core/values/app_colors.dart';

class StepperDot extends StatelessWidget {
  /// Default stepper dot
  const StepperDot({
    Key? key,
    required this.index,
    required this.totalLength,
    required this.activeIndex,
  }) : super(key: key);

  /// Index at which the item is present
  final int index;

  /// Total length of the list provided
  final int totalLength;

  /// Active index which needs to be highlighted and before that
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    final color = (index <= activeIndex) ? appColor : Colors.grey.shade300;
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
    );
  }
}
