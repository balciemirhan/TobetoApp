import 'package:flutter/material.dart';
import 'package:tobeto_app/auth/auth_service.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/widget/auth_button.dart';
import 'package:tobeto_app/widget/my_textformfield.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

// Firebase ile oluşturacağım kullanıcı oluştur fonksiyonunu, => auth klasöründe
//butona atamak için oluşturduğum fonksiyon. => register()

  Future<void> register(context) async {
    // kayıt düğmesine tıkladığımızda yapmak istediklerimiz:
    // auth service getiriyorum:
    final AuthService authService = AuthService();

    // Şifremiz ve onaylanmış olan şifremiz eşleşirse o zaman kayıt olma işlemi gerçekleşsin:

    if (passwordController.text == confirmPasswordController.text) {
      try {
        // Firebase üzerinde kullanıcı oluştur
        await authService.createUserWithEmailAndPassword(
            emailController.text, passwordController.text);
        // Kullanıcı oluşturma başarılı olur ise loginOrRegister yönledir.
        Navigator.of(context).pushNamed("/loginOrRegister");
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              e.toString(),
            ),
          ),
        );
      }
    } else {
      // Parolalar eşleşmiyorsa kullanıcıya uyarı göster:
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text(
            dontMatch,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
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
                if (value == null || value.isEmpty) {
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
              if (value == null || value.isEmpty) {
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
