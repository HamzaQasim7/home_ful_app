import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';

class SharedAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onLeading;
  final String? desc;
  final Color backgroundColor;
  final Color? color;
  final bool? centerTitle;
  final List<Widget>? action;

  const SharedAppbar(
      {super.key,
      required this.title,
      this.onLeading,
      this.desc,
      this.backgroundColor = Palette.homeBackground,
      this.color,
      this.centerTitle = false,
      this.action});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,
      centerTitle: centerTitle,
      titleSpacing: Sizes.s0,
      elevation: 0,
      leading: IconButton(
        onPressed: onLeading ?? () => Navigator.pop(context),
        icon: Icon(
          Symbols.arrow_back_ios_new,
          weight: 600,
          size: Sizes.s20,
          color: color ?? Palette.primary,
        ),
      ),
      title: desc == null
          ? Text(
              title,
              style: context.titleLarge.copyWith(
                  color: color ?? Palette.primary, fontSize: Sizes.s20),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.displaySmall,
                ),
                const Gap(Sizes.s8),
                Text(
                  desc ?? "",
                  style: context.bodySmall
                      .copyWith(color: color ?? Palette.primary),
                ),
              ],
            ),
      actions: action,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, Sizes.s60);
}
