import 'package:flutter/material.dart';

class AppText {
  //AppText._(); // Bu class'ın içerisindekilere yalnızca bu class'dan erişebilirsin anlamını taşıyor.

// Yalnızca static alanlar const olarak bildirilebilir. (static'lik bize sadece bu class'dan erişim iznini sağlar yani dışarıdan değiştirilemez.)
  static const String fontName = 'WorkSans';
  static const Color darkText = Color(0xFF253840);
  static const Color lightText = Color(0xFF4A6572);
  static const Color darkerText = Color(0xFF17262A);
  static const Color deepPurple = Colors.deepPurple;
  static const Color black54 = Colors.black54;
  static const Color black87 = Colors.black87;

  static const TextStyle display1 = TextStyle(
    // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: deepPurple,
  );

  static const TextStyle headline = TextStyle(
      // h5 -> headline
      fontFamily: fontName,
      fontWeight: FontWeight.w900,
      fontSize: 24,
      letterSpacing: 0.27,
      color: Colors.white,
      shadows: [
        Shadow(
          blurRadius: 20,
          color: deepPurple,
        ),
        Shadow(
          blurRadius: 20,
          color: deepPurple,
        ),
      ]);

  static const TextStyle title = TextStyle(
      // h6 -> title
      fontFamily: fontName,
      fontWeight: FontWeight.w900,
      fontSize: 18,
      letterSpacing: 0.18,
      color: Colors.white,
      shadows: [
        Shadow(
          blurRadius: 20,
          color: Colors.black,
        ),
        Shadow(
          blurRadius: 20,
          color: Colors.black,
        ),
      ]);

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );
  static const TextStyle body3 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 1,
    color: black54,
  );

  static const TextStyle body2 = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: black54,
  );

  static const TextStyle body1 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    letterSpacing: 1,
    color: black54,
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: black87, // was lightText
  );
}
