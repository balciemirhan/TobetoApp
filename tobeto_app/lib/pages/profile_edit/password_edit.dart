import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto_app/core/widget/bottom_sheet_widget.dart';
import 'package:tobeto_app/core/widget/dialog.dart';
import 'package:tobeto_app/core/widget/snackbar_widget.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';
import 'package:tobeto_app/pages/profile_edit/edit_button.dart';
import 'package:tobeto_app/pages/profile_edit/edit_textfield.dart';

class PasswordEdit extends StatelessWidget {
  const PasswordEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmNewPasswordController =
        TextEditingController();
    return Column(
      children: [
        EditTextField(
          label: "Yeni Şifre *",
          controller: newPasswordController,
        ),
        EditTextField(
          label: "Yeni Şifre Tekrar *",
          controller: confirmNewPasswordController,
        ),
        EditButton(
          text: "Şifre Değiştir",
          onTap: () {
            {
              if (newPasswordController.text.isEmpty ||
                  confirmNewPasswordController.text.isEmpty) {
                snackBarMessage(context, "Şifreler Boş Olamaz!");
              } else if (newPasswordController.text !=
                  confirmNewPasswordController.text) {
                snackBarMessage(context, "Şifreler Eşleşmiyor!");
              } else {
                context.read<AuthBloc>().add(ChangePassword(
                    newPassword: newPasswordController.text.trim(),
                    confirmNewPassword:
                        confirmNewPasswordController.text.trim()));

                showBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return BottomSheetWidget(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.network(
                              height: 140,
                              "https://lottie.host/2c283203-f174-42a8-a05d-b896fbb84615/4UoKEJ1hDn.json"),
                          AppTextTheme.xSmall(
                              "Şifre başarıyla değiştirildi.", context),
                          AppTextTheme.xSmall(
                              "Ana sayfaya yönlendiriliyorsunuz...", context),
                        ],
                      ));
                    });

                Future.delayed(const Duration(seconds: 5), () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/curved", (route) => false);
                });
              }
            }
          },
        ),
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
