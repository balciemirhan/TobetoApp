import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tobeto_app/config/constant/theme/theme_manager.dart';

class IntroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeManager.of(context).theme.primaryColor,
      child: Lottie.network(
          "https://lottie.host/f1017ec9-445e-4dd6-97d0-32c68b4d97b7/qqALjaG2Bd.json"),
    );
  }
}
