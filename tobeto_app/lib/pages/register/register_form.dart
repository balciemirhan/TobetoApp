import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/rules/rules.dart';
import 'package:tobeto_app/widget/auth_button.dart';
import 'package:tobeto_app/widget/my_textformfield.dart';
import 'package:tobeto_app/widget/snackbar_widget.dart';

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

/*   Future register(context) async {
    // kayıt düğmesine tıkladığımızda yapmak istediklerimiz:
    // herhangi bir hata varsa try-catch bloğu ile yakalayalım.
    // parola ve doğrulanmış parola birbirine eşit ise kullanıcı oluşsun.
    // birbirine eşit değil ise 'Parolalar Eşleşmiyor' uyarsı versin.

    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } else {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: const Text('Parolalar Eşleşmiyor'),
          action: SnackBarAction(
            textColor: Colors.white,
            label: "Kapat",
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          ),
        ),
      );
    }
  } */

  Future register(context) async {
    // kayıt düğmesine tıkladığımızda yapmak istediklerimiz:
    // herhangi bir hata varsa try-catch bloğu ile yakalayalım.(hata yönetimi)
    // parola ve doğrulanmış parola birbirine eşit ise kullanıcı oluşsun.
    // birbirine eşit değil ise 'Parolalar Eşleşmiyor' uyarsı versin.
    String message;
    try {
      if (passwordController.text.trim() ==
          confirmPasswordController.text.trim()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
      } else {
        message = " Parolalar Eşleşmiyor";
        return snackBarMessage(context, message);
      } // ---------- catch bloğu içerisinde Hata yönetimi: ----------
    } on FirebaseAuthException catch (e) {
      String message = firebaseAuthExceptionRules[e.code]!;
      snackBarMessage(context, message);
    }
  }

// controller'ı , form süreci sonrası imha et.

  @override
  void dispose() {
    super.dispose();
    emailController.text.trim();
    passwordController.text.trim();
    confirmPasswordController.text.trim();
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: MyTextformfield(
              controller: passwordController,
              hintText: password,
              prefixIcon: const Icon(Icons.email_outlined),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value != null && value.length < 6) {
                  return validPassword;
                }
                return null;
              },
            ),
          ),
          MyTextformfield(
            controller: confirmPasswordController,
            hintText: confirmPassword,
            prefixIcon: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value != null && value.length < 6) {
                return validPassword;
              }
              return null;
            },
          ),

          /* ----------------------- Auth Button -----------------------  */

          Padding(
            padding: EdgeInsets.only(top: mediaQuery.height / 12),
            child: AuthButton(
              formKey: widget.formKey,
              buttonTitle: registerButtonTitle,
              auth: () => register(context),
            ),
          ),
        ],
      ),
    );
  }
}
