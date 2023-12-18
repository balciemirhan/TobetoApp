import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';

class OnboardingPages extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
        imageUrl: "assets/images/apple.png",
        title: "denme",
        subTitle: "subTitle"),
    Introduction(
        imageUrl: "assets/images/apple.png",
        title: "denme1",
        subTitle: "subTitle1"),
    Introduction(
        imageUrl: "assets/images/apple.png",
        title: "denme2",
        subTitle: "subTitle2"),
  ];
  // const OnboardingPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: list,
      backgroudColor: Colors.deepPurpleAccent,
      foregroundColor: Colors.purple,
      skipTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      onTapSkipButton: () => Navigator.of(context).pushNamed("/login"),
    );
  }
}
