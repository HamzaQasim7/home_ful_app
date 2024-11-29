import 'package:flutter/material.dart';
import 'package:home_ful/components/shared/shared_dynamic_icon.dart';
import 'package:home_ful/core/constants/constants.dart';
import 'package:home_ful/modules/shelter/shelter_item_detail.dart';
import 'package:home_ful/modules/shelter/shelter_item_screen.dart';

import '../../components/shared/shared_appbar.dart';
import '../parking_spot/parking_spots.dart';

class BunkBedScreen extends StatelessWidget {
  const BunkBedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppbar(
        title: "Back",
        color: Palette.black2422,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SharedDynamicIcon(
              ImageAssets.bunkBed,
              height: context.height * 0.25,
            ),
            Text(
              "Your reservation is confirmed!",
              style: context.headlineMedium
                  .copyWith(fontSize: 20, color: Palette.black),
              textAlign: TextAlign.center,
            ),
            const Gap(Sizes.s40),
            Container(
              width: context.width,
              height: context.height * 0.35,
              decoration: const BoxDecoration(
                color: Palette.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8),
                    child: ListTile(
                      leading: const SharedDynamicIcon(
                        fit: BoxFit.cover,
                        ImageAssets.building,
                        width: Sizes.s100 + 10,
                        height: Sizes.s60,
                      ),
                      title: Text(
                        'Pathways of home',
                        style: context.titleSmall,
                      ),
                      subtitle: InfoRow(
                          icon: Image.asset(ImageAssets.tablerBed),
                          text: '28th Aug , 2024'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: InfoRow(
                        icon: Image.asset(
                          ImageAssets.tablerBed,
                          width: 20,
                          height: 20,
                        ),
                        text: '2 beds'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: InfoRow(
                        icon: Image.asset(
                          ImageAssets.user,
                          width: 20,
                          height: 20,
                        ),
                        text: '2 adults'),
                  ),
                  const Divider(color: Palette.greyE7E7),
                  const BunkBedActionButton(),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class BunkBedActionButton extends StatelessWidget {
  const BunkBedActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionButtons(
        buttons: [
          ActionButtonData(
            icon: Icons.phone,
            label: 'Call',
            color: Palette.primary,
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (_) => const ParkingSpots()));
            },
          ),
          ActionButtonData(
            icon: Icons.chat_bubble_outline,
            label: 'Message',
            color: Palette.primary,
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (_) => const ParkingSpots()));
              print('Message button pressed');
            },
          ),
          ActionButtonData(
            icon: Icons.place_outlined,
            label: 'View on map',
            color: Palette.primary,
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (_) => const ParkingSpots()));
              print('View on map button pressed');
            },
          ),
        ],
      ),
    );
  }
}
