import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/pages/profile/personal_widget.dart';

class Competence extends StatelessWidget {
  const Competence({Key? key}) : super(key: key);

  competence(BuildContext context, {required String text}) {
    return Container(
      alignment: Alignment.centerLeft,
      child: AppTextTheme.small(text, fontWeight: FontWeight.normal, context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProfilWidget(
        text: "Yetkinliklerim",
        widget: Column(
          children: [
            competence(context, text: "Flutter"),
            competence(context, text: "SQL"),
            competence(context, text: "C#"),
            competence(context, text: "Aktif Öğrenme"),
            competence(context, text: "Algoritma"),
            competence(context, text: "SQL")
          ],
        ));
  }
}
