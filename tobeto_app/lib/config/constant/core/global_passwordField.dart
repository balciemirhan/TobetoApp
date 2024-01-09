import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/global_textformfield.dart';

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
    return GlobalTextformfield(
      controller: widget.controller,
      prefixIcon: const Icon(
        Icons.lock,
        color: Colors.black,
      ),
      hintText: "Parolanız",
      obscureText: isInVisible,
      suffixIcon: IconButton(
        onPressed: handleInVisible,
        icon: isInVisible
            ? const Icon(
                Icons.visibility_off,
                color: Colors.grey,
              )
            : Icon(
                Icons.visibility,
                color: Colors.grey.shade800,
              ),
      ),
      validatorText: 'Password cannot be empty',
    );
  }
}
