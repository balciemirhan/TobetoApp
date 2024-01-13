import 'package:flutter/material.dart';
import 'package:tobeto_app/auth/auth_service.dart';
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

// Firebase ile oluşturacağım kullanıcı girişi fonksiyonunu, => auth/auth_Service klasöründe
//butona atamak için oluşturduğum fonksiyon. => login()

  Future<void> login(context) async {
    // giriş  düğmesine tıkladığımızda yapmak istediklerimiz:
    // auth service getiriyorum:

    final AuthService authService = AuthService();

    // herhangi bir hata varsa try-catch bloğu ile yakalayalım.

    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      // hata olur ise Alert Dialog göstersin.
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Oluşturduğum MyTextformfield'ları Form'a sarmaladım 'ki formun key aracı ile validate olabilsinler
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

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: AuthButton(
              formKey: widget.formkey,
              buttonTitle: loginButtonTitle,
              auth: () => login(context),
            ),
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
