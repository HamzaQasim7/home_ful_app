import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';
import 'package:home_ful/modules/News/components/read_time_row.dart';
import 'package:home_ful/modules/resources/components/heading_text_widget.dart';

import '../../components/shared/shared_appbar.dart';
import '../../components/shared/shared_dynamic_icon.dart';
import '../home/components/stories_card.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppbar(
        title: "News from the city",
        color: Palette.black2422,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(Sizes.s10),
              const HeadingTextWidget(heading: 'Top stories'),
              const Gap(Sizes.s10),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(3),
                  topRight: Radius.circular(3),
                ),
                child: SharedDynamicIcon(
                  ImageAssets.building,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: context.height * 0.25,
                ),
              ),
              SharedDynamicIcon(
                SvgAssets.nyt,
                fit: BoxFit.cover,
                width: double.infinity,
                height: context.height * 0.04,
              ),
              const Gap(Sizes.s10),
              Text(
                'From housing rights to legal documentation, get the support you need to navigate',
                style: context.headlineMedium
                    .copyWith(color: Palette.black, fontSize: 20),
              ),
              const Gap(Sizes.s4),
              const ReadTimeRow(timeAgo: '4h ago', readTime: '3 min read'),
              const Divider(color: Palette.greyE7E7),
              const Gap(Sizes.s10),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.newsDetailScreen),
                child: const SizedBox(
                  height: 120,
                  child: StoriesCard(
                      title: 'City Launches Cold Weather Emergency Services',
                      timeAgo: '1 week ago',
                      readTime: '3 min read',
                      imageAsset: ImageAssets.loadedCar),
                ),
              ),
              const SizedBox(
                height: 120,
                child: StoriesCard(
                    title: 'City Launches Cold Weather Emergency Services',
                    timeAgo: '1 week ago',
                    readTime: '3 min read',
                    imageAsset: ImageAssets.loadedCar),
              ),
              const SizedBox(
                height: 120,
                child: StoriesCard(
                    title: 'City Launches Cold Weather Emergency Services',
                    timeAgo: '1 week ago',
                    readTime: '3 min read',
                    imageAsset: ImageAssets.loadedCar),
              ),
              const Gap(Sizes.s14),
            ],
          ),
        ),
      ),
    );
  }
}
