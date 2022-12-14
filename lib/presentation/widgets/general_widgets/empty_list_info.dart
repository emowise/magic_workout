import 'package:flutter/material.dart';

class EmptyListInfo extends StatelessWidget {
  final String title;

  const EmptyListInfo({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
