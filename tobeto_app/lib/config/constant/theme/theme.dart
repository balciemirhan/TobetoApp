import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/color.dart';

final class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.lightBg,
  );

  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.darkBg,
  );
}
