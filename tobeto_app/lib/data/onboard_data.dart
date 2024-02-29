import 'package:flutter/material.dart';
import 'package:tobeto_app/constant/theme/image.dart';
import 'package:tobeto_app/models/onboard_model.dart';

final pages = [
  const PageData(
    url: AppImage.onBoardGifFirst,
    bgColor: Color.fromARGB(255, 179, 157, 219),
    btnColor: Colors.deepPurpleAccent,
  ),
  const PageData(
    url: AppImage.onBoardGifLast,
    bgColor: Colors.deepPurpleAccent,
    btnColor: Color.fromARGB(255, 179, 157, 219),
  ),
];
