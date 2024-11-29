import 'package:flutter/material.dart';

import '../../../components/shared/shared_dynamic_icon.dart';
import '../../../core/constants/constants.dart';

class BottomBarItem extends StatelessWidget {
  final dynamic icon;
  final String title;
  final bool selected;
  final Function() onTap;

  const BottomBarItem({super.key, required this.icon, required this.title, this.selected = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            SharedDynamicIcon(
              icon,
              weight: 500,
              color: selected ? Palette.primary : Palette.black4947,
              height: Sizes.s24,
            ),
            const Gap(Sizes.s8),
            Text(
              title,
              style: context.bodySmall.copyWith(color: selected ? Palette.primary : Palette.black4947),
            )
          ],
        ),
      ),
    );
  }
}
