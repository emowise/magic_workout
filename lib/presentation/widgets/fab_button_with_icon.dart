import 'package:flutter/material.dart';

class FabButtonWithIcon extends StatelessWidget {
  final Icon icon;
  final String title;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const FabButtonWithIcon(
      {Key? key,
      required this.icon,
      required this.title,
      required this.onPressed,
      this.backgroundColor = Colors.green})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: backgroundColor,
      onPressed: onPressed,
      label: _FabButtonLabel(
        icon: icon,
        title: title,
      ),
    );
  }
}

class _FabButtonLabel extends StatelessWidget {
  final Icon icon;
  final String title;

  const _FabButtonLabel({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(
          width: 10,
        ),
        Text(title)
      ],
    );
  }
}
