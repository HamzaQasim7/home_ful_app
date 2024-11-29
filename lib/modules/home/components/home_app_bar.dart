import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import 'notification_bell_icon.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(Sizes.s20),
            SizedBox(
              height: Sizes.s30,
              child: Row(
                children: [
                  const Icon(
                    Symbols.location_on,
                    color: Palette.primary,
                    size: Sizes.s20,
                  ),
                  const Gap(Sizes.s4),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.searchLocation),
                    child: Text(
                      "909-1/2 E 49th",
                      style: context.headlineSmall.copyWith(
                        fontSize: Sizes.s14,
                        color: Palette.black2422,
                      ),
                    ),
                  ),
                  const Gap(Sizes.s4),
                  const Icon(
                    Symbols.keyboard_arrow_down,
                    color: Palette.black2422,
                    size: Sizes.s20,
                  ),
                  const Spacer(),
                  const NotificationBell()
                ],
              ),
            ),
            const Gap(Sizes.s10),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: Color(0xff6b6b6b),
                  ),
                  hintText: "Search for shelters ..",
                  hintStyle:
                      context.bodySmall.copyWith(color: Palette.grey5050)),
            ),
            const Gap(Sizes.s20),
          ],
        ),
      ),
    );
  }
}
