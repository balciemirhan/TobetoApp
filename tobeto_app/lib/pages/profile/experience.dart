import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/pages/profile/personal_widget.dart';

class Experience extends StatelessWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfilWidget(
      text: "Deneyim",
      widget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("TOBETO"),
              Text("Yazılım"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Eğitim Danışmanlığı"),
              Text("İstanbul"),
            ],
          ),
          Text("20/03/2020 - 05/01/2022"),
        ],
      ),
    );
  }
}
