import 'package:flutter/material.dart';
import 'package:home_ful/components/shared/shared_appbar.dart';
import 'package:home_ful/core/constants/constants.dart';
import 'package:home_ful/modules/shelter/shelter_item_screen.dart';

import '../../components/shared/shared_dynamic_icon.dart';
import '../../components/shared/shared_submit_button.dart';

class ShelterDetailScreen extends StatelessWidget {
  const ShelterDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppbar(
        title: "Back",
        color: Palette.black2422,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(Sizes.s10),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(3),
                  topRight: Radius.circular(3),
                ),
                child: SharedDynamicIcon(
                  ImageAssets.groupPeople,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: context.height * 0.25,
                ),
              ),
              const Gap(Sizes.s20),
              Text(
                'Pathways of home',
                style: context.headlineMedium
                    .copyWith(color: Palette.black, fontSize: 20),
              ),
              const Gap(Sizes.s4),
              Text(
                'Pathway is dedicated to providing a safe and welcoming environment for individuals and families in need.',
                style: context.bodySmall.copyWith(color: Palette.black4947),
              ),
              const Gap(Sizes.s10),
              const InfoRow(
                  icon: Image(image: AssetImage(ImageAssets.mapPin)),
                  text: '909-1/2 E 49th St Los Angeles,California(CA)'),
              const Gap(Sizes.s8),
              const StatusRow(),
              const Gap(Sizes.s14),
              const Divider(color: Palette.greyE7E7),
              ListTile(
                leading: Container(
                  width: Sizes.s50,
                  height: Sizes.s50,
                  decoration: BoxDecoration(
                      color: Palette.greyEFD,
                      borderRadius: BorderRadius.circular(8)),
                  child: Image.asset(
                    ImageAssets.tablerBed,
                    color: Palette.primary,
                  ),
                ),
                title: Text(
                  'Available Beds 5',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Palette.black, fontSize: 16),
                ),
                subtitle: const Text('95% occupancy rate from last 7 days'),
              ),
              const Divider(color: Palette.greyE7E7),
              const Gap(Sizes.s14),
              const ShelterInfoCard(),
              const Divider(color: Palette.greyE7E7),
              const ActionButtonCollection(),
              const Gap(Sizes.s14),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Sizes.s14),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    fixedSize: const Size(
                      double.infinity,
                      Sizes.s54,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.standBy);
                },
                child: const Text('Standby list'),
              ),
            ),
            const SizedBox(width: Sizes.s10),
            Expanded(
              child: SharedSubmitButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.emailScreen);
                },
                title: "Reserve now",
                width: double.infinity,
                height: Sizes.s54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShelterInfoCard extends StatelessWidget {
  const ShelterInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Amenities',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildBulletPoint(
            'Meals: Breakfast, Lunch, and Dinner provided daily.'),
        _buildBulletPoint('Showers: Hot showers available.'),
        _buildBulletPoint(
            'Medical Assistance: On-site nurse available for basic medical needs.'),
        const SizedBox(height: 16),
        const Text(
          'Shelter Rules',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildBulletPoint('Curfew: All guests must check in by 8:00 PM.'),
        _buildBulletPoint(
            'Substance Use: No drugs or alcohol allowed on the premises.'),
        _buildBulletPoint(
            'Check-Out: Guests must vacate the premises by 9:00 AM unless participating in extended programs.'),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class StatusRow extends StatelessWidget {
  const StatusRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Icon
        Icon(
          Icons.access_time_rounded,
          color: Colors.grey,
        ),
        SizedBox(width: 8),
        Text(
          'Closed ',
          maxLines: 2,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Dot separator
        Text('· ', style: TextStyle(color: Colors.grey)),

        // Additional text
        Text(
          'Opens 6:00pm - 10:00pm Mon - Fri',
          maxLines: 2,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class ActionButtonData {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  ActionButtonData({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });
}

class ActionButtons extends StatelessWidget {
  final List<ActionButtonData> buttons;

  const ActionButtons({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.map((button) {
        return _buildActionButton(button);
      }).toList(),
    );
  }

  Widget _buildActionButton(ActionButtonData button) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(button.icon, color: button.color),
          onPressed: button.onPressed,
        ),
        Text(
          button.label,
          style: TextStyle(color: button.color, fontSize: 12),
        ),
      ],
    );
  }
}

class ActionButtonCollection extends StatelessWidget {
  const ActionButtonCollection({super.key});

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
              print('Call button pressed');
            },
          ),
          ActionButtonData(
            icon: Icons.chat_bubble_outline,
            label: 'Message',
            color: Palette.primary,
            onPressed: () {
              print('Message button pressed');
            },
          ),
          ActionButtonData(
            icon: Icons.place_outlined,
            label: 'View on map',
            color: Palette.primary,
            onPressed: () {
              print('View on map button pressed');
            },
          ),
          ActionButtonData(
            icon: Icons.share,
            label: 'Share',
            color: Palette.primary,
            onPressed: () {
              print('Share button pressed');
            },
          ),
        ],
      ),
    );
  }
}
