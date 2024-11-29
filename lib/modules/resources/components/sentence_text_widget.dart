import 'package:flutter/material.dart';

class SentenceTextWidget extends StatelessWidget {
  const SentenceTextWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: const Color(0xff505050)));
  }
}
