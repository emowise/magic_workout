import 'package:flutter/material.dart';

import '../fab_button_with_icon.dart';

class DoneButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const DoneButton({Key? key, required this.onPressed, this.title = "Done"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FabButtonWithIcon(
      icon: const Icon(
        Icons.done,
        color: Colors.white,
      ),
      title: title,
      onPressed: onPressed,
    );
  }
}
