import 'package:flutter/material.dart';
import 'package:home_ful/components/shared/shared_appbar.dart';
import 'package:home_ful/core/constants/constants.dart';

import '../../home/components/resource_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppbar(title: 'Back'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notifications',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 20, color: const Color(0xff040108))),
            const Gap(Sizes.s30),
            Text(
              'Most resent',
              style: context.displaySmall.copyWith(color: Palette.black),
            ),
            Gap(Sizes.s10),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (_, index) {
                      return ResourceCard(
                        cardColor: Colors.transparent,
                        title:
                            'A bed has just become available at Pathways home. Reserve your spot now before it\'s taken',
                        subTitle: '2 hours ago',
                        onTap: () {},
                        iconP: ImageAssets.helpCircle,
                      );
                    },
                    separatorBuilder: (_, index) {
                      return const Divider(
                        color: Palette.greyE7E7,
                      );
                    },
                    itemCount: 4)),
          ],
        ),
      ),
    );
  }
}
