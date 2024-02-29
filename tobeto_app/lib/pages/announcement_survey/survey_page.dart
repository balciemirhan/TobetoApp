import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Lottie.network(
            fit: BoxFit.contain,
            "https://lottie.host/2bda282a-2542-404a-8faf-a93864c85de2/LgucCImMo2.json"),
        Column(children: [
          AppTextTheme.londrinaShadow("Anket", context),
        ])
      ],
    );
  }
}
