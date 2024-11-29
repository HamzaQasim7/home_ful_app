import 'package:flutter/material.dart';
import 'package:home_ful/components/shared/shared_dynamic_icon.dart';
import 'package:home_ful/core/constants/constants.dart';

class ResourceCard extends StatelessWidget {
  const ResourceCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
    required this.iconP,
    this.cardColor,
  });

  final String title, subTitle;
  final void Function() onTap;
  final String iconP;
  final Color? cardColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 0,
      color: cardColor ?? Palette.white,
      child: ListTile(
        onTap: onTap,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: SharedDynamicIcon(iconP),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
        ),
        subtitle: Text(subTitle, style: Theme.of(context).textTheme.bodySmall),
      ),
    );
  }
}
