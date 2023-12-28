import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Lottie.network(
            "https://lottie.host/69fe9d7f-aa92-428e-92c1-077bf9adca15/rtvpFqgIBd.json"));
  }
}
