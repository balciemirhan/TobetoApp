import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto_app/core/widget/neu_box.dart';
import 'package:tobeto_app/core/widget/auth_button.dart';
import 'package:tobeto_app/core/widget/my_textformfield.dart';
import 'package:tobeto_app/constant/theme/text.dart';

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
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NeuBox(
      height: 325,
      width: 325,
      child: Form(
        key: widget.formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  textAlign: TextAlign.center,
                  AppText.passwordResetLink,
                  style: TextStyle(fontSize: 15),
                  textWidthBasis: TextWidthBasis.longestLine,
                ),
              ),
              MyTextformfield(
                prefixIcon: const Icon(Icons.email_outlined),
                hintText: AppText.email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppText.enterValue;
                  }
                  return null;
                },
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: AuthButton(
                    formKey: widget.formKey,
                    buttonTitle: AppText.passwordReset,
                    auth: () async {
                      context.read<AuthBloc>().add(
                          ForgotPassword(email: _emailController.text.trim()));

                      Navigator.pushNamed(context, "/start");
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
