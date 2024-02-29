import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  // <---------------------------------- text xxSmall ---------------------------------->

  static textStylexXSmall(bool isLight, FontWeight fontWeight) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: 12,
      letterSpacing: 0.4,
      color: isLight ? Colors.black : Colors.white,
    );
  }

  static Widget xxSmall(String text, BuildContext context,
      {TextAlign? textAlign, FontWeight? fontWeight}) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Text(
      text,
      textAlign: textAlign,
      style: textStylexXSmall(isLight, fontWeight ?? FontWeight.bold),
    );
  }

// <---------------------------------- text xSmall ---------------------------------->

  static textStyleXSmall(bool isLight, FontWeight fontWeight, Color color) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: 15,
      letterSpacing: 0.4,
      color: color,
    );
  }

  static Widget xSmall(String text, BuildContext context,
      {TextAlign? textAlign, FontWeight? fontWeight, Color? color}) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Text(
      text,
      textAlign: textAlign,
      style: textStyleXSmall(isLight, fontWeight ?? FontWeight.bold,
          isLight ? Colors.black : Colors.white),
    );
  }

// <---------------------------------- text Small ---------------------------------->

  static textStyleSmall(bool isLight, FontWeight fontWeight) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: 18,
      letterSpacing: 0.4,
      color: isLight ? Colors.black : Colors.white,
    );
  }

  static Widget small(String text, BuildContext context,
      {TextAlign? textAlign, FontWeight? fontWeight}) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Text(
      text,
      textAlign: textAlign,
      style: textStyleSmall(isLight, fontWeight ?? FontWeight.bold),
    );
  }

// <---------------------------------- text Medium ---------------------------------->

  static textStyleMedium(bool isLight, FontWeight fontWeight) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: 20,
      letterSpacing: 0.4,
      color: isLight ? Colors.black : Colors.white,
    );
  }

  static Widget medium(String text, BuildContext context,
      {TextAlign? textAlign, FontWeight? fontWeight}) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Text(
      text,
      textAlign: textAlign,
      style: textStyleMedium(isLight, fontWeight ?? FontWeight.bold),
    );
  }

// <---------------------------------- text Large ---------------------------------->

  static textStyleLarge(bool isLight, FontWeight fontWeight) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: 25,
      letterSpacing: 0.4,
      color: isLight ? Colors.black : Colors.white,
    );
  }

  static Widget large(String text, BuildContext context,
      {TextAlign? textAlign, FontWeight? fontWeight}) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Text(
      text,
      textAlign: textAlign,
      style: textStyleLarge(isLight, fontWeight ?? FontWeight.bold),
    );
  }

  // <---------------------------------- text Xlarge ---------------------------------->

  static textStyleXLarge(bool isLight, FontWeight fontWeight) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: 35,
      letterSpacing: 0.4,
      color: isLight ? Colors.black : Colors.white,
    );
  }

  static Widget xLarge(String text, BuildContext context,
      {TextAlign? textAlign, FontWeight? fontWeight}) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Text(
      text,
      textAlign: textAlign,
      style: textStyleXLarge(isLight, fontWeight ?? FontWeight.bold),
    );
  }

  static textStyleLondrinaShadow(bool isLight) {
    return GoogleFonts.londrinaShadow(
        textStyle: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 30,
      letterSpacing: 3,
      color: isLight ? Colors.deepPurple.shade800 : Colors.white,
    ));
  }

  static Widget londrinaShadow(String text, BuildContext context,
      {TextAlign? textAlign}) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Text(
      text,
      textAlign: textAlign,
      style: textStyleLondrinaShadow(isLight),
    );
  }

  static textStyleConcertOne(bool isLight, double fontSize) {
    return GoogleFonts.concertOne(
        textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      letterSpacing: 1,
      color: isLight ? Colors.deepPurple.shade800 : Colors.white70,
    ));
  }

  static Widget concertOne(String text, BuildContext context,
      {TextAlign? textAlign, double? fontSize}) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Text(
      text,
      textAlign: textAlign,
      style: textStyleConcertOne(isLight, fontSize ?? 25),
    );
  }
}
