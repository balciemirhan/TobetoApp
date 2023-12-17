import 'package:flutter/material.dart';
import 'package:tobeto_app/components/box_shadow.dart';
import 'package:tobeto_app/config/constant/theme/theme_manager.dart';

class MyTextField extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final prefixIcon;

  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final themeManager = ThemeManager.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadowLogin(context).boxShadowLogin],
        ),
        child: TextField(
          controller: widget.controller,
          obscureText: _isObscured,

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
            fillColor: themeManager.theme.canvasColor,
            // fillColor: Colors.grey.shade200,
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: themeManager.theme.indicatorColor,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      if (_isObscured)
                        Icon(
                          Icons.visibility_off,
                          color: Colors.grey[600],
                        )
                      else
                        Icon(
                          Icons.visibility,
                          color: themeManager.theme.indicatorColor,
                        )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

// _isObscured ? Icons.visibility_off : Icons.visibility,
//                  color: Color.fromARGB(131, 106, 107, 185),