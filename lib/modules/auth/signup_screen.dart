import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/shared/shared_snack_bar.dart';
import '../../components/shared/shared_submit_button.dart';
import '../../core/config/utils.dart';
import '../../core/config/validator.dart';
import '../../core/constants/constants.dart';
import '../../provider/auth_provider/auth_provider.dart';
import 'component/shared_title_row.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final TextEditingController _emailController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool _validateAndSaveForm() {
    var form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.homeBackground,
      bottomNavigationBar: SizedBox(
        height: context.height * 0.065,
        // alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            SizedBox(
              width: context.width * 0.6,
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: context.bodyMedium,
                  children: [
                    TextSpan(
                      text: "Login",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacementNamed(
                              context, Routes.signIn);
                        },
                      style: context.titleMedium.copyWith(
                        color: Palette.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(Sizes.s20),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(40),
                    const SharedTitleRow(text: 'FOODSTERS'),
                    const Gap(30),
                    Text(
                      'Sign in or create an account',
                      style:
                          context.displayMedium.copyWith(color: Palette.black),
                    ),
                    const Gap(Sizes.s20),
                    Text(
                      "Email",
                      style: context.titleMedium.copyWith(
                        color: Palette.black2422,
                      ),
                    ),
                    const Gap(Sizes.s4),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) => Validator.validateEmail(val),
                      decoration: const InputDecoration(
                        hintText: "Your email",
                      ),
                    ),
                    const Gap(Sizes.s30),
                    Consumer<AuthenticationProvider>(builder: (context, vm, _) {
                      return SharedSubmitButton(
                        loading: vm.isLoading,
                        onPressed: () async {
                          if (_validateAndSaveForm()) {
                            final email = _emailController.text;
                            if (email.isNotEmpty) {
                              final success = await vm.signUp(email);
                              if (success) {
                                CustomSnackBar.showSuccess(
                                    context: context,
                                    message: 'OTP sent successfully.');
                              } else {
                                CustomSnackBar.showError(
                                    context: context,
                                    message:
                                        'Failed to send OTP. Please use a different email.');
                              }
                            }
                          }
                        },
                        width: double.infinity,
                        height: Sizes.s54,
                        title: "Continue",
                      );
                    }),
                    const Gap(Sizes.s30),
                    Container(
                      height: context.height * 0.1,
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: context.width * 0.8,
                            child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text:
                                    "By registering  your account to accept our, ",
                                style: context.bodyMedium
                                    .copyWith(fontWeight: FontWeight.w400),
                                children: [
                                  TextSpan(
                                    text: "Terms of use",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Utils.launchAppUrl(
                                            "https://sites.google.com/view/lacewatch-terms-conditions/home");
                                      },
                                    style: context.titleMedium.copyWith(
                                      color: Palette.primary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " and ",
                                    style: context.titleMedium.copyWith(),
                                  ),
                                  TextSpan(
                                    text: "Privacy policy",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Utils.launchAppUrl(
                                            "https://sites.google.com/view/lacewatch-terms-conditions/home");
                                      },
                                    style: context.titleMedium.copyWith(
                                      color: Palette.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Gap(Sizes.s20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
