import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tobeto_app/config/routes/app_routes.dart';
import 'package:tobeto_app/pages/onboard/onboard_model.dart';

class OnboardPage extends StatelessWidget {
  final PageData page;

  const OnboardPage({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(16.0),
          child: Lottie.network(page.url),
        ),
        ElevatedButton(
          onPressed: () {
            final prefs = SharedPreferences.getInstance();
            prefs.then((value) {
              value.setBool('onboarding_completed', true);
            });
            Navigator.pushReplacementNamed(context, AppRoute.start);
          },
          child: const Text('Tamamla'),
        ),
      ],
    );
  }
}
