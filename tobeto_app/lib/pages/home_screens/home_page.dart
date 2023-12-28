import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import 'package:tobeto_app/components/drawer/my_advanced_drawer.dart';
import 'package:tobeto_app/components/drawer/my_appbar.dart';
import 'package:tobeto_app/components/drawer/my_drawer.dart';

import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/pages/home_screens/Profile_container.dart';
import 'package:tobeto_app/pages/home_screens/bottom_widget.dart';
import 'package:tobeto_app/pages/home_screens/card_exam.dart';
import 'package:tobeto_app/pages/home_screens/card_tab.dart';
import 'package:tobeto_app/pages/home_screens/homepage_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final drawerController = AdvancedDrawerController();

    return MyAdvancedDrawer(
      drawer: const MyDrawer(),
      controller: drawerController,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyAppbar(drawerController: drawerController),

              // ------------ En baştaki TOBETO Renkli yazısı ------------
              const HomepageRichText(),
              const Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0),
                child: Text(
                  introduction,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // ------------ İstanbul Kodluyor resmi, yazı, ve sekme geçişleri ------------
              // TAB BAR
              const CardTab(),
              const Padding(padding: EdgeInsets.all(5)),

              // Sınavlarım kartı
              const CardExam(),
              const Padding(padding: EdgeInsets.all(5)),

              //Profilini Oluştur Kutucuğu
              const ProfileContainer(),
              const ProfileContainer(),
              const ProfileContainer(),

              const Padding(padding: EdgeInsets.all(5)),
              //En alttaki BottomBar tasarımı, tobeto img ve bize ulaşın butonu
              const BottomWidget()
            ],
          ),
        ),
      ),
    );
  }
}
