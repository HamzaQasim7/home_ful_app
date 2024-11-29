import 'package:flutter/material.dart';

class HeadingTextWidget extends StatelessWidget {
  const HeadingTextWidget({super.key, required this.heading});

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Text(heading,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: const Color(0xff040108)));
  }
}
