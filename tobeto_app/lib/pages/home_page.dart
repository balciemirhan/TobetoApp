import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tobeto_app/components/my_advanced_drawer.dart';
import 'package:tobeto_app/components/my_appbar.dart';
import 'package:tobeto_app/components/my_card.dart';
import 'package:tobeto_app/components/my_drawer.dart';
import 'package:tobeto_app/components/my_navigationbar.dart';
import 'package:tobeto_app/config/constant/theme/theme_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // pagecontroller
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final drawerController = AdvancedDrawerController();
    final themeManager = ThemeManager.of(context);

    return MyAdvancedDrawer(
        drawer: const MyDrawer(),
        controller: drawerController,
        child: Scaffold(
          backgroundColor: themeManager.theme.primaryColor,

          body: Center(
              child: Column(
            children: [
              MyAppbar(drawerController: drawerController),

              // ---------- Kurs Bölümü ----------
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment:
                      CrossAxisAlignment.end, // Tümünü gör hizalaması için
                  children: [
                    Text(
                      "Kurslar 😈",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "Tümünü gör",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(180, 155, 39, 176),
                      ),
                    ),
                  ],
                ),
              ),

              // ----- MyCard area -----
              // ignore: sized_box_for_whitespace

              Container(
                height: 300,
                // --> ListView yerine --> PageView
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  controller:
                      pageController, // denetleyici görebilmek için buraya koyduk.
                  children: const [
                    MyCard(),
                    MyCard(),
                    MyCard(),
                    MyCard(),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: 4,
                effect: const ExpandingDotsEffect(
                    activeDotColor: Color.fromARGB(91, 158, 158, 158),
                    dotColor: Colors.grey,
                    dotHeight: 15,
                    dotWidth: 15),
              ),
            ],
          )),

          // ------ Button area ------

          // tabs sekmeler --> alt gezinme çubuğundaki ögeler
          // Gnav -- > buton stilleri
          bottomNavigationBar: const MyNavigationBar(),
        ));
  }
}
