import 'package:flutter/material.dart';

// class ---> kütüphane

final class DarkTheme {
  const DarkTheme._(); // dışarıdan erişim olmasın. (private)

// copyWith = ön ayarları hazır getirir. <--> primaryColor: Colors.white,
  static final ThemeData theme = ThemeData.dark(useMaterial3: true).copyWith(
    primaryColor: Color.fromRGBO(22, 26, 48, 1), //arkaplan 4.numara global
    cardColor: Colors.deepPurple, //drawer + container
    scaffoldBackgroundColor: Color.fromARGB(255, 6, 177, 207),
    canvasColor: Color.fromRGBO(182, 187, 196, 1), //textField 2.numara
    shadowColor: Colors.deepPurple, //shadow
    indicatorColor: Color.fromRGBO(49, 48, 77, 1), //3.numara global
    highlightColor: Color.fromRGBO(240, 236, 229, 1),
  ); //1.numaralı buton
}
