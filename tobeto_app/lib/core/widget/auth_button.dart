import 'package:flutter/material.dart';
import 'package:tobeto_app/core/widget/neu_box.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.formKey,
    required this.buttonTitle,
    required this.auth,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final String buttonTitle;
  final Future<void> Function() auth;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        formKey.currentState!.validate();
        formKey.currentState!.save();
        auth();
      },
      child: NeuBox(
        width: mediaQuery.width * 0.8,
        height: mediaQuery.height * 0.08,
        child: Center(
          child: Text(buttonTitle),
        ),
      ),
    );
  }
}
