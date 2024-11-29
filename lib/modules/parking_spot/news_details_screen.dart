import 'package:flutter/material.dart';
import 'package:home_ful/components/shared/shared_appbar.dart';
import 'package:home_ful/components/shared/shared_dynamic_icon.dart';
import 'package:home_ful/core/constants/constants.dart';
import 'package:home_ful/modules/resources/components/heading_text_widget.dart';
import 'package:home_ful/modules/resources/components/sentence_text_widget.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppbar(
        title: 'Back',
        color: Palette.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'New Shelter Opens in Downtown: 50 Beds Available for Those in Need',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: const Color(0xff242222))),
              const SizedBox(height: 8),
              Text('BY NATHANIEL WEIXEL 02/8/24 06:10PM ET',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: const Color(0xff505050))),
              const SizedBox(height: 16),
              SharedDynamicIcon(
                ImageAssets.bed,
                fit: BoxFit.cover,
                width: double.infinity,
                height: context.height * 0.25,
              ),
              const SizedBox(height: 15),
              const SentenceTextWidget(
                  text:
                      'In response to the growing need for shelter and support for homeless individuals, a new shelter has officially opened its doors in the heart of downtown. This facility, which is part of a broader initiative to combat homelessness in the city, offers 50 beds for those in need, providing a much-needed resource for the local community.'),

              const SizedBox(height: 8),
              const HeadingTextWidget(
                  heading: 'A Safe and Supportive Environment'),

              const SizedBox(height: 4),
              const SentenceTextWidget(
                  text:
                      'The new shelter is designed to offer more than just a place to sleep. It is a comprehensive facility aimed at addressing the various needs of its residents. In addition to providing a warm bed, the shelter offers essential services, including:'),
              const SizedBox(height: 8),
              // Meals Bullet Point
              const BulletPointText(
                boldText: "Meals: ",
                normalText:
                    "Nutritious meals are served daily, ensuring that all residents have access to proper nutrition.",
              ),
              const SizedBox(height: 10),
              // Hygiene Facilities Bullet Point
              const BulletPointText(
                boldText: "Hygiene Facilities: ",
                normalText:
                    "The shelter is equipped with showers and laundry facilities, allowing residents to maintain their personal hygiene with dignity.",
              ),
              const SizedBox(height: 10),
              // Case Management Bullet Point
              const BulletPointText(
                boldText: "Case Management: ",
                normalText:
                    "On-site case managers are available to help residents navigate the resources available to them, from finding permanent housing to accessing healthcare and employment services.",
              ),

              const Gap(Sizes.s20)
            ],
          ),
        ),
      ),
    );
  }
}

class BulletPointText extends StatelessWidget {
  const BulletPointText(
      {super.key, required this.boldText, required this.normalText});
  final String boldText, normalText;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• ", style: TextStyle(fontSize: 18)),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: boldText,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: const Color(0xff040108)),
                ),
                TextSpan(
                    text: normalText,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xff505050))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
