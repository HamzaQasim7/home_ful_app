import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class SettingsItem extends StatelessWidget {
  final Function() onTap;
  final String title;
  // final dynamic icon;
  final Color? color;

  final bool logout;

  const SettingsItem({
    super.key,
    required this.onTap,
    required this.title,
    this.logout = false,
    this.color = Palette.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: Sizes.s16),
      child: InkWell(
        focusColor: Palette.primary.withOpacity(0.5),
        onTap: onTap,
        // borderRadius: BorderRadius.circular(Sizes.s12),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            title,
            style: context.titleLarge.copyWith(
                fontWeight: FontWeight.w600,
                color: Palette.black,
                fontSize: 12),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 20,
            color: Palette.infoGrey,
          ),
        ]),
      ),
    );
  }
}
