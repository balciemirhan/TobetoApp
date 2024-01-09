import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/color.dart';

final class AppTheme {
  static ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: LightColor.lightBg,
      inputDecorationTheme: InputDecorationTheme(
          fillColor: LightColor.white,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: LightColor.deepPurple)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: LightColor.white)),
          hintStyle: TextStyle(color: LightColor.black)));

  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: DarkColor.darkBg,
  );
}
