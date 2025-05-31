import '../../export.dart';

Widget noResultFoundWidget(
    {String? message,
    String? imagePath,
    double? imageHeight,
    double? padding,
    TextStyle? textStyle}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AssetImageWidget(
          imagePath ?? "iconsIcEmptyList",
          imageHeight: imageHeight ?? height_50,
        ).paddingOnly(bottom: padding ?? margin_5),
        TextView(message ?? keyNoResultFound.tr,
                maxLines: 2,
                textStyle: textStyle ??
                    textStyleTitleMedium().copyWith(
                        color: lightGreyColor, fontWeight: FontWeight.normal))
            .marginSymmetric(horizontal: margin_30),
      ],
    ),
  );
}
