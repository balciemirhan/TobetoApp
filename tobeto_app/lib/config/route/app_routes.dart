// route = sayfa geçişleri yönetimi için kullanılır.
// typedef = tanımlı fonksiyonlar. ( Widget fonskiyo'nun tanımını kısalttım.)

import 'package:flutter/material.dart';

import 'package:tobeto_app/pages/home_page.dart';
import 'package:tobeto_app/pages/login_page.dart';
import 'package:tobeto_app/pages/onboarding_screen.dart';

typedef AppRouteMapFunction = Widget Function(BuildContext context);

final class AppRoute {
  const AppRoute._(); // Gizlilik için yapıldı

  static const String onboard = "/onboard";
  static const String login = "/login";
  static const String home = "/home";

  static Map<String, AppRouteMapFunction> routes = {
    // onboard:(context) => const OnBoardScreen();

    login: (context) => LoginPage(),
    home: (context) => HomePage(),
    onboard: (context) => OnbordingPage(),
  };
}

//  ekstradan ekledigim routelar daha sonradan yapicagimiz işlemler için.
// Navigator.of(context).pushNamed("/login") yapabilmek icin (sayfa geçişi)
// İlk ekrana geri dönmek için Navigator.pop()işlevi kullanın.
