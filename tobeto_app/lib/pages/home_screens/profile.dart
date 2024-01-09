import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Hoş Geldin Kullanıcı ", style: AppText.headline),
    );
  }
}
