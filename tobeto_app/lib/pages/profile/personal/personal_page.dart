import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/top_bar_widget.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/pages/profile/personal/about.dart';
import 'package:tobeto_app/pages/profile/personal/certificate.dart';
import 'package:tobeto_app/pages/profile/personal/competence.dart';
import 'package:tobeto_app/pages/profile/personal/foreignLanguage.dart';
import 'package:tobeto_app/pages/profile/personal/socialMedia.dart';

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
                TopBarWidget(
                    iconButton: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/profiledit");
                        },
                        icon: const Icon(Icons.edit)),
                    titleText: "Bilgilerim"),
                const About(),
                const Competence(),
                const ForeignLanguage(),
                const Certificate(),
                const SocialMedia()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
