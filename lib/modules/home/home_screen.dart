import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';
import 'package:home_ful/modules/home/components/home_text_button_row.dart';
import 'package:home_ful/modules/home/components/item_card.dart';

import 'components/home_app_bar.dart';
import 'components/resource_card.dart';
import 'components/stories_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Utils.requestLocationPermission();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, context.height * 0.2),
        child: const HomeAppbar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('What do you need now?',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Palette.black2422,
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                      )),
              const Gap(Sizes.s20),
              HomeItemCard(
                path: ImageAssets.groupPeople,
                title: "I need immediate shelter",
                onPress: () {
                  Navigator.pushNamed(context, Routes.shelterItemView);
                },
              ),
              const Gap(Sizes.s20),
              HomeItemCard(
                path: ImageAssets.cars,
                title: "I need a place to park",
                onPress: () {
                  Navigator.pushNamed(context, Routes.parkingSlots);
                },
              ),
              const Gap(Sizes.s20),
              HomeItemCard(
                path: ImageAssets.notice,
                title: "I need help preventing \neviction",
                onPress: () {
                  Navigator.pushNamed(context, Routes.resourceFinancial);
                },
              ),
              const Gap(Sizes.s20),
              RowTextButton(
                  title: 'Top Stories',
                  buttonTitle: 'VIEW ALL',
                  onPress: () {
                    Navigator.pushNamed(context, Routes.newsScreen);
                  }),
              const Gap(Sizes.s20),
              SizedBox(
                height: 120,
                child: StoriesCard(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.newsScreen);
                    },
                    title: 'New Shelter Opens in Downtown: 50 Beds Available',
                    timeAgo: '1 week ago',
                    readTime: '3 min read',
                    imageAsset: ImageAssets.bed),
              ),
              const Gap(Sizes.s10),
              SizedBox(
                height: 120,
                child: StoriesCard(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.newsScreen);
                    },
                    title: 'City Launches Cold Weather Emergency Services',
                    timeAgo: '1 week ago',
                    readTime: '3 min read',
                    imageAsset: ImageAssets.loadedCar),
              ),
              const Divider(color: Palette.greyE7E7),
              RowTextButton(
                  title: 'General resources', buttonTitle: '', onPress: () {}),
              ResourceCard(
                title: 'Legal help',
                subTitle:
                    'Get free consultations on housing, benefits, and more.',
                onTap: () {
                  Navigator.pushNamed(context, Routes.legalHelp);
                },
                iconP: ImageAssets.helpCircle,
              ),
              ResourceCard(
                title: 'Safe use app',
                subTitle: 'Promoting Health Equity Through Harm Reduction',
                onTap: () {
                  Navigator.pushNamed(context, Routes.legalHelp);
                },
                iconP: ImageAssets.group,
              ),
              ResourceCard(
                title: 'Lacewatch app',
                subTitle:
                    'Help in identifying harmful drug which are near your location',
                onTap: () {
                  Navigator.pushNamed(context, Routes.legalHelp);
                },
                iconP: ImageAssets.drugs,
              ),
              const Gap(Sizes.s80),
            ],
          ),
        ),
      ),
    );
  }
}
