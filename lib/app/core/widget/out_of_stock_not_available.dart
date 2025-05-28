import '../../export.dart';

Container outOfStockWidget() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: margin_2, vertical: margin_3),
    decoration: BoxDecoration(
        color: appColor, borderRadius: BorderRadius.circular(radius_5)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.dangerous,
          size: height_15,
          color: Colors.white,
        ).paddingOnly(right: margin_5, left: margin_2),
        Flexible(
          child: TextView(keyOutOfStock.tr,
                  textStyle: textStyleHeadlineMedium()
                      .copyWith(color: Colors.white, fontSize: font_13))
              .paddingOnly(right: margin_5),
        )
      ],
    ),
  );
}
