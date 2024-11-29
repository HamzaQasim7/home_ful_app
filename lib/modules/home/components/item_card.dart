import 'package:flutter/material.dart';
import 'package:home_ful/components/shared/shared_dynamic_icon.dart';
import 'package:home_ful/core/constants/constants.dart';

import 'avatar_navigator_widget.dart';

class HomeItemCard extends StatelessWidget {
  const HomeItemCard(
      {super.key, this.path, required this.title, required this.onPress});
  final dynamic path;
  final String title;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress,
      child: Container(
        decoration: BoxDecoration(
          color: Palette.white,
          border: Border.all(color: Palette.greyF1F1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(3),
                topRight: Radius.circular(3),
              ),
              child: SharedDynamicIcon(
                path,
                fit: BoxFit.cover,
                width: double.infinity,
                height: context.height * 0.2,
              ),
            ),
            const Gap(Sizes.s16),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Palette.black2422,
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  AvatarNavigator(
                    onPress: onPress,
                    bgColor: const Color(0xffE7E7E7),
                    icon: Icons.arrow_forward_rounded,
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
