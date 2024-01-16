import 'package:flutter/material.dart';
import 'package:tobeto_app/auth/google_auth_service.dart';
import 'package:tobeto_app/widget/square_auth_buttons.dart';

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
            imagePath: "assets/images/google.png",
            onTap: () => GoogleAuthenticationService().signInWithGoogle(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SquareAuthButtons(
              imagePath: "assets/images/apple.png",
              onTap: () {},
            ),
          ),
          SquareAuthButtons(
            imagePath: "assets/images/github_icon.png",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
