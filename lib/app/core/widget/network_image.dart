/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

 import 'package:shimmer/shimmer.dart';

import '../../export.dart';

class NetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? radiusAll;
  final double radiusTopRight;
  final double radiusTopLeft;
  final double radiusBottomRight;
  final double radiusBottomLeft;
  final double imageHeight;
  final double imageWidth;
  final BoxFit imageFitType;
  final color;
  final placeHolder;

  const NetworkImageWidget(
      {Key? key,
      required this.imageUrl,
      this.radiusAll,
      this.radiusTopLeft = 0.0,
      this.radiusBottomRight = 0.0,
      this.radiusBottomLeft = 0.0,
      this.radiusTopRight = 0.0,
      required this.imageHeight,
      required this.imageWidth,
      this.color,
      this.placeHolder,
      this.imageFitType = BoxFit.fill})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radiusAll == null
          ? BorderRadius.only(
              topRight: Radius.circular(radiusTopRight),
              topLeft: Radius.circular(radiusTopLeft),
              bottomLeft: Radius.circular(radiusBottomLeft),
              bottomRight: Radius.circular(radiusBottomRight))
          : BorderRadius.circular(radiusAll!),
      child: Image.network("$imageUrl",
          height: imageHeight,
          width: imageWidth,
          fit: imageFitType,
          errorBuilder: (context, error, stackTrace) => AssetImageWidget(
                placeHolder ?? "iconsIcPlaceholder",
                radiusAll: radiusAll,
                imageHeight: imageHeight,
                imageWidth: imageWidth,
                imageFitType: BoxFit.fill,
              ),
          // loadingBuilder: (context, child, loadingProgress) => Text(imageUrl)),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade400,
                  child: Container(
                      height: imageHeight,
                      width: imageWidth,
                      color: Colors.grey),
                ) ??
                Center(
                  child: CircularProgressIndicator(
                    color: appColor,
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
          }),
      /*FancyShimmerImage(
          height: imageHeight,
          width: imageWidth,
          boxFit: imageFitType,
          imageUrl: "$imageUrl",
          errorWidget: AssetImageWidget(
            placeHolder ?? iconsIcPlaceholder,
            radiusAll: radiusAll,
            imageHeight: imageHeight,
            imageWidth: imageWidth,
            imageFitType: BoxFit.fill,
          ),
        )*/
    );
  }
}
