import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';

import '../../components/shared/shared_submit_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      body: Column(
        children: [
          Image(
            image: const AssetImage(ImageAssets.introImage),
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.6,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 18, right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Gap(Sizes.s10),
                Text('Welcome to Homefull',
                    textAlign: TextAlign.center,
                    // maxLines: ,
                    style: TextStyle(
                        color: Palette.black,
                        fontSize: Sizes.s20,
                        fontWeight: FontWeight.w600)),
                Gap(Sizes.s10),
                Text(
                  "Find nearby shelters, food services, and medical help with just a few taps. We’re here to help you find the resources you need, right when you need them",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: SharedSubmitButton(
          width: context.width,
          height: Sizes.s50,
          title: 'Get Started',
          onPressed: () {
            // Navigator.pushReplacementNamed(context, Routes.signUp);
            Navigator.pushReplacementNamed(context, Routes.dashboard);
          },
        ),
      ),
    );
  }
}
