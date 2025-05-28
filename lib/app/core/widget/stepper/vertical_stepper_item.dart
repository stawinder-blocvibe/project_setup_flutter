/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:base_project/app/export.dart';

class VerticalStepperItem extends StatelessWidget {
  /// Stepper Item to show vertical stepper
  const VerticalStepperItem(
      {Key? key,
      required this.item,
      required this.index,
      required this.totalLength,
      required this.gap,
      required this.activeIndex,
      required this.subtitleColor,
      required this.isInverted,
      required this.activeBarColor,
      required this.inActiveBarColor,
      required this.barWidth,
      required this.iconHeight,
      required this.iconWidth})
      : super(key: key);

  /// Stepper item of type [StepperData] to inflate stepper with data
  final StepperDataModel item;

  /// Index at which the item is present
  final int index;

  /// Total length of the list provided
  final int totalLength;

  /// Active index which needs to be highlighted and before that
  final int activeIndex;
  final Color? subtitleColor;

  /// Gap between the items in the stepper
  final double gap;

  /// Inverts the stepper with text that is being used
  final bool isInverted;

  /// Bar color for active step
  final Color activeBarColor;

  /// Bar color for inactive step
  final Color inActiveBarColor;

  /// Bar width/thickness
  final double barWidth;

  /// Height of [StepperData.iconWidget]
  final double iconHeight;

  /// Width of [StepperData.iconWidget]
  final double iconWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: isInverted ? getInvertedChildren() : getChildren(),
    );
  }

  List<Widget> getChildren() {
    return [
      Container(
        width: width_90,
        child: Column(
          children: [
            TextView(item.date?.text ?? '',
                maxLines: 1,
                textStyle:
                    textStyleBodyMedium().copyWith(color: greyTextColor)),
            TextView(item.time?.text ?? '',
                maxLines: 1,
                textStyle:
                    textStyleBodyMedium().copyWith(color: greyTextColor)),
          ],
        ).marginOnly(top: margin_15, right: margin_10),
      ),
      Column(
        children: [
          Container(
            color: index == 0
                ? Colors.transparent
                : (index <= activeIndex ? activeBarColor : inActiveBarColor),
            width: barWidth,
            height: gap,
          ),
          DotProvider(
            activeIndex: activeIndex,
            index: index,
            item: item,
            totalLength: totalLength,
            iconHeight: iconHeight,
            iconWidth: iconWidth,
          ),
          Container(
            color: item.stepId == orderStateCancelled ||
                    item.stepId ==
                        orderStateDelivered // to hide the bar after these states
                ? Colors.transparent
                : (index < activeIndex ? activeBarColor : inActiveBarColor),
            width: barWidth,
            height: gap,
          ),
        ],
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Row(
          crossAxisAlignment: isInverted
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.center,
          children: [
            if (item.title != null) ...[
              Text(
                item.title!.text,
                textAlign: TextAlign.start,
                style: item.title!.textStyle ??
                    textStyleBodyMedium().copyWith(
                      color: greyTextColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
            if (item.subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                item.subtitle!.text,
                textAlign: TextAlign.start,
                style: item.subtitle!.textStyle ??
                    TextStyle(
                      fontSize: 12,
                      color: subtitleColor ?? Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ],
        ),
      ),
    ];
  }

  List<Widget> getInvertedChildren() {
    return getChildren().reversed.toList();
  }
}
