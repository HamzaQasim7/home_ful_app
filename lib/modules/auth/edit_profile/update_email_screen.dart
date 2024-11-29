import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';
import 'package:home_ful/modules/home/components/avatar_navigator_widget.dart';

import '../../../components/shared/shared_submit_button.dart';

class UpdateEmailScreen extends StatefulWidget {
  const UpdateEmailScreen({super.key});

  @override
  _UpdateEmailScreenState createState() => _UpdateEmailScreenState();
}

class _UpdateEmailScreenState extends State<UpdateEmailScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
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
                    'Update your email',
                    style: context.headlineMedium
                        .copyWith(fontSize: 20, color: Palette.black),
                  ),
                  Text(
                    'Enter your new email below',
                    style: context.titleSmall.copyWith(color: Palette.grey5050),
                  ),
                  const Gap(Sizes.s30),
                  Text(
                    "New email",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: Sizes.s14,
                          color: Palette.black,
                        ),
                  ),
                  const Gap(Sizes.s20),
                  TextFormField(
                    controller: emailController,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Name cannot be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        focusColor: Palette.primaryF1,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.primaryF1)),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.cancel,
                                color: Palette.greyD8D, size: 24))),
                  ),
                  const Gap(Sizes.s20),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
                    child: SharedSubmitButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.otp);
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
        ),
      ),
    );
  }
}
