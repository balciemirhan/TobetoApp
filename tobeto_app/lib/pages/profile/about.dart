import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/pages/profile/personal_widget.dart';

class About extends StatelessWidget {
  const About({Key? key, required this.description}) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return ProfilWidget(
        text: "Hakkımda",
        widget: AppTextTheme.xSmall(
            description, fontWeight: FontWeight.normal, context));
  }
}
