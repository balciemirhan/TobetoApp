import 'package:flutter/material.dart';
import 'package:tobeto_app/components/box_shadow.dart';
import 'package:tobeto_app/config/constant/theme/theme_manager.dart';

class GlobalTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool? obscureText;

  final Widget prefixIcon;
  final String hintText;
  final Widget? suffixIcon;

  const GlobalTextField(
      {Key? key,
      required this.controller,
      this.obscureText,
      required this.prefixIcon,
      required this.hintText,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Container(
        decoration:
            BoxDecoration(boxShadow: [BoxShadowLogin(context).boxShadowLogin]),
        child: TextField(
          controller: controller,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 143, 101, 215)),
            ),
            fillColor: ThemeManager.of(context).theme.canvasColor,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
              color: ThemeManager.of(context).theme.indicatorColor,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
