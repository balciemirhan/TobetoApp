import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/business_logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_app/business_logic/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto_app/business_logic/blocs/auth_bloc/auth_state.dart';
import 'package:tobeto_app/config/constant/core/widget/auth_button.dart';
import 'package:tobeto_app/config/constant/core/widget/my_textformfield.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    required this.formkey,
  }) : super(key: key);

  final GlobalKey<FormState> formkey;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
// text editin controller:
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

// ----------  controller'ı , form süreci sonrası imha et. ----------

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Oluşturduğum MyTextformfield'ları Form'a sarmaladım 'ki formun key aracı ile validate olabilsinler
    // ve takip edilebilsinler.
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.of(context).pushNamed("/curved");
        } else if (state is AuthError) {}
      },
      child: Form(
        key: widget.formkey,
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
            const SizedBox(height: 15),

            /* ----------------------- Password Textfield -----------------------  */

            buildPasswordFormField(),

            /* --------------------------Forgot area ------------- */

            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, right: 18),
              child: Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/forgot");
                    },
                    child: const Text(AppText.forgetText)),
              ),
            ),

            /* ----------------------- Auth Button -----------------------  */

            AuthButton(
                formKey: widget.formkey,
                buttonTitle: AppText.loginButtonTitle,
                auth: () async {
                  context.read<AuthBloc>().add(
                        LoginUser(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        ),
                      );
                })
          ],
        ),
      ),
    );
  }

  /* ----------------------- Password Textfield -----------------------  */

  Widget buildPasswordFormField() {
    bool isPasswordVisible = true;

    return StatefulBuilder(
      builder: (context, setState) {
        return MyTextformfield(
          controller: passwordController,
          hintText: AppText.password,
          prefixIcon: const Icon(Icons.lock_outline),
          suffixIcon: IconButton(
            onPressed: () {
              setState(
                () {
                  isPasswordVisible = !isPasswordVisible;
                },
              );
            },
            icon: isPasswordVisible
                ? const Icon(Icons.visibility_off_outlined)
                : const Icon(Icons.visibility_outlined),
          ),
          obscureText: isPasswordVisible,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppText.validPassword;
            }
            return null;
          },
          keyboardType: TextInputType.visiblePassword,
        );
      },
    );
  }
}
