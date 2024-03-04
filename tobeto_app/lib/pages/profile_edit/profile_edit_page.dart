import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tobeto_app/constant/theme/image.dart';
import 'package:tobeto_app/core/widget/background_image.dart';
import 'package:tobeto_app/core/widget/top_bar_widget_interval.dart';
import 'package:tobeto_app/pages/profile_edit/certificate_edit.dart';
import 'package:tobeto_app/pages/profile_edit/competence_edit.dart';
import 'package:tobeto_app/pages/profile_edit/education_edit.dart';
import 'package:tobeto_app/pages/profile_edit/foreign_language_edit.dart';
import 'package:tobeto_app/pages/profile_edit/password_edit.dart';
import 'package:tobeto_app/pages/profile_edit/person_edit.dart';
import 'package:tobeto_app/pages/profile_edit/social_edit.dart';
import 'package:tobeto_app/pages/profile_edit/work_edit.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BackgroundImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: DefaultTabController(
          length: 8,
          child: Column(
            children: [
              TopBarWidget(
                iconButton: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(FontAwesomeIcons.angleLeft)),
                titleText: "",
                image: Image(
                  image: const AssetImage(AppImage.edit),
                  color: theme.brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  height: 25,
                ),
              ),
              TabBar(
                splashBorderRadius: const BorderRadius.all(Radius.circular(30)),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.all(4),
                unselectedLabelColor: Colors.grey.shade700,
                labelColor: Colors.deepPurple,
                indicator: BoxDecoration(
                  color: Colors.grey.shade300,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(5, 5),
                      color: Colors.grey.shade500,
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                tabs: const [
                  Tab(icon: Icon(FontAwesomeIcons.solidUser)),
                  Tab(icon: Icon(FontAwesomeIcons.briefcase)),
                  Tab(icon: Icon(FontAwesomeIcons.graduationCap)),
                  Tab(icon: Icon(FontAwesomeIcons.solidStar)),
                  Tab(icon: Icon(FontAwesomeIcons.certificate)),
                  Tab(icon: Icon(FontAwesomeIcons.hashtag)),
                  Tab(icon: Icon(FontAwesomeIcons.globe)),
                  Tab(icon: Icon(FontAwesomeIcons.gear)),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    PersonEdit(),
                    WorkEdit(),
                    EducationEdit(),
                    CompetenceEdit(),
                    CertificateEdit(),
                    SocialEdit(),
                    ForeignLanguageEdit(),
                    PasswordEdit(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
