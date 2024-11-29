import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';
import 'package:home_ful/modules/auth/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../components/shared/shared_appbar.dart';
import '../../../components/shared/shared_submit_button.dart';
import '../../../core/config/validator.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

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
            child: Consumer<AuthViewModel>(builder: (context, authP, _) {
              return Column(
                children: [
                  const Gap(Sizes.s30),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: Sizes.s20),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "What’s your email?",
                                style: context.displaySmall.copyWith(
                                  fontSize: Sizes.s14,
                                  color: Palette.black4546,
                                ),
                              ),
                              const Gap(Sizes.s10),
                              TextFormField(
                                controller: emailController,
                                validator: (val) =>
                                    Validator.validateEmail(val),
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Palette.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        print('move to guest');
                        Navigator.pushNamed(context, Routes.guestEmailScreen);
                      },
                      child: const Text(
                        'Continue as guest login',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
                    child: SharedSubmitButton(
                      onPressed: () {
                        authP.setEmail(emailController.text.toString());
                        Navigator.pushNamed(context, Routes.createPassScreen);
                      },
                      title: "Confirm",
                      width: double.infinity,
                      height: Sizes.s40,
                    ),
                  ),
                  const Gap(20),
                ],
              );
            })),
      ),
    );
  }
}
