import 'package:flutter/material.dart';
import 'package:home_ful/components/shared/shared_submit_button.dart';

import '../../core/config/utils.dart';
import '../../core/constants/constants.dart';
import 'components/settings_item.dart';
import 'components/user_profile_avatar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // late final UserViewmodel _viewmodel;
  // late final AuthService _authService;
  @override
  void initState() {
    // _authService = instance<AuthService>();
    // _viewmodel = context.read<UserViewmodel>();
    // if (_authService.currentUser != null) {
    //   _viewmodel.getUserById(_authService.currentUser!.uid);
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Profile',
                style: context.headlineMedium
                    .copyWith(color: Palette.black, fontSize: 20),
              ),
              const Gap(Sizes.s20),
              SizedBox(
                width: double.infinity,
                height: context.height * 0.15,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const UserProfileAvatar(
                      imageUrl: ImageAssets.userImage,
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                        child: ListTile(
                      title: const Text(
                        'Marvin McKinney',
                        style: TextStyle(
                          color: Palette.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'marvin.mckinney@example.com',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              const Gap(Sizes.s10),
              Text(
                'Account settings',
                style: context.titleSmall.copyWith(color: Palette.grey4F4F),
              ),
              const Divider(color: Palette.greyE7E7),
              SettingsItem(
                onTap: () => Navigator.pushNamed(context, Routes.editName),
                title: "Edit profile",
              ),
              const Gap(Sizes.s20),
              SettingsItem(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.editPasswordScreen),
                title: "Change password",
              ),
              const Gap(Sizes.s20),
              SettingsItem(
                onTap: () => Navigator.pushNamed(context, Routes.resetEmail),
                title: "Update email",
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Notifications',
                    style: context.titleLarge.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Palette.black,
                        fontSize: 12)),
                trailing: Switch.adaptive(value: true, onChanged: (v) {}),
              ),
              Text(
                'More',
                style: context.titleSmall.copyWith(color: Palette.grey4F4F),
              ),
              const Divider(color: Palette.greyE7E7),
              SettingsItem(
                onTap: () => Navigator.pushNamed(context, Routes.about),
                title: "About Us",
              ),
              const Gap(Sizes.s20),
              SettingsItem(
                onTap: () {
                  Utils.launchAppUrl(
                      "https://sites.google.com/view/lacewatch-privacy-policy/home");
                },
                title: "Privacy Policy",
              ),
              const Gap(Sizes.s20),
              SettingsItem(
                onTap: () {
                  Utils.launchAppUrl(
                      "https://sites.google.com/view/lacewatch-terms-conditions/home");
                },
                title: "Terms & Conditions",
              ),
              const Gap(Sizes.s40),
              SharedSubmitButton(
                  width: context.width,
                  height: Sizes.s54,
                  title: 'Logout',
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}

class SwitchButtonWidget extends StatelessWidget {
  const SwitchButtonWidget(
      {super.key, required this.title, required this.onPress, this.textStyle});

  final String title;
  final VoidCallback onPress;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textStyle ?? Theme.of(context).textTheme.bodyLarge,
        ),
        TextButton(
            onPressed: onPress,
            child: Text(
              'Switch',
              style: context.displaySmall,
            )),
      ],
    );
  }
}
