import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/pages/profile/personal/personal_widget.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersonalWidget(
        text: "Hakkımda",
        widget: AppTextTheme.small(
            AppText.about, fontWeight: FontWeight.normal, context));
  }
}
