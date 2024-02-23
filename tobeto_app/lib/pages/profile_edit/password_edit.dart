import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto_app/config/constant/core/widget/dialog.dart';
import 'package:tobeto_app/pages/profile_edit/edit_button.dart';
import 'package:tobeto_app/pages/profile_edit/edit_textfield.dart';

class PasswordEdit extends StatelessWidget {
  const PasswordEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _newPasswordController =
        TextEditingController();
    final TextEditingController _confirmNewPasswordController =
        TextEditingController();
    return Column(
      children: [
        EditTextField(
          label: "Yeni Şifre *",
          controller: _newPasswordController,
        ),
        EditTextField(
          label: "Yeni Şifre Tekrar *",
          controller: _confirmNewPasswordController,
        ),
        EditButton(
            text: "Şifre Değiştir",
            onTap: () {
              context.read<AuthBloc>().add(ChangePassword(
                  newPassword: _newPasswordController.text.trim(),
                  confirmNewPassword:
                      _confirmNewPasswordController.text.trim()));
              Navigator.pushNamed(context, "/start");
            }),
        EditButton(
          text: "Üyeliği Sonlandır",
          color: Colors.redAccent,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const MyDialog(
                title: "Emin Misiniz?",
                color: Colors.white,
                imagePath: "assets/images/alert.gif",
              ),
            );
          },
        )
      ],
    );
  }
}
