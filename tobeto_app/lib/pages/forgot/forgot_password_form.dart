import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/neu_box.dart';
import 'package:tobeto_app/rules/rules.dart';
import 'package:tobeto_app/widget/auth_button.dart';
import 'package:tobeto_app/widget/my_textformfield.dart';
import 'package:tobeto_app/widget/snackbar_widget.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);
  final GlobalKey<FormState> formKey;

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final passwordController = TextEditingController();
  Future<void> passwordReset(context) async {
    String message = "";
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: passwordController.text.trim());
      message = "Şifre bağlantısı gönderildi! Lütfen e-postanı kontrol et";
      snackBarMessage(
        color: Colors.green,
        context,
        message,
      );
    } on FirebaseAuthException catch (e) {
      message = forgotPasswordRules(e, message, context);
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NeuBox(
      height: 300,
      width: 300,
      child: Form(
        key: widget.formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Şifre sıfırlama bağlantısı için mail adresinizi giriniz.",
                style: TextStyle(fontSize: 15),
                textWidthBasis: TextWidthBasis.longestLine,
              ),
              MyTextformfield(
                prefixIcon: const Icon(Icons.email_outlined),
                hintText: "E-mail",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Bir değer giriniz";
                  }
                  return null;
                },
                controller: passwordController,
                keyboardType: TextInputType.emailAddress,
              ),
              AuthButton(
                formKey: widget.formKey,
                buttonTitle: "Şifre resetleme",
                auth: () {
                  return passwordReset(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
