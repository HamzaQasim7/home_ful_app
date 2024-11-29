import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';

class StoriesCard extends StatelessWidget {
  final String title;
  final String timeAgo;
  final String readTime;
  final String imageAsset;
  final VoidCallback? onTap;

  const StoriesCard({
    super.key,
    required this.title,
    required this.timeAgo,
    required this.readTime,
    required this.imageAsset,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final maxHeight = constraints.maxHeight;
        final isPortrait = maxHeight > maxWidth;

        return GestureDetector(
          onTap: onTap,
          child: SizedBox(
            width: maxWidth,
            height: isPortrait ? maxHeight * 0.3 : maxHeight,
            // padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Colors.black,
                                  fontSize: maxWidth * 0.045,
                                ),
                      ),
                      const Gap(Sizes.s5),
                      Row(
                        children: [
                          Text(timeAgo,
                              style: Theme.of(context).textTheme.bodySmall),
                          const SizedBox(width: 10),
                          const CircleAvatar(radius: 5),
                          const SizedBox(width: 10),
                          Text(readTime,
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                      const Gap(Sizes.s10),
                      Text(
                        'Suggested for you',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                const Gap(Sizes.s10),
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imageAsset,
                      fit: BoxFit.cover,
                      width: 101,
                      height: 87,
                      // height: isPortrait ? maxHeight * 0.1 : maxHeight * 0.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
