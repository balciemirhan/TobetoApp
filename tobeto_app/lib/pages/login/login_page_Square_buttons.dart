import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/image.dart';
import 'package:tobeto_app/service/google_auth_service.dart';
import 'package:tobeto_app/config/constant/core/widget/square_auth_buttons.dart';

class LoginPageSquareButtons extends StatelessWidget {
  const LoginPageSquareButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SquareAuthButtons(
          imagePath: AppImage.googleButtonImage,
          onTap: () => GoogleAuthenticationService().signInWithGoogle(),
        ),
        const SizedBox(
          width: 20,
        ),
        SquareAuthButtons(
          imagePath: AppImage.appleButtonImage,
          onTap: () {},
        ),
      ],
    );
  }
}
