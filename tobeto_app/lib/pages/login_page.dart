import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tobeto_app/components/my_button.dart';

import 'package:tobeto_app/components/my_textfield.dart';
import 'package:tobeto_app/components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  // ignore: non_constant_identifier_names
  void SignUserIn() {} // kayıt ekranı'nı döndüren fonksiyon.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // Column'u SafeArea widget ile sarmaladım. --> çentik alanından kaçınmak için.
      // body: stack --> animasyon - blur - tasarım kısmı (üst üste katman yapısını sağlar.)
      body: Stack(
        children: <Widget>[
          // ------- animasyonlu bg -------
          Container(
            child: Lottie.network(
                height: 400,
                'https://lottie.host/54769455-e9f6-4606-b2e9-b7820b830330/pXqmIIHJW7.json'),
          ), // lottie animasyon

          // ------- animasyonlu bg -------
          // column --> BackdropFilter
          Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 105),

                  // logo
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 30,
                          offset: Offset(28, 28),
                          color: Colors.grey,
                        ),
                        BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 9,
                          // offset: Offset(8, 8),
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

                  // Tobeto title
                  const Text(
                    "TOBETO",
                    style: TextStyle(
                        color: Color.fromARGB(181, 255, 255, 255),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          BoxShadow(
                            color: Color.fromARGB(255, 164, 161, 161),
                            blurRadius: 25,
                            offset: Offset(2, 2),
                            // spreadRadius: 10,
                          ),
                          BoxShadow(
                            color: Color.fromARGB(255, 199, 195, 195),
                            blurRadius: 9,
                            // offset: Offset(2, 2),
                            // spreadRadius: 10,
                          ),
                        ]),
                  ),

                  const SizedBox(height: 20),

                  //welcome back
                  // Text(
                  //   "Tekrar hoş geldiniz, özlendiniz!",
                  //   style: TextStyle(
                  //     color: Colors.grey[700],
                  //     fontSize: 16,
                  //   ),
                  // ),

                  const SizedBox(height: 50),

                  // username textfiled
                  MyTextField(
                    controller: usernameController,
                    hintText: "Adınız",
                    obscureText: false,
                    prefixIcon: const Icon(Icons.account_box_rounded),
                  ),

                  const SizedBox(height: 15),

                  // password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: "Şifreniz",
                    obscureText: true,
                    prefixIcon: const Icon(Icons.lock_rounded),
                  ),

                  const SizedBox(height: 15),

                  // forgot password
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

                  const SizedBox(height: 25),

                  // sign in button
                  MyButton(
                    onTap: SignUserIn,
                  ),

                  const SizedBox(height: 50),

                  // or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: <Widget>[
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

                  const SizedBox(height: 40),

                  // google + apple sign in buttons
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google button
                      SquareTile(
                        imagePath: 'assets/images/google.png',
                      ),

                      SizedBox(width: 20),

                      // Apple Button
                      SquareTile(
                        imagePath: 'assets/images/apple.png',
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // not a member? register now
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
    );
  }
}
