import 'package:flutter/material.dart';
import 'package:home_ful/components/shared/shared_appbar.dart';
import 'package:home_ful/components/shared/shared_dynamic_icon.dart';
import 'package:home_ful/core/constants/constants.dart';

class ShelterItem extends StatelessWidget {
  final String title;
  final String address;
  final int bedsAvailable;
  final String imageUrl;

  const ShelterItem({
    super.key,
    required this.title,
    required this.address,
    required this.bedsAvailable,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.shelterDetail),
      child: Container(
        decoration: BoxDecoration(
          color: Palette.white,
          border: Border.all(color: Palette.greyF1F1),
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: SharedDynamicIcon(imageUrl,
                  height: context.height * 0.25, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    address,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const SharedDynamicIcon(ImageAssets.tablerBed,
                          width: Sizes.s20,
                          height: Sizes.s20,
                          color: Palette.primary),
                      const SizedBox(width: 4),
                      Text('$bedsAvailable beds available'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShelterItemViews extends StatelessWidget {
  ShelterItemViews({super.key});

  final List<Map<String, dynamic>> shelters = [
    {
      'title': 'Pathways of Home',
      'address': '909-1/2 E 49th St Los Angeles, California (CA)',
      'bedsAvailable': 5,
      'imageUrl': ImageAssets.building,
    },
    {
      'title': 'Safe Haven Shelter',
      'address': '1234 Elm St, San Francisco, California (CA)',
      'bedsAvailable': 10,
      'imageUrl': ImageAssets.building2,
    },
    {
      'title': 'Hope House',
      'address': '5678 Oak St, Seattle, Washington (WA)',
      'bedsAvailable': 3,
      'imageUrl': ImageAssets.building,
    },
    {
      'title': 'New Horizons Shelter',
      'address': '91011 Pine St, New York, New York (NY)',
      'bedsAvailable': 8,
      'imageUrl': ImageAssets.building2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const SharedAppbar(title: 'Shelters near you', color: Palette.black),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: shelters.length,
        itemBuilder: (context, index) {
          final shelter = shelters[index];
          return ShelterItem(
            title: shelter['title'] as String,
            address: shelter['address'] as String,
            bedsAvailable: shelter['bedsAvailable'] as int,
            imageUrl: shelter['imageUrl'] as String,
          );
        },
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final Widget icon;
  final String text;

  const InfoRow({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.w400),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
