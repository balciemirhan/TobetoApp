import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/pages/profile/personal_widget.dart';

class Education extends StatelessWidget {
  const Education({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfilWidget(
      text: "Eğitim",
      widget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Kocaeli Üniversitesi"),
              Text("Lisans"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Yazılım Mühendisliği"),
              Text("İstanbul"),
            ],
          ),
          Text("20/03/2020 - 05/01/2022"),
        ],
      ),
    );
  }
}
