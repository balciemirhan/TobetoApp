import 'package:flutter/material.dart';

const tobetoLightIcon = "assets/images/tobeto-logo.png";
const tobetoDarkIcon = "assets/images/tobeto-logo-white.png";

String getLogo(Brightness brightness) {
  return brightness == Brightness.dark ? tobetoDarkIcon : tobetoLightIcon;
}

const loginBackgroundLottie =
    'https://lottie.host/54769455-e9f6-4606-b2e9-b7820b830330/pXqmIIHJW7.json';
