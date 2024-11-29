import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';

import '../../components/shared/shared_appbar.dart';
import '../../components/shared/shared_submit_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  late final TextEditingController passwordController;
  bool _obscureText = true;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppbar(
        title: "Create account",
        color: Palette.black2422,
        backgroundColor: Palette.white,
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const Gap(Sizes.s30),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create a password",
                            style: context.displaySmall.copyWith(
                              fontSize: Sizes.s14,
                              color: Palette.black4546,
                            ),
                          ),
                          const Gap(Sizes.s10),
                          TextFormField(
                            controller: passwordController,
                            // validator: (val) => Validator.valueExists(val),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Palette.white,
                            ),
                          ),
                          const Gap(Sizes.s5),
                          Text(
                            "Use at least 8 characters",
                            style: context.displaySmall.copyWith(
                              fontSize: Sizes.s12,
                              color: Palette.grey5050,
                            ),
                          ),
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
                    Navigator.pushNamed(context, Routes.nameScreen);
                  },
                  title: "Confirm",
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
