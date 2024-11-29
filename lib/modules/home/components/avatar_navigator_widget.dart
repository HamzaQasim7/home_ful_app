import 'package:flutter/material.dart';

class AvatarNavigator extends StatelessWidget {
  const AvatarNavigator({
    super.key,
    required this.onPress,
    required this.bgColor,
    required this.icon,
  });

  final VoidCallback onPress;
  final Color bgColor;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: bgColor,
      child: Center(
        child: IconButton(onPressed: onPress, icon: Icon(icon)),
      ),
    );
  }
}
