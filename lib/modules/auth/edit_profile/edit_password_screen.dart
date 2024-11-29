import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';
import 'package:home_ful/modules/general_resource/legal_help.dart';
import 'package:home_ful/modules/home/components/avatar_navigator_widget.dart';

import '../../../components/shared/shared_appbar.dart';
import '../../../components/shared/shared_submit_button.dart';
import '../../../core/config/validator.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({super.key});

  @override
  _EditPasswordScreenState createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  late final TextEditingController passwordController;
  bool _obscureTextC = false;
  bool _obscureTextN = false;
  bool _hasMinLength = false;
  bool _hasUpperLowerCase = false;
  bool _hasSpecialChar = false;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void _updatePasswordValidation(String value) {
    setState(() {
      _hasMinLength = value.length >= 8;
      _hasUpperLowerCase =
          value.contains(RegExp(r'[a-z]')) && value.contains(RegExp(r'[A-Z]'));
      _hasSpecialChar = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    });
  }

  void showHide() {
    setState(() {
      _obscureTextC = !_obscureTextC;
    });
  }

  void showHideN() {
    setState(() {
      _obscureTextN = !_obscureTextN;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(Sizes.s20),
                          AvatarNavigator(
                              onPress: () => Navigator.pop(context),
                              bgColor: Palette.greyD8D,
                              icon: Icons.arrow_back),
                          const Gap(Sizes.s30),
                          Text(
                            'Change password',
                            style: context.headlineMedium
                                .copyWith(color: Palette.black, fontSize: 20),
                          ),
                          const Gap(Sizes.s20),
                          const BulletRow(title: 'Use at least 8 charaters'),
                          const BulletRow(
                              title:
                                  'Use a mixer of letter , number and special characters'),
                          const Gap(Sizes.s20),
                          Text(
                            "Current password",
                            style: context.displaySmall.copyWith(
                                fontSize: Sizes.s14, color: Palette.black4546),
                          ),
                          const Gap(Sizes.s10),
                          TextFormField(
                            obscureText: _obscureTextC,
                            validator: (val) => Validator.valueExists(val),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureTextC
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  size: 24,
                                ),
                                onPressed: showHide,
                              ),
                              fillColor: Palette.greyf5f7,
                            ),
                            // onChanged: (value) =>
                            //     itemService.currentItem..itemName = value,
                          ),
                          const Gap(Sizes.s20),
                          Text(
                            "New password",
                            style: context.displaySmall.copyWith(
                                fontSize: Sizes.s14, color: Palette.black4546),
                          ),
                          const Gap(Sizes.s10),
                          TextFormField(
                            obscureText: _obscureTextN,
                            validator: (val) => Validator.valueExists(val),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureTextN
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  size: 24,
                                ),
                                onPressed: showHideN,
                              ),
                              fillColor: Palette.greyf5f7,
                            ),
                            // onChanged: (value) =>
                            //     itemService.currentItem..itemName = value,
                          ),
                          const Gap(Sizes.s30),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
                child: SharedSubmitButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: "Update",
                  width: double.infinity,
                  height: Sizes.s54,
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
