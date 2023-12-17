import 'package:flutter/material.dart';
import 'package:tobeto_app/components/box_shadow.dart';
import 'package:tobeto_app/config/constant/theme/theme_manager.dart';

class SquareTile extends StatelessWidget {
  final String imagePath; // görüntü yolunun dizesi

  const SquareTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // dinamaik blur - offset
    final themeManager = ThemeManager.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 143, 101, 215)),
          borderRadius: BorderRadius.circular(16),
          color: themeManager.theme.canvasColor,
          boxShadow: [
            //   BoxShadowLogin2().boxShadowLogin2,
            BoxShadowLogin(context).boxShadowLogin
          ]),
      child: Image.asset(
        imagePath,
        height: 35,
      ),
    );
  }
}
