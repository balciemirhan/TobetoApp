import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/image.dart';
import 'package:tobeto_app/service/google_auth_service.dart';
import 'package:tobeto_app/config/constant/core/widget/square_auth_buttons.dart';

class LoginPageSquareButtons extends StatelessWidget {
  const LoginPageSquareButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 70,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        /* itemExtent: 70, */
        scrollDirection: Axis.horizontal,
        children: [
          SquareAuthButtons(
            imagePath: AppImage.googleButtonImage,
            onTap: () => GoogleAuthenticationService().signInWithGoogle(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SquareAuthButtons(
              imagePath: AppImage.appleButtonImage,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
