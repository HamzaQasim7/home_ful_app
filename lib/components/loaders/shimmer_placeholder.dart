import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceHolder extends StatelessWidget {
  final double height;
  final double? width;

  const ShimmerPlaceHolder({super.key, this.height = Sizes.s16, this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Palette.greyEEE,
      highlightColor: Palette.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.s8),
        child: Container(
          color: Colors.grey,
          height: height,
          width: width ?? context.width,
        ),
      ),
    );
  }
}
