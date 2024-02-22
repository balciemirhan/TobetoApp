import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tobeto_app/config/constant/core/widget/top_bar_widget_interval.dart';
import 'package:tobeto_app/pages/announcement_survey/announcement_page.dart';
import 'package:tobeto_app/pages/announcement_survey/survey_page.dart';

class AnnouncementSurveyPage extends StatelessWidget {
  const AnnouncementSurveyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/light_background.gif"))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              TopBarWidgetInterval(
                  leadingIcon: const Icon(FontAwesomeIcons.solidBell),
                  titleText: "",
                  iconButton: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(FontAwesomeIcons.angleLeft))),
              const Expanded(flex: 1, child: AnnouncementPage()),
              const Expanded(flex: 1, child: SurveyPage())
            ],
          ),
        ));
  }
}
