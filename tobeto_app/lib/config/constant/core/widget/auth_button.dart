import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';

// Oluşturacağım bu AuthButton'u widgetını login Formda açmam gerekiyor. Ki formu validate edebilsin.!!!

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.formKey,
    required this.buttonTitle,
    required this.auth,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final String buttonTitle;
  final Future<void> Function() auth;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return GestureDetector(
      // butona basıldığında gerçekleşmesini istediklerim:
      // 1- Formu validate etmesi.
      // 2- save etmesi
      // 3- Firebase ile login tarafında giriş. Register tarafında ise kullanıcı oluşturma durumu.
      onTap: () {
        formKey.currentState!.validate(); // 1. durum
        formKey.currentState!.save(); // 2. durum
        auth(); // 3. durum
      },
      child: NeuBox(
        width: mediaQuery.width * 0.8,
        height: mediaQuery.height * 0.08,
        child: Container(
          child: Center(
            child: Text(buttonTitle),
          ),
        ),
      ),
    );
  }
}
