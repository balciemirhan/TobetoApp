import 'package:flutter/material.dart';
import 'package:tobeto_app/components/box_shadow.dart';
import 'package:tobeto_app/config/constant/theme/theme_manager.dart';

class MyTextField_2 extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final prefixIcon;

  const MyTextField_2({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField_2> {
  bool showTick = false;

  @override
  Widget build(BuildContext context) {
    final themeManager = ThemeManager.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadowLogin(context).boxShadowLogin,
          ],
        ),
        child: TextField(
          controller: widget.controller,
          onChanged: (text) {
            setState(() {
              showTick = text.isNotEmpty;
            });
          },
          // -------decoration-------
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 143, 101, 215)),
            ),
            // fillColor: Colors.grey.shade200,
            fillColor: themeManager.theme.canvasColor,
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: themeManager.theme.indicatorColor,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (showTick)
                  Icon(Icons.check, color: Color.fromARGB(131, 106, 107, 185)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
