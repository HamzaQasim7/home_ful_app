import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/shared/shared_submit_button.dart';
import '../../core/config/validator.dart';
import '../../core/constants/constants.dart';
import 'component/shared_title_row.dart';
import 'viewmodel/auth_viewmodel.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  late final TextEditingController _emailController;
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                      'Admin account',
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
                    const Gap(Sizes.s20),
                    Text(
                      "Password",
                      style: context.displaySmall.copyWith(
                          fontSize: Sizes.s14, color: Palette.black4546),
                    ),
                    const Gap(Sizes.s10),
                    TextFormField(
                      controller: _passwordController,
                      validator: (val) => Validator.valueExists(val),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        fillColor: Palette.greyf5f7,
                      ),
                    ),
                    const Gap(Sizes.s200),
                    Consumer<AuthViewModel>(builder: (context, vm, _) {
                      return SharedSubmitButton(
                        loading: vm.isLoading,
                        onPressed: () async {
                          if (_validateAndSaveForm()) {
                            Navigator.pushNamed(context, Routes.adminItems);
                          }
                        },
                        width: double.infinity,
                        height: Sizes.s54,
                        title: "Continue",
                      );
                    }),
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
/*

if (_validateAndSaveForm()) {
User? user =
await context.read<AuthViewmodel>().signUp(
_emailController.text,
_passController.text,
User(
username: _usernameController.text,
email: _emailController.text,
isVerified: false,
createdAt:
DateTime.now().microsecondsSinceEpoch,
));
if (user != null && context.mounted) {
Navigator.pop(context);
Fluttertoast.showToast(
msg: "Please Login to Post testing results",
);
}
}
 */
