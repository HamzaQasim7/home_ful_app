import 'package:flutter/material.dart';
import 'package:home_ful/components/shared/shared_appbar.dart';
import 'package:home_ful/core/constants/constants.dart';

import 'components/custom_card.dart';

class ParkingSpots extends StatelessWidget {
  const ParkingSpots({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppbar(
          color: Colors.black, title: 'Showing list of parking spots near you'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: Column(
          children: [
            const Gap(Sizes.s12),
            Expanded(
              child: ListView.separated(
                itemCount: 3,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return const CustomCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
