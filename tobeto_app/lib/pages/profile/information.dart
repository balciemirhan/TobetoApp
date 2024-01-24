import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppText.notificatiOn)),
      body: const Center(child: Text(AppText.notification)),
    );
  }
}
