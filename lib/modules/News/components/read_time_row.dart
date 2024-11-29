import 'package:flutter/material.dart';

class ReadTimeRow extends StatelessWidget {
  const ReadTimeRow({super.key, required this.timeAgo, required this.readTime});
  final String timeAgo, readTime;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(timeAgo, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(width: 10),
        const CircleAvatar(radius: 5),
        const SizedBox(width: 10),
        Text(readTime, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
