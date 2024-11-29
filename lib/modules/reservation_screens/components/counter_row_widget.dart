import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';

class CounterRow extends StatelessWidget {
  final String title;
  final String description;
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterRow({
    super.key,
    required this.title,
    required this.description,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleSmall),
              Text(description, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: count > 0 ? onDecrement : null,
                icon: const Icon(Icons.add_circle_outline, size: 30),
                color: Colors.grey,
              ),
              Text(
                '$count',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: onIncrement,
                icon: const Icon(
                  Icons.add_circle_outline,
                  size: 30,
                ),
                color: Palette.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
