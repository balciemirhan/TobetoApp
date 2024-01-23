import 'package:flutter/material.dart';
import 'package:tobeto_app/auth/forgot_auth.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/config/constant/core/widget/auth_button.dart';
import 'package:tobeto_app/config/constant/core/widget/my_textformfield.dart';

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
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              AuthButton(
                  formKey: widget.formKey,
                  buttonTitle: "Şifre resetleme",
                  auth: () => Forgot.passwordReset(
                      context, emailController.text.trim()))
            ],
          ),
        ),
      ),
    );
  }
}
