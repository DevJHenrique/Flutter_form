import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool? obscureText;
  final String? errorText;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;

  const CustomFormField({
    Key? key,
    required this.label,
    this.icon,
    this.obscureText,
    this.errorText,
    this.onChanged,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      style: TextStyle(color: Colors.white, fontSize: 16),
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        errorText: errorText,
        contentPadding: EdgeInsets.all(0),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: label,
        prefixIcon: Icon(icon),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.indigo),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
