import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tobeto_app/config/constant/theme/theme_manager.dart';

class IntroPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: ThemeManager.of(context).theme.primaryColor,
        child: Lottie.network(
            "https://lottie.host/69fe9d7f-aa92-428e-92c1-077bf9adca15/rtvpFqgIBd.json"));
  }
}
