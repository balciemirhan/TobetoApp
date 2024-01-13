import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/widget/auth_button.dart';
import 'package:tobeto_app/widget/my_textformfield.dart';

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

// Firebase ile oluşturacağım kullanıcı girişi fonksiyonunu, => auth klasöründe
//butona atamak için oluşturduğum fonksiyon. => login()

  Future<void> login() async {}

  @override
  Widget build(BuildContext context) {
    // MyTextformfield'larımı Form'a sarmaladım 'ki formun key aracı ile validate olabilsinler
    // ve takip edilebilsinler.
    return Form(
      key: widget.formkey,
      child: Column(
        children: [
          MyTextformfield(
            controller: emailController,
            hintText: email,
            prefixIcon: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return validEmail;
              }
              return null;
            },
          ),
          const SizedBox(height: 15),

          /* ----------------------- Password Textfield -----------------------  */

          buildPasswordFormField(),

          /* ----------------------- Auth Button -----------------------  */

          AuthButton(
            formKey: widget.formkey,
            buttonTitle: "asd",
            auth: () => login(),
          )
        ],
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
          hintText: password,
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
              return validPassword;
            }
            return null;
          },
          keyboardType: TextInputType.visiblePassword,
        );
      },
    );
  }
}
