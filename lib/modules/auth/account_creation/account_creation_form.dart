import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';

import '../../../components/shared/shared_appbar.dart';
import '../../../components/shared/shared_submit_button.dart';

class AccountCreationForm extends StatefulWidget {
  const AccountCreationForm({super.key});

  @override
  State<AccountCreationForm> createState() => _AccountCreationFormState();
}

class _AccountCreationFormState extends State<AccountCreationForm> {
  int _currentIndex = 0;
  bool _isSubmitting = false;
  final List<GlobalKey<FormState>> _formKeys =
      List.generate(3, (_) => GlobalKey<FormState>());

  void _goBack() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get screen height.
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Palette.white,
      appBar: SharedAppbar(
        title: "Create account",
        color: Palette.black2422,
        backgroundColor: Palette.white,
        onLeading: _goBack,
      ),
      bottomNavigationBar: Container(
        height: screenHeight * 0.12,
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        alignment: Alignment.topCenter,
        child: _isSubmitting
            ? const Center(child: CircularProgressIndicator())
            : SharedSubmitButton(
                onPressed: _isSubmitting
                    ? null
                    : () async {
                        if (_formKeys[_currentIndex].currentState!.validate()) {
                          if (_currentIndex < 2) {
                            setState(() {
                              _currentIndex++;
                            });
                          } else {
                            // Handle final form submission here
                            setState(() {
                              _isSubmitting = true;
                            });
                            // Perform submission actions here
                          }
                        }
                      },
                title: [
                  "Confirm",
                  "Confirm",
                  "Create account",
                ][_currentIndex],
                width: double.infinity,
                height: Sizes.s54,
              ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(Sizes.s40),
            IndexedStack(
              index: _currentIndex,
              children: const [],
            ),
          ],
        ),
      ),
    );
  }
}
