import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';

import 'intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    move();
    super.initState();
  }

  void move() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const IntroScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Palette.primary,
      body: Center(
        child: Text(
          'HOMEFULL',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: Sizes.s48,
              color: Colors.white),
        ),
      ),
    );
  }
}
