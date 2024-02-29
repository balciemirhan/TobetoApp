import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:tobeto_app/core/widget/background_image.dart';
import 'package:tobeto_app/core/drawer/my_advanced_drawer.dart';
import 'package:tobeto_app/core/drawer/my_appbar.dart';
import 'package:tobeto_app/core/drawer/my_drawer.dart';
import 'package:tobeto_app/constant/theme/image.dart';
import 'package:tobeto_app/pages/announcement_survey/announcement_page.dart';
import 'package:tobeto_app/pages/announcement_survey/survey_page.dart';

class AnnouncementSurveyPage extends StatelessWidget {
  const AnnouncementSurveyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerController = AdvancedDrawerController();

    return MyAdvancedDrawer(
      drawer: MyDrawer(),
      controller: drawerController,
      child: BackgroundImage(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            DrawerTopBar(
              drawerController: drawerController,
              image: AppImage.tobetoLogo,
            ),
            const Expanded(flex: 1, child: AnnouncementPage()),
            const Expanded(flex: 1, child: SurveyPage())
          ],
        ),
      )),
    );
  }
}
