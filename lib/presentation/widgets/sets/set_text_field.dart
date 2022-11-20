import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SetTextField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLength;
  final String title;
  final Function(String?) onValue;

  const SetTextField(
      {Key? key,
      required this.controller,
      required this.title,
      this.maxLength = 2,
      required this.onValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 35,
          decoration:
              BoxDecoration(shape: BoxShape.rectangle, color: Colors.grey[800]),
          child: TextFormField(
            onSaved: onValue,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: maxLength,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              return null;
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: const InputDecoration(
                counterText: "",
                border: InputBorder.none,
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.red, style: BorderStyle.solid))),
            controller: controller,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }
}
