import 'package:flutter/material.dart';

final class LightTheme {
  const LightTheme._(); // dışarıdan erişim olmasın. (private)

// copyWith = ön ayarları hazır getirir. <--> primaryColor: Colors.white,
  static final ThemeData theme = ThemeData.light(useMaterial3: true).copyWith(
      primaryColor: Colors.white,
      cardColor: Colors.deepPurple.shade200,
      scaffoldBackgroundColor: Colors.white,
      shadowColor: Colors.grey,
      canvasColor: Colors.grey[200],
      indicatorColor: Colors.black);
}
