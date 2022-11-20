import 'package:flutter/material.dart';

class AppbarIconButton extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final VoidCallback onPressed;

  const AppbarIconButton(
      {Key? key,
      this.iconData = Icons.arrow_back,
      required this.onPressed,
      this.iconColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          iconData,
          color: iconColor,
        ),
        onPressed: onPressed);
  }
}
