import 'package:shimmer/shimmer.dart';

import '../../export.dart';

extension ShimmerEffect on Widget {
  // Apply shimmer effect to any widget
  Widget withShimmer({required bool isLoading}) {
    return isLoading
        ? Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: this,
          )
        : this;
  }
}
