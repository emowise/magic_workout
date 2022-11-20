import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final String labelText;
  final Color backgroundColor;

  const SubmitButton(
      {Key? key,
      required this.onPressed,
      required this.icon,
      required this.labelText,
      this.backgroundColor = Colors.black38})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            shape: const StadiumBorder(),
            backgroundColor: backgroundColor),
        onPressed: onPressed,
        child: _SubmitButtonLabel(
          icon: icon,
          labelText: labelText,
        ));
  }
}

class _SubmitButtonLabel extends StatelessWidget {
  final Widget icon;
  final String labelText;

  const _SubmitButtonLabel(
      {Key? key, required this.icon, required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10,
          child: icon,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(labelText)
      ],
    );
  }
}
