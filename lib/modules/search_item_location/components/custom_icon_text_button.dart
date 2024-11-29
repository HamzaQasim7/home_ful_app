import 'package:flutter/material.dart';
import 'package:home_ful/core/config/theme.dart';
import 'package:home_ful/core/constants/constants.dart';

class SharedIconTextButton extends StatelessWidget {
  const SharedIconTextButton(
      {super.key,
      required this.icon,
      required this.title,
      required this.onPress});

  final Icon icon;
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: TextButton.styleFrom(),
        icon: icon,
        onPressed: onPress,
        label: Text(
          title,
          style: context.headlineSmall.copyWith(
              color: Palette.primary,
              fontSize: 12,
              fontWeight: FontWeight.w600),
        ));
  }
}
