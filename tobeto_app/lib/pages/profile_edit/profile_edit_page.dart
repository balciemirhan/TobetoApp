import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/pages/profile_edit/certificate_page.dart';
import 'package:tobeto_app/pages/profile_edit/competence_page.dart';
import 'package:tobeto_app/pages/profile_edit/person_page.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(7),
            child: InkWell(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded)),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(7),
              child: InkWell(
                child: IconButton(
                    onPressed: () {
                      // Değişiklikleri kaydet
                    },
                    icon: const Icon(
                      Icons.check_rounded,
                      size: 35,
                      color: Colors.deepPurple,
                    )),
              ),
            ),
          ],
          bottom: TabBar(
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
                        color: Colors.grey.shade500)
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              tabs: const [
                Tab(icon: Icon(Icons.person_outline_rounded)),
                Tab(icon: Icon(Icons.menu_book_rounded)),
                Tab(icon: Icon(Icons.ac_unit_rounded)),
                Tab(icon: Icon(Icons.card_membership)),
                Tab(icon: Icon(Icons.adjust))
              ]),
        ),
        body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              PersonPage(),
              CompetencePage(),
              CertificatePage(),
              Center(
                child: Text(AppText.fourthPage),
              ),
              Center(
                child: Text(AppText.fifthPage),
              )
            ]),
      ),
    );
  }
}
