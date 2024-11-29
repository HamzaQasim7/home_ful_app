import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';

import '../../components/shared/shared_appbar.dart';
import '../../components/shared/shared_dynamic_icon.dart';
import '../../components/shared/shared_submit_button.dart';
import '../../components/shared_alert_dialog.dart';

class BedConfirmationScreen extends StatelessWidget {
  const BedConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppbar(
        title: "Back",
        color: Palette.black2422,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SharedDynamicIcon(
                SvgAssets.noteCheck,
                height: context.height * 0.25,
              ),
              Text(
                "Confirm your stay for tonight",
                style: context.headlineMedium
                    .copyWith(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              // Subtitle text
              Text(
                '''Do you plan to stay in the bed you reserved tonight at Pathways of home?''',
                style: context.titleSmall.copyWith(color: Palette.grey5050),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              SharedSubmitButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const CustomAlertDialog();
                    },
                  );
                },
                width: double.infinity,
                height: context.height * 0.066,
                title: 'Join Standby List',
              ),
              const Gap(Sizes.s10),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Palette.primary),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      minimumSize: const Size(double.infinity, Sizes.s54)),
                  onPressed: () {},
                  child: Text(
                    'No, I won\'t stay',
                    style: context.headlineSmall
                        .copyWith(fontSize: Sizes.s16, color: Palette.primary),
                  )),
              const Gap(Sizes.s20),
              Text.rich(
                TextSpan(
                  text: 'If you do not confirm by ',
                  style: context.titleSmall.copyWith(color: Palette.grey5050),
                  children: [
                    TextSpan(
                      text: '2 hours',
                      style: context.displaySmall.copyWith(
                          fontWeight: FontWeight.bold, color: Palette.black),
                    ),
                    const TextSpan(
                      text:
                          ', your bed will be automatically released to others', // Regular text after "2 hours"
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ' Contact us at ',
                    style: context.titleSmall.copyWith(color: Palette.grey5050),
                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
