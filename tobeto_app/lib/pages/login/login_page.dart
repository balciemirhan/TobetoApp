import 'package:flutter/material.dart';
import 'package:tobeto_app/constant/theme/text.dart';
import 'package:tobeto_app/pages/login/login_divider.dart';
import 'package:tobeto_app/pages/login/login_form.dart';
import 'package:tobeto_app/pages/login/login_page_Square_buttons.dart';
import 'package:tobeto_app/core/widget/now_bottom.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key, this.onTap}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double mHeight = mediaQueryData.size.height;
    final double mWidth = mediaQueryData.size.width;

    Brightness currentBrightness = Theme.of(context).brightness;
    String backgroundImage = currentBrightness == Brightness.light
        ? "assets/images/tobeto_background.gif"
        : "assets/images/login_dark.gif";

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(backgroundImage))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
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
                          text: AppText.member,
                          text2: AppText.registerNow,
                          onTap: onTap,
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
      ),
    );
  }
}
