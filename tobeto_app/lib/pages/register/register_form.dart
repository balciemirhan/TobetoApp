import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto_app/core/widget/auth_button.dart';
import 'package:tobeto_app/core/widget/my_textformfield.dart';
import 'package:tobeto_app/constant/theme/text.dart';

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
          Padding(
            padding: EdgeInsets.only(top: mediaQuery.height / 12),
            child: AuthButton(
                formKey: widget.formKey,
                buttonTitle: AppText.registerButtonTitle,
                auth: () async {
                  context.read<AuthBloc>().add(
                        CreateUser(
                          email: emailController.text,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                        ),
                      );
                }),
          ),
        ],
      ),
    );
  }
}
