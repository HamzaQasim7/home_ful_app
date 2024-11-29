import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';

import '../../../components/shared/shared_appbar.dart';
import '../../../components/shared/shared_submit_button.dart';

class ProfileImageScreen extends StatelessWidget {
  const ProfileImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppbar(
        title: "Create account",
        color: Palette.black2422,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
          child: Column(
            children: <Widget>[
              const Gap(Sizes.s20),
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
              const SizedBox(height: 40),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: context.width * 0.7,
                    height: context.height * 0.3,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(ImageAssets.userImage),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 45,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Palette.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SharedSubmitButton(
                width: double.infinity,
                height: Sizes.s54,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.reservingDetail);
                },
                title: 'Create account',
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
