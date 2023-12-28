import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tobeto_app/config/constant/theme/color.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColor.lightBg,
        child: Lottie.network(
            "https://lottie.host/69fe9d7f-aa92-428e-92c1-077bf9adca15/rtvpFqgIBd.json"));
  }
}
