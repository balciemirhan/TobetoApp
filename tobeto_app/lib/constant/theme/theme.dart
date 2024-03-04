import 'package:flutter/material.dart';
import 'package:tobeto_app/constant/theme/color.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      background: AppColor.lightBg,
    ),
  );

  /* ------------- Dark theme ------------- */

  static final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      background: Color.fromARGB(255, 2, 7, 22),
    ),
  );
}
