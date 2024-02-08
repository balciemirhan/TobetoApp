import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/pages/profile/personal/personal_widget.dart';

class Certificate extends StatelessWidget {
  const Certificate({Key? key}) : super(key: key);

  certificate(BuildContext context, {required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppTextTheme.small(text, fontWeight: FontWeight.normal, context),
        const Icon(Icons.picture_as_pdf_outlined),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PersonalWidget(
        text: "Sertifikalarım",
        widget: Column(children: [
          certificate(context, text: "Sql.pdf"),
          certificate(context, text: "Python.pdf"),
          certificate(context, text: "Asp.NET.pdf"),
          certificate(context, text: "C#.pdf"),
        ]));
  }
}
