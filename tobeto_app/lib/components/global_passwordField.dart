import 'package:flutter/material.dart';
import 'package:tobeto_app/components/global_textfield.dart';
import 'package:tobeto_app/config/constant/theme/theme_manager.dart';

class GlobalPasswordField extends StatefulWidget {
  const GlobalPasswordField({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;
  @override
  _GlobalPasswordFieldState createState() => _GlobalPasswordFieldState();
}

class _GlobalPasswordFieldState extends State<GlobalPasswordField> {
  bool isInVisible = true;
  void handleInVisible() {
    if (isInVisible) {
      setState(() {
        isInVisible = false;
      });
    } else {
      setState(() {
        isInVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlobalTextField(
        controller: widget.controller,
        prefixIcon: Icon(Icons.lock,
            color: ThemeManager.of(context).theme.indicatorColor),
        hintText: "Parolanız",
        obscureText: isInVisible,
        suffixIcon: IconButton(
          onPressed: handleInVisible,
          icon:
              isInVisible ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        ));
  }
}
