import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/main.dart';
import 'package:tobeto_app/rules/rules.dart';
import 'package:tobeto_app/widget/auth_button.dart';
import 'package:tobeto_app/widget/my_textformfield.dart';
import 'package:tobeto_app/widget/show_dialog_widget.dart';
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

  Future register(context) async {
    // kayıt düğmesine tıkladığımızda yapmak istediklerimiz:
    // herhangi bir hata varsa try-catch bloğu ile yakalayalım.(hata yönetimi)
    // parola ve doğrulanmış parola birbirine eşit ise kullanıcı oluşsun.
    // birbirine eşit değil ise 'Parolalar Eşleşmiyor' uyarsı versin.

// başlangıçta CircularProgressIndicator göster.
    showDialogWidget(context);

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
      message = firebaseAuthExceptionRulesRegister[e.code] ??
          "Lütfen bir Değer girin";
      snackBarMessage(context, message);
    } finally {
      navigatorKey.currentState!.pop();
    } // =>  CircularProgressIndicator'ı sonlandırır.
  }

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
