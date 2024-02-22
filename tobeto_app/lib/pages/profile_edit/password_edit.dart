import 'package:flutter/material.dart';
import 'package:tobeto_app/pages/profile_edit/edit_button.dart';
import 'package:tobeto_app/pages/profile_edit/edit_textfield.dart';

class PasswordEdit extends StatelessWidget {
  const PasswordEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const EditTextField(label: "Eski Şifre *"),
        const EditTextField(label: "Yeni Şifre *"),
        const EditTextField(label: "Yeni Şifre Tekrar *"),
        EditButton(text: "Şifre Değiştir", onTap: () {}),
        EditButton(
            text: "Üyeliği Sonlandır", color: Colors.redAccent, onTap: () {})
      ],
    );
  }
}
