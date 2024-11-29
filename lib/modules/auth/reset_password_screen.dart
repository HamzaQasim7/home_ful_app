import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../components/shared/shared_appbar.dart';
import '../../components/shared/shared_submit_button.dart';
import '../../core/config/validator.dart';
import '../../core/constants/constants.dart';
import 'viewmodel/auth_viewmodel.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
      appBar: const SharedAppbar(
        title: "Reset Password",
        backgroundColor: Palette.homeBackground,
        desc: "Don't worry if you can't recall your password",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(Sizes.s30),
              Text(
                "Email",
                style: context.titleMedium.copyWith(
                  color: Palette.black2422,
                ),
              ),
              const Gap(Sizes.s4),
              TextFormField(
                controller: _emailController,
                validator: (val) => Validator.validateEmail(val),
                decoration: const InputDecoration(
                  hintText: "Your email",
                ),
              ),
              const Gap(Sizes.s30),
              Consumer<AuthViewModel>(builder: (context, vm, _) {
                return SharedSubmitButton(
                  loading: vm.isLoading,
                  onPressed: () async {
                    if (_validateAndSaveForm()) {
                      String? message = await vm.resetPassword(
                        _emailController.text,
                      );
                      if (message != null && context.mounted) {
                        Navigator.pop(context);
                        Fluttertoast.showToast(msg: message);
                      } else {
                        Fluttertoast.showToast(
                            msg: "Error sending reset link!");
                      }
                    }
                  },
                  width: double.infinity,
                  height: Sizes.s54,
                  title: "Reset Password",
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
