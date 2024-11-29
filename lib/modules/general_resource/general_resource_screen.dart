import 'package:flutter/material.dart';
import 'package:home_ful/components/shared/shared_dynamic_icon.dart';
import 'package:home_ful/core/constants/constants.dart';

class GeneralResourceScreen extends StatelessWidget {
  GeneralResourceScreen({super.key});

  final List<ResourceItem> resourceItems = [
    ResourceItem(
      title: 'Get legal help',
      description: 'Get free consultations on housing, benefits, and more.',
      icon: SvgAssets.helpCircle,
      route: Routes.legalHelp,
    ),
    ResourceItem(
      title: 'Safe use app',
      description: 'Promoting Health Equity Through Harm Reduction',
      icon: SvgAssets.drugs,
      route: Routes.orgItemsDetail,
    ),
    ResourceItem(
      title: 'Access healthcare',
      description:
          'Help in identifying harmful drug which are near your location',
      icon: SvgAssets.laceWatch,
      route: Routes.orgItemsDetail,
    ),
    ResourceItem(
      title: 'Lacewatch app',
      description:
          'Find essential items like food, kitchen supplies, and clothing',
      icon: SvgAssets.foodster,
      route: Routes.orgItemsDetail,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('General Resources')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 16,
          childAspectRatio: 0.57,
        ),
        itemCount: resourceItems.length,
        itemBuilder: (context, index) {
          return ResourceCard(item: resourceItems[index]);
        },
      ),
    );
  }
}

class ResourceItem {
  final String title;
  final String description;
  final String icon;
  final String route;

  ResourceItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.route,
  });
}

class ResourceCard extends StatelessWidget {
  final ResourceItem item;

  const ResourceCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, item.route),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SharedDynamicIcon(
                    item.icon,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, item.route),
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Learn more'),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
