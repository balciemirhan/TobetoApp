import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tobeto_app/components/box_shadow.dart';
import 'package:tobeto_app/components/global_passwordField.dart';
import 'package:tobeto_app/components/global_textfield.dart';
import 'package:tobeto_app/components/my_button.dart';
import 'package:tobeto_app/components/my_textfield.dart';
import 'package:tobeto_app/components/my_textfield2.dart';
import 'package:tobeto_app/components/square_tile.dart';
import 'package:tobeto_app/config/constant/theme/theme_manager.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void SignUserIn() {}

  @override
  Widget build(BuildContext context) {
    final themeManager = ThemeManager.of(context);

    return Expanded(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: themeManager.theme.primaryColor,
        body: Stack(
          children: [
            Container(
              child: Lottie.network(
                  height: 400,
                  'https://lottie.host/54769455-e9f6-4606-b2e9-b7820b830330/pXqmIIHJW7.json'),
            ),
            Center(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadowLogin(context).boxShadowLogin,
                                const BoxShadow(
                                  spreadRadius: 3,
                                  blurRadius: 9,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                )
                              ],
                            ),
                            child: const Image(
                              image: AssetImage(
                                "assets/images/tobeto-logo.png",
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            "TOBETO",
                            style: GoogleFonts.concertOne(
                              textStyle: const TextStyle(
                                  color: Color.fromARGB(181, 255, 255, 255),
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 158, 154, 154),
                                      blurRadius: 25,
                                      offset: Offset(2, 2),
                                    ),
                                    BoxShadow(
                                      color: Color.fromARGB(255, 165, 164, 164),
                                      blurRadius: 15,
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        GlobalTextField(
                            controller: usernameController,
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: themeManager.theme.indicatorColor,
                            ),
                            hintText: "Adınız"),
                        const SizedBox(height: 15),
                        GlobalPasswordField(controller: passwordController),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Şifremi Unuttum?",
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        MyButton(
                          onTap: SignUserIn,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SquareTile(
                          imagePath: 'assets/images/google.png',
                        ),
                        SizedBox(width: 20),
                        SquareTile(
                          imagePath: 'assets/images/apple.png',
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
