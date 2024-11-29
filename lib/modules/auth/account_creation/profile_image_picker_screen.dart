import 'package:flutter/material.dart';
import 'package:home_ful/components/shared/shared_dynamic_icon.dart';
import 'package:home_ful/components/shared/shared_submit_button.dart';
import 'package:home_ful/core/constants/constants.dart';
import 'package:home_ful/modules/auth/account_creation/show_profile_image.dart';

import '../../../components/shared/shared_appbar.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const SharedAppbar(title: "Create account", color: Palette.black2422),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: ListTile(
                  title: Text(
                    'Profile image',
                    style: context.headlineMedium.copyWith(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: const Text('Add a display photo'),
                ),
              ),
              SharedDynamicIcon(
                ImageAssets.profileCircle,
                height: context.height * 0.25,
              ),
              const Gap(Sizes.s12),
              Text(
                "Add a profile photo",
                textAlign: TextAlign.center,
                style: context.headlineMedium.copyWith(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const Gap(8),

              // Subtitle text
              const Text(
                "CLorem ipsum dolor sit amet consectetur. Felis consectetur condimentum tortor volutpat faucibus iaculis",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(Sizes.s40),
              const Spacer(),
              SharedSubmitButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ProfileImageScreen()));
                },
                width: double.infinity,
                height: context.height * 0.07,
                title: 'Upload photo',
              ),
              const Gap(Sizes.s20),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Palette.primary),
                    minimumSize: Size(double.infinity, context.height * 0.075),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.standBy);
                },
                child: const Text('Take photo'),
              ),
              const Expanded(child: SizedBox())
            ],
          ),
        ),
      ),
    );
  }
}
