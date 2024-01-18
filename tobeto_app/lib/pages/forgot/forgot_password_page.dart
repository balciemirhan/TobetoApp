import 'package:flutter/material.dart';
import 'package:tobeto_app/pages/forgot/forgot_password_form.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ForgotPasswordForm(
              formKey: formKey,
            )
          ],
        ),
      ),
    );
  }
}
