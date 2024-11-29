import 'package:flutter/material.dart';
import 'package:home_ful/modules/home/components/avatar_navigator_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../components/shared/shared_submit_button.dart';
import '../../core/constants/constants.dart';

class EmailConfirmationScreen extends StatefulWidget {
  const EmailConfirmationScreen({super.key});

  @override
  State<EmailConfirmationScreen> createState() =>
      _EmailConfirmationScreenState();
}

class _EmailConfirmationScreenState extends State<EmailConfirmationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(Sizes.s20),
                    AvatarNavigator(
                        onPress: () => Navigator.pop(context),
                        bgColor: Palette.greyD8D,
                        icon: Icons.arrow_back),
                    const Gap(10),
                    Text(
                      'We just sent to a code',
                      style: context.headlineMedium
                          .copyWith(color: Palette.black, fontSize: 20),
                    ),
                    const Gap(Sizes.s5),
                    Text(
                      "Enter the six digit code sent to ****alpha@gmail.com",
                      style: context.titleMedium.copyWith(
                        color: Palette.black4040,
                      ),
                    ),
                    const Gap(Sizes.s30),
                    PinCodeTextField(
                      controller: _codeController,
                      appContext: context,
                      length: 6,
                      onCompleted: (value) async {
                        if (_validateAndSaveForm()) {
                          // final verified =
                          //     await vm.verifyOTP(value, widget.email);
                          // if (verified) {
                          //   Navigator.pushNamed(
                          //       context, Routes.profileCreation);
                          // } else {
                          //   CustomSnackBar.showError(
                          //       context: context,
                          //       message: 'Invalid code. Please try again.');
                          // }
                        }
                      },
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the 6-digit code';
                        } else if (value.length < 6) {
                          return 'Code must be 6 digits';
                        }
                        return null;
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: Sizes.s50,
                        fieldWidth: Sizes.s40,
                        activeFillColor: Palette.primary,
                        selectedColor: Palette.primary,
                        inactiveColor: Palette.greyA1B9,
                        inactiveFillColor: Colors.grey[200],
                      ),
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Text(
                          "Didn't receive the code?",
                          style: context.titleSmall,
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle resend code
                          },
                          child: const Text(
                            "Resend it",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: SharedSubmitButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.bedScreen);
          },
          title: "Continue",
          width: double.infinity,
          height: Sizes.s54,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }
}
