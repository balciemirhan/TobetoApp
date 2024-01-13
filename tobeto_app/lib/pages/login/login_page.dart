import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tobeto_app/config/constant/login/login_image.dart';
import 'package:tobeto_app/pages/login/login_divider.dart';
import 'package:tobeto_app/pages/login/login_form.dart';
import 'package:tobeto_app/pages/login/login_logo.dart';
import 'package:tobeto_app/pages/login/login_now.dart';
import 'package:tobeto_app/widget/square_auth_buttons.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double mHeight = mediaQueryData.size.height;
    /* final double mWidth = mediaQueryData.size.width; */

    //Brightness brightness = Theme.of(context).brightness;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mHeight / 50),
        child: Stack(
          children: [
            Container(
              /* ----------------------- Login Animation Background -----------------------  */
              child: Lottie.network(
                height: mHeight / 2,
                loginBackgroundLottie,
              ),
            ),
            Center(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /* ----------------------- Login Tobeto Logo -----------------------  */
                    Padding(
                        padding: EdgeInsets.all(mHeight / 10),
                        child: const LoginLogo()),

                    /* ----------------------- Login Form -----------------------  */

                    LoginForm(formkey: formKey),

                    /* ----------------------- Login Divider -----------------------  */

                    const LoginDivider(),

                    /* --------  Square Auth Buttons (Google / Apple Authentication) --------  */

                    const SquareAuthButtons(),

                    /* ----------------------- Login Now -----------------------  */

                    const LoginNow()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
