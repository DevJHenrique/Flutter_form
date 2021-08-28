import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final void Function(bool?) onChanged;
  final bool isChecked;
  final String text;

  const CustomCheckBox({
    Key? key,
    required this.onChanged,
    required this.isChecked,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white70),
        )
      ],
    );
  }
}
