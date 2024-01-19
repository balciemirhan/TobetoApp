import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tobeto_app/config/constant/login/login_image.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/pages/login/login_divider.dart';
import 'package:tobeto_app/pages/login/login_form.dart';
import 'package:tobeto_app/pages/login/login_logo.dart';
import 'package:tobeto_app/pages/login/login_page_Square_buttons.dart';
import 'package:tobeto_app/widget/now_bottom.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key, this.onTap}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double mHeight = mediaQueryData.size.height;
    final double mWidth = mediaQueryData.size.width;

    //Brightness brightness = Theme.of(context).brightness;

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/tobeto_background.gif"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(
              left: mWidth / 50, right: mWidth / 50, top: mHeight / 2.8),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /* ----------------------- Login Form -----------------------  */

                    LoginForm(formkey: formKey),

                    /* ----------------------- Login Divider -----------------------  */

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: mHeight / 25),
                      child: const LoginDivider(),
                    ),

                    /* --------  Square Auth Buttons (Google / Apple Authentication) --------  */

                    const LoginPageSquareButtons(),

                    /* ----------------------- Login Now -----------------------  */

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: NowBottom(
                        text: member,
                        text2: registerNow,
                        onTap: () => onTap!(),
                      ),
                    )
                    /* const LoginNow() */
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
