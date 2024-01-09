import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tobeto_app/config/constant/core/global_button.dart';
import 'package:tobeto_app/config/constant/core/global_passwordField.dart';
import 'package:tobeto_app/config/constant/login/login_image.dart';
import 'package:tobeto_app/pages/login_screen/login_logo.dart';
import 'package:tobeto_app/pages/login_screen/togin_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void SignUserIn() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double mHeight = mediaQueryData.size.height;
    final double mWidth = mediaQueryData.size.width;

    //Brightness brightness = Theme.of(context).brightness;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mHeight / 50),
        child: Stack(
          children: [
            Container(
                child: Lottie.network(
              height: mHeight / 2,
              loginBackgroundLottie,
            )),
            Center(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(mHeight / 10),
                        child: const LoginLogo()),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          logintextfield(),
                          SizedBox(height: mHeight / 70),
                          GlobalPasswordField(controller: passwordController),
                          SizedBox(height: mHeight / 50),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Şifremi Unuttum?",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                          SizedBox(height: mHeight / 50),
                          GlobalButton(
                            width: mWidth / 1.2,
                            text: "Oturum Aç",
                            onTap: (() {
                              if (_formKey.currentState!.validate()) {}
                            }),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: mHeight / 40),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Devam edin",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GlobalButton(
                          imagePath: 'assets/images/google.png',
                          onTap: () {},
                        ),
                        const SizedBox(width: 20),
                        GlobalButton(
                          imagePath: 'assets/images/apple.png',
                          onTap: () {},
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Üye değil misin?",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "Şimdi kaydolun",
                          style: TextStyle(
                            color: Color.fromARGB(255, 143, 101, 215),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
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
