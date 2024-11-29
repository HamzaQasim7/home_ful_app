import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';
import 'package:home_ful/modules/general_resource/legal_help.dart';
import 'package:home_ful/modules/resources/components/heading_text_widget.dart';
import 'package:home_ful/modules/resources/components/sentence_text_widget.dart';

import '../../../components/shared/shared_appbar.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SharedAppbar(color: Palette.black, title: 'Back'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeadingTextWidget(heading: 'Welcome to Homeless app'),
              Gap(Sizes.s8),
              SentenceTextWidget(
                  text:
                      'At Homeless , our mission is to empower individuals with the tools and knowledge they need to make informed decisions about substance use. We are committed to reducing harm and saving lives through innovative drug testing and identification solutions.'),
              SizedBox(height: 16),
              HeadingTextWidget(heading: 'Who We Are'),
              SizedBox(height: 8),
              SentenceTextWidget(
                  text:
                      'Homeless was founded by a team of passionate health professionals, technologists, and advocates who recognized the growing need for reliable and accessible drug testing methods. With diverse backgrounds in medicine, technology, and public health, we are united by a shared goal: to make drug use safer and to educate our community about the potential dangers of laced substances.'),
              SizedBox(height: 8),
              HeadingTextWidget(heading: 'What We Do'),
              SizedBox(height: 4),
              SentenceTextWidget(
                  text:
                      'Homeless provides a comprehensive drug testing and identification app designed to help users verify the contents of their substances. Our app offers:'),
              SizedBox(height: 8),
              BulletRow(
                  title:
                      '''Instant Testing Results: Users can quickly and accurately test their substances for common adulterants and contaminants using our state-of-the-art test kits.'),BulletRow(title: 'Instant Testing Results: Users can quickly and accurately test their substances for common adulterants and contaminants using our state-of-the-art test kits.'),BulletRow(title: 'Instant Testing Results: Users can quickly and accurately test their substances for common adulterants and contaminants using our state-of-the-art test kits.'''),
              SizedBox(height: 4),
              BulletRow(
                  title:
                      '''Substance Identification: Utilizing advanced technology, our app can identify various drugs and their purity levels, giving users peace of mind about what they are consuming.'''),
              SizedBox(height: 4),
              BulletRow(
                  title:
                      '''Educational Resources: SafeCheck provides a wealth of information on the risks of laced drugs, safe use practices, and harm reduction strategies to help our users make informed decisions.'''),
              SizedBox(height: 4),
              BulletRow(
                  title:
                      '''Community Support: We believe in the power of community. Our app connects users to local support services, addiction treatment centers, and peer support networks.'''),
              SizedBox(height: 8),
              HeadingTextWidget(heading: 'Our vision'),
              SentenceTextWidget(
                  text:
                      'We envision a world where everyone has the tools and knowledge to ensure their safety. By making drug testing and identification accessible to all, we aim to reduce the harm associated with substance use and prevent unnecessary tragedies. Our Commitment to Quality and Privacy.'),
              Gap(Sizes.s10),
            ],
          ),
        ),
      ),
    );
  }
}
