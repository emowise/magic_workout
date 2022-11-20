import 'package:flutter/material.dart';

class ListItemDeleteIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const ListItemDeleteIcon({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ));
  }
}
