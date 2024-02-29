import 'package:flutter/material.dart';

import 'package:tobeto_app/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/user_model.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
    required this.user,
  }) : super(key: key);
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: user.name != null
            ? AppTextTheme.concertOne("Hos Geldin, ${user.name}", context)
            : AppTextTheme.concertOne("Hos Geldin 👋", context));
  }
}
