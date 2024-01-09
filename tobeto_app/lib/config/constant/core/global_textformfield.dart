import 'package:flutter/material.dart';

class GlobalTextformfield extends StatelessWidget {
  final TextEditingController controller;
  final bool? obscureText;

  final Widget prefixIcon;
  final String hintText;
  final Widget? suffixIcon;
  final String? validatorText;
  const GlobalTextformfield(
      {Key? key,
      required this.controller,
      this.obscureText,
      required this.prefixIcon,
      required this.hintText,
      this.suffixIcon,
      this.validatorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validatorText;
        }
        return null;
      },
    );
  }
}
