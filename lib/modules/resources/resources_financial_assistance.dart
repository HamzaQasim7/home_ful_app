import 'package:flutter/material.dart';
import 'package:home_ful/components/shared/shared_appbar.dart';
import 'package:home_ful/core/constants/constants.dart';

import '../../components/shared/shared_submit_button.dart';
import 'components/heading_text_widget.dart';
import 'components/sentence_text_widget.dart';

class ResourcesFinancialAssistance extends StatelessWidget {
  const ResourcesFinancialAssistance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const SharedAppbar(
      //     color: Palette.black,
      //     title: ''),
      body: const Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Sizes.s20, vertical: Sizes.s20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeadingTextWidget(heading: 'Introduction'),
              SizedBox(height: 8),
              SentenceTextWidget(
                  text:
                      'If you are at risk of eviction, there are resources available to help you stay in your home. Explore the financial assistance options below to find support tailored to your needs'),
              SizedBox(height: 16),
              HeadingTextWidget(
                  heading: 'Emergency Financial Assistance Programs'),
              SizedBox(height: 8),
              SentenceTextWidget(
                  text:
                      'These programs provide immediate financial aid to help cover rent and utility bills, preventing eviction due to non-payment.'),
              SizedBox(height: 8),
              HeadingTextWidget(
                  heading: '1. Emergency Rental Assistance Program (ERAP)'),
              SizedBox(height: 4),
              SentenceTextWidget(
                  text:
                      'Provides direct financial assistance for rent, utilities, and other housing-related expenses.'),
              SizedBox(height: 8),
              HeadingTextWidget(heading: '2. Local Government Assistance'),
              SizedBox(height: 4),
              SentenceTextWidget(
                  text:
                      'Check with your local housing authority for city-specific eviction prevention programs.'),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              HeadingTextWidget(heading: 'Non-Profit Organizations:'),
              SizedBox(height: 8),
              SentenceTextWidget(
                  text:
                      'Non-profit organizations offer financial aid, legal support, and advocacy for tenants facing eviction.'),
              SizedBox(height: 8),
              HeadingTextWidget(heading: '1. Catholic Charities USA'),
              SizedBox(height: 4),
              SentenceTextWidget(
                  text:
                      'Offers emergency financial assistance to help cover rent and prevent eviction.'),
              SizedBox(height: 8),
              HeadingTextWidget(heading: '2. Salvation Army'),
              SizedBox(height: 4),
              SentenceTextWidget(
                  text:
                      'Provides rental assistance and financial counseling for families in need.'),
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
            const Gap(Sizes.s10),
            Expanded(
              child: SharedSubmitButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.newsDetailScreen);
                },
                title: "Helpline number",
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
