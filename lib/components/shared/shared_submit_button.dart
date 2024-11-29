import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';

class SharedSubmitButton extends StatelessWidget {
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
  const SharedSubmitButton({
    super.key,
    this.child,
    required this.onPressed,
    this.color = Palette.primary,
    this.textColor = Palette.white,
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
    this.borderColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: marginHorizontal),
      child: SizedBox(
        width: width,
        child: ElevatedButton.icon(
          icon: icon,
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            minimumSize:
                width != null || height != null ? Size(width!, height!) : null,
            side: BorderSide(
              color: borderColor ?? color, // Border color
              width: Sizes.s1, // Border width
            ),
            backgroundColor: isDisabled ? Palette.greyd9d9d9 : color,
            elevation: elevalion,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.symmetric(
                vertical: paddingVeritical, horizontal: paddingHorizontal),
            foregroundColor: !isDisabled ? textColor : Palette.white,
            textStyle: context.bodyMedium.copyWith(color: textColor),
          ),
          label: child ??
              (loading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Palette.white,
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
