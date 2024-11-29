import 'package:flutter/material.dart';
import 'package:home_ful/components/shared/shared_dynamic_icon.dart';
import 'package:home_ful/components/shared/shared_submit_button.dart';
import 'package:home_ful/core/constants/constants.dart';

import '../../components/shared/shared_appbar.dart';

class StandByScreen extends StatelessWidget {
  const StandByScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppbar(
        title: "Back",
        color: Palette.black2422,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SharedDynamicIcon(
              ImageAssets.standByBed,
              height: context.height * 0.25,
            ),
            Text(
              "All beds are currently full",
              style: context.headlineMedium
                  .copyWith(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // Subtitle text
            const Text(
              "You can join the standby list, and we'll notify you immediately if a bed becomes available",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            SharedSubmitButton(
              onPressed: () {},
              width: double.infinity,
              height: context.height * 0.06,
              title: 'Join Standby List',
            ),
            const Spacer(),
            const Text(
              "If you need urgent help, please call our helpline at",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),

            // Helpline number
            const Text(
              "(123) 456-7890",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.underline),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
