import 'package:flutter/material.dart';
import '../../../components/shared/shared_dynamic_icon.dart';
import '../../../core/constants/constants.dart';

class UserInfoWidget extends StatelessWidget {
  final String name;
  final String email;
  final Function() onEdit;
  const UserInfoWidget({
    super.key,
    required this.name,
    required this.email,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: Sizes.s60,
          width: Sizes.s60,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Palette.primary,
            shape: BoxShape.circle,
          ),
          child: const SharedDynamicIcon(
            SvgAssets.user,
            color: Palette.white,
            height: Sizes.s36,
          ),
        ),
        const Gap(Sizes.s10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: context.headlineSmall.copyWith(fontSize: Sizes.s16),
              ),
              Text(
                email,
              ),
            ],
          ),
        ),
        IconButton.filled(
            onPressed: onEdit,
            style: IconButton.styleFrom(
              backgroundColor: Palette.white,
              side: const BorderSide(color: Palette.primary),
            ),
            icon: const Icon(
              Symbols.person_edit,
              color: Palette.primary,
            ))
      ],
    );
  }
}
