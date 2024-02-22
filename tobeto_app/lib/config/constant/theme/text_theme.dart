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

  static textStyleXSmall(bool isLight, FontWeight fontWeight) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: 15,
      letterSpacing: 0.4,
      color: isLight ? Colors.black : Colors.white,
    );
  }

  static Widget xSmall(String text, BuildContext context,
      {TextAlign? textAlign, FontWeight? fontWeight}) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Text(
      text,
      textAlign: textAlign,
      style: textStyleXSmall(isLight, fontWeight ?? FontWeight.bold),
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

  static textStyleFont(bool isLight, FontWeight fontWeight) {
    return GoogleFonts.concertOne(
        textStyle: TextStyle(
      fontWeight: fontWeight,
      fontSize: 30,
      letterSpacing: 2,
      color: isLight ? Colors.deepPurple.shade800 : Colors.white,
    ));
  }

  static Widget font(String text, BuildContext context,
      {TextAlign? textAlign, FontWeight? fontWeight}) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Text(
      text,
      textAlign: textAlign,
      style: textStyleFont(isLight, fontWeight ?? FontWeight.w600),
    );
  }
}
