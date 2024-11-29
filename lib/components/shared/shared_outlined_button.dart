import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';

class SharedOutlinedButton extends StatelessWidget {
  final Widget? child;
  final String title;
  final Function()? onPressed;
  final double marginHorizontal;
  final double paddingVeritical;
  final double paddingHorizontal;
  final double radius;
  final Color color;
  final Color? borderColor;
  final Color textColor;
  final double elevalion;
  final double? width;
  final double? height;
  final bool loading;
  final bool isDisabled;
  final Icon? icon;

  const SharedOutlinedButton({
    super.key,
    this.child,
    required this.onPressed,
    this.color = Palette.primary,
    this.textColor = Palette.primary,
    this.elevalion = 0,
    this.marginHorizontal = 0.0,
    this.paddingHorizontal = Sizes.s16,
    this.width,
    this.paddingVeritical = Sizes.s12,
    this.isDisabled = false,
    this.title = 'Next',
    this.radius = Sizes.s4,
    this.loading = false,
    this.height,
    this.borderColor = Palette.primary,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: marginHorizontal),
      child: SizedBox(
        width: width,
        child: OutlinedButton.icon(
          icon: icon ?? const SizedBox.shrink(),
          onPressed: isDisabled ? null : onPressed,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            minimumSize:
                width != null || height != null ? Size(width!, height!) : null,
            side: BorderSide(
              color: borderColor ?? color, // Border color
              width: Sizes.s1, // Border width
            ),
            padding: EdgeInsets.symmetric(
                vertical: paddingVeritical, horizontal: paddingHorizontal),
            foregroundColor: textColor,
            // Text and icon color
            elevation: elevalion,
          ),
          label: child ??
              (loading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Palette.primary,
                      ),
                    )
                  : Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: context.headlineSmall
                          .copyWith(fontSize: Sizes.s16, color: textColor),
                    )),
        ),
      ),
    );
  }
}
