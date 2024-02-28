import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tobeto_app/data/onboard_data.dart';
import 'package:tobeto_app/pages/onboard/onboard_page.dart';
import 'package:tobeto_app/pages/start/start_page.dart';

class OnboardingAnimation extends StatelessWidget {
  OnboardingAnimation({Key? key}) : super(key: key); // const hata verdi

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ConcentricPageView(
        pageSnapping: false, // Sayfa Yakalama
        colors: pages.map((p) => p.bgColor).toList(),
        radius: screenWidth * 0.1,
        nextButtonBuilder: (context) => Padding(
          padding: const EdgeInsets.only(left: 3),
          child: GestureDetector(
            onTap: () {
              final currentIndex = _pageController.page ?? 0;
              if (currentIndex == pages.length - 1) {
                final prefs = SharedPreferences.getInstance();
                prefs.then((value) {
                  value.setBool('onboarding_completed', true);
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StartPage()),
                );
              } else {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Icon(
              Icons.navigate_next,
              size: screenWidth * 0.08,
            ),
          ),
        ),
        scaleFactor: 2,
        itemBuilder: (index) {
          final page = pages[index % pages.length];
          return SafeArea(
            child: OnboardPage(page: page),
          );
        },
        pageController: _pageController,
      ),
    );
  }
}
