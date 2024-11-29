import 'package:flutter/material.dart';

import '../../../components/shared/shared_dynamic_icon.dart';
import '../../../core/constants/assets.dart';
import '../../../core/constants/gap.dart';
import '../../../core/constants/sizes.dart';

class SharedTitleRow extends StatelessWidget {
  final String text;
  final Widget? leading;
  const SharedTitleRow({
    super.key,
    required this.text,
    this.leading = const SharedDynamicIcon(SvgAssets.x,
        width: Sizes.s24, height: Sizes.s24),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: leading,
        ),
        const Gap(Sizes.s50),
        Text(
          text,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
