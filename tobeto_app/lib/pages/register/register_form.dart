import 'package:flutter/material.dart';
import 'package:tobeto_app/auth/signup_auth.dart';
import 'package:tobeto_app/config/constant/core/widget/auth_button.dart';
import 'package:tobeto_app/config/constant/core/widget/my_textformfield.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

//butona atamak için oluşturduğum fonksiyon. => register()

/* ----------------------- Register Function -----------------------  */

// ----------  controller'ı , form süreci sonrası imha et. ----------

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          /* ----------------------- MyTextformfields -----------------------  */

          MyTextformfield(
            controller: emailController,
            hintText: AppText.email,
            prefixIcon: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppText.validEmail;
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: MyTextformfield(
              controller: passwordController,
              hintText: AppText.password,
              prefixIcon: const Icon(Icons.email_outlined),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value != null && value.length < 6) {
                  return AppText.validPassword;
                }
                return null;
              },
            ),
          ),
          MyTextformfield(
            controller: confirmPasswordController,
            hintText: AppText.confirmPassword,
            prefixIcon: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value != null && value.length < 6) {
                return AppText.validPassword;
              }
              return null;
            },
          ),

          /* ----------------------- Auth Button -----------------------  */

          Padding(
            padding: EdgeInsets.only(top: mediaQuery.height / 12),
            child: AuthButton(
              formKey: widget.formKey,
              buttonTitle: AppText.registerButtonTitle,
              auth: () => SignUp.register(
                context,
                emailController.text.trim(),
                passwordController.text.trim(),
                confirmPasswordController.text.trim(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
