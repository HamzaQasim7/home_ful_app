import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';

import '../../../components/shared/shared_dynamic_icon.dart';

class UserProfileAvatar extends StatelessWidget {
  final String imageUrl;

  const UserProfileAvatar({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: SharedDynamicIcon(
              imageUrl,
              fit: BoxFit.cover,
              width: 55,
              height: 55,
            ),
          ),
        ),
        // Edit Button
        const Positioned(
          bottom: -5,
          right: -5,
          child: SizedBox(
            width: 26,
            height: 26,
            child: InkWell(
              child: SharedDynamicIcon(SvgAssets.cameraIcon),
            ),
          ),
        ),
      ],
    );
  }
}
