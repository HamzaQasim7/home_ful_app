import 'package:flutter/material.dart';
import 'package:home_ful/core/config/routes.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class NotificationBell extends StatelessWidget {
  const NotificationBell({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.notifications),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Icon(
            Symbols.notifications_rounded,
            size: 30,
            color: Colors.black,
          ),
          Positioned(
            right: 2,
            top: -5,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.red, // Red badge
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(
                minWidth: 8,
                minHeight: 8,
              ),
              child: const Text(
                ' ', // Empty space or you can put a number if needed
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
