import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';
import 'package:home_ful/modules/resources/components/heading_text_widget.dart';
import 'package:home_ful/modules/resources/components/sentence_text_widget.dart';

import '../../components/shared/shared_appbar.dart';
import '../../components/shared/shared_submit_button.dart';

class LegalHelp extends StatelessWidget {
  const LegalHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SharedAppbar(
            color: Palette.black, title: 'Legal Help for Eviction'),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.s20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HeadingTextWidget(heading: 'Introduction'),
                SizedBox(height: 8),
                SentenceTextWidget(
                    text:
                        'If you are facing eviction, there are legal resources available to help you understand your rights and fight to stay in your home. Explore the options below to find the support you need.'),
                SizedBox(height: 16),
                HeadingTextWidget(heading: 'Free Legal Representation:'),
                SizedBox(height: 8),
                SentenceTextWidget(
                    text:
                        'Access free or low-cost legal representation through local legal aid organizations. These services are available to help you challenge eviction notices, negotiate with landlords, and understand your rights as a tenant'),
                SizedBox(height: 8),
                HeadingTextWidget(heading: '1. Legal Aid Societies'),
                SizedBox(height: 4),
                SentenceTextWidget(
                    text:
                        'Non-profit organizations providing free legal representation to low-income individuals facing eviction.'),
                SizedBox(height: 8),
                HeadingTextWidget(heading: '2. Tenant Law Centers'),
                SizedBox(height: 4),
                SentenceTextWidget(
                    text:
                        'Specialized centers that focus on tenant rights and eviction prevention'),
                SizedBox(height: 16),
                Divider(),
                SizedBox(height: 16),
                HeadingTextWidget(heading: 'Tenant Rights Education:'),
                SizedBox(height: 8),
                SentenceTextWidget(
                    text:
                        'Learn about your rights as a tenant, including the proper legal procedures for eviction, and what your landlord can and cannot do'),
                SizedBox(height: 8),
                HeadingTextWidget(heading: '1. Workshops and Seminars'),
                SizedBox(height: 4),
                SentenceTextWidget(
                    text:
                        'Attend workshops that teach you how to navigate the eviction process and protect your rights.'),
                SizedBox(height: 8),
                HeadingTextWidget(heading: '2. Online Resources'),
                SizedBox(height: 4),
                SentenceTextWidget(
                    text:
                        'Access online guides and videos explaining tenant rights and common eviction defenses'),
                Gap(Sizes.s20),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Palette.primary),
                      fixedSize: const Size(double.infinity, Sizes.s54),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.newsScreen);
                  },
                  child: Text(
                    ' Eviction Hotline',
                    style: context.displaySmall
                        .copyWith(fontSize: 14, color: Palette.primary),
                  ),
                ),
              ),
              const SizedBox(width: Sizes.s10),
              Expanded(
                child: SharedSubmitButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.about);
                  },
                  title: "Helpline number",
                  width: double.infinity,
                  height: Sizes.s54,
                ),
              ),
            ],
          ),
        ));
  }
}

class BulletRow extends StatelessWidget {
  const BulletRow({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('• ', style: TextStyle(fontSize: 16)),
        const SizedBox(width: 5),
        Expanded(
          child: Text(title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: const Color(0xff505050))),
        )
      ],
    );
  }
}
