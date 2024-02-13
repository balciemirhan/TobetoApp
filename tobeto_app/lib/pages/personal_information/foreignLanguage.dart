import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';

import 'package:tobeto_app/pages/personal_information/personal_widget.dart';

class ForeignLanguage extends StatelessWidget {
  const ForeignLanguage({Key? key}) : super(key: key);

  foreignLanguage(BuildContext context,
      {required String language, required String level}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.language,
        ),
        Column(
          children: [
            AppTextTheme.small(
                language, fontWeight: FontWeight.normal, context),
            AppTextTheme.xSmall(level, fontWeight: FontWeight.normal, context),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PersonalWidget(
        text: "Yabancı Dillerim",
        widget: Column(
          children: [
            foreignLanguage(context,
                language: "İngilizce", level: "Orta Seviye ( B1, B2)")
          ],
        ));
  }
}
