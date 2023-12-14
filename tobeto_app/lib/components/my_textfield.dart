// Farklı Kullanıcı arayüzü bileşenleri için oluşturulmuştur --> components:
// myText: tasarlamış olduğum text stili.

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;
  // ignore: prefer_typing_uninitialized_variables
  final prefixIcon;

  const MyTextField(
      {super.key,
      required this.controller, // kullanıcı'nın metin alanına yazdığı şeye erişmek için kurguladık.
      required this.hintText, // ipucu
      required this.obscureText, // şifre gizleme
      required this.prefixIcon // karakterleri gizler.
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 30,
              offset: Offset(28, 28),
              color: Colors.grey,
            )
          ]),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 143, 101, 215)),
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey[400],
              ),
              prefixIcon: prefixIcon,
            ),
          ),
        ));
  }
}
