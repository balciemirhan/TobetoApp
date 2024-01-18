import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/main.dart';
import 'package:tobeto_app/rules/rules.dart';
import 'package:tobeto_app/widget/auth_button.dart';
import 'package:tobeto_app/widget/my_textformfield.dart';
import 'package:tobeto_app/widget/show_dialog_widget.dart';
import 'package:tobeto_app/widget/snackbar_widget.dart';

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

//butona atamak için oluşturduğum fonksiyon. => login()

/* ----------------------- login Function -----------------------  */

  Future login(context) async {
    // giriş  düğmesine tıkladığımızda yapmak istediklerimiz:
    // herhangi bir hata varsa try-catch bloğu ile yakalayalım.

    // başlangıçta CircularProgressIndicator göster.
    showDialogWidget(context);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // ---------- catch bloğu içerisinde Hata yönetimi: ----------
    } on FirebaseAuthException catch (e) {
      String message =
          firebaseAuthExceptionRulesLogin[e.code] ?? "Lütfen bir Değer girin";
      snackBarMessage(context, message);
    }
    navigatorKey.currentState!
        .pop(); // =>  CircularProgressIndicator 'ı sonlandırır.
  }

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

          /* --------------------------Forgot area ------------- */

          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, right: 18),
            child: Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/forgot");
                  },
                  child: const Text(forgetText)),
            ),
          ),

          /* ----------------------- Auth Button -----------------------  */

          AuthButton(
            formKey: widget.formkey,
            buttonTitle: loginButtonTitle,
            auth: () => login(context),
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
