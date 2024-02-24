import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/color.dart';

class AppTheme {
  AppTheme._();

  /* ------------- Light Theme ------------- */

  static final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      background: AppColor.lightBg,

      /* primary: Color.fromARGB(255, 0, 0, 0),
      onBackground: Colors.blue,
      onPrimary: Colors.white, */
    ),
  );

  /* ------------- Dark theme ------------- */

  static final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      background: Color.fromARGB(255, 2, 7, 22),
      /* primary: Color.fromARGB(255, 255, 255, 255),
      onBackground: Colors.deepPurple,
      onPrimary: Colors.black, */
    ),
  );
}
