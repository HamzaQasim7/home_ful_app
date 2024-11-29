import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';

import '../../../core/config/validator.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final GlobalKey<FormState> fromKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
            child: Form(
              key: fromKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What’s your email?",
                    style: context.displaySmall.copyWith(
                        fontSize: Sizes.s14, color: Palette.black4546),
                  ),
                  const Gap(Sizes.s10),
                  TextFormField(
                    validator: (val) => Validator.valueExists(val),
                    decoration: const InputDecoration(
                      fillColor: Palette.greyf5f7,
                    ),
                    // onChanged: (value) =>
                    //     itemService.currentItem..itemName = value,
                  ),
                  const Gap(Sizes.s30),
                ],
              ),
            )),
      ),
    );
  }
}
