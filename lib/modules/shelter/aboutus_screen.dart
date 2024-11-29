import 'package:flutter/material.dart';
import '../../components/shared/shared_appbar.dart';
import '../../core/constants/constants.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const SharedAppbar(title: "About Us"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: Sizes.s30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Our Mission", style: context.titleLarge),
              // const Gap(Sizes.s20),
              const Text(
                  "At FOODSTERS, our mission is to connect people in need with essential resources and support through a seamless and user-friendly platform. We are dedicated to bridging the gap between donors and those who need help, ensuring that everyone has access to the food, clothing, and services they require to thrive."),
              const Gap(Sizes.s20),
              Text("Who We Do", style: context.titleLarge),
              // const Gap(Sizes.s20),
              Text(
                "FOODSTERS is a comprehensive donation app designed to simplify the process of giving and receiving. Our platform allows individuals and organizations to:",
                style: context.bodySmall,
              ),
              const Gap(Sizes.s10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Find and Access Resources: Locate nearby food, clothing, and other essential items donated by local swap centers and organizations.",
                  "Make a Difference: Easily donate items or volunteer with organizations that are committed to supporting those in need.",
                  "Stay Informed: Access up-to-date information on available resources, pickup locations, and the impact of your contributions."
                ]
                    .map(
                      (e) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(Sizes.s10),
                          const Text("•"),
                          const Gap(Sizes.s10),
                          Expanded(
                            child: Text(
                              e,
                              style: context.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              const Gap(Sizes.s20),
              Text("Our Story", style: context.titleLarge),
              // const Gap(Sizes.s20),
              Text(
                "Founded in 2024 of a deep commitment to addressing the challenges faced by individuals and families struggling with food insecurity and homelessness. Inspired by the power of community and the desire to make a meaningful impact, we set out to develop a platform that makes it easier for people to connect and support one another.",
                style: context.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
