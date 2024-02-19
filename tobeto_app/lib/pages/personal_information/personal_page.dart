import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/top_bar_widget_interval.dart';
import 'package:tobeto_app/pages/personal_information/about.dart';
import 'package:tobeto_app/pages/personal_information/certificate.dart';
import 'package:tobeto_app/pages/personal_information/competence.dart';
import 'package:tobeto_app/pages/personal_information/exams.dart';
import 'package:tobeto_app/pages/personal_information/foreignLanguage.dart';
import 'package:tobeto_app/pages/personal_information/socialMedia.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopBarWidgetInterval(
                  iconButton: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                  titleText: "Bilgilerim",
                  iconButton2: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/profiledit");
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.red,
                      )),
                ),
                const About(),
                const Competence(),
                const ForeignLanguage(),
                const Certificate(),
                const SocialMedia(),
                  Exams(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
