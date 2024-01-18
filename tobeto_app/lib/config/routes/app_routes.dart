// route = sayfa geçişleri yönetimi için kullanılır.
// typedef = tanımlı fonksiyonlar. ( Widget fonskiyo'nun tanımını kısalttım.)

import 'package:flutter/material.dart';
import 'package:tobeto_app/auth/auth_gate.dart';
import 'package:tobeto_app/auth/login_or_register.dart';
import 'package:tobeto_app/pages/calendar_page.dart';
import 'package:tobeto_app/pages/course_screen/course_view_page.dart';
import 'package:tobeto_app/pages/curved_bar.dart/curved_button.dart';
import 'package:tobeto_app/pages/favourite_screens/favourite_page.dart';
import 'package:tobeto_app/pages/forgot/forgot_password_page.dart';
import 'package:tobeto_app/pages/home_screens/home_page.dart';
import 'package:tobeto_app/pages/login/login_page.dart';
import 'package:tobeto_app/pages/onboard_screen/onboarding_animation.dart';
import 'package:tobeto_app/pages/profile_edit_screen/profile_edit_page.dart';
import 'package:tobeto_app/pages/profile_screen/profile_page.dart';
import 'package:tobeto_app/pages/search_screen/search_page.dart';
import 'package:tobeto_app/pages/setting_screen/setting_page.dart';
import 'package:tobeto_app/pages/view_more_screen/view_more_page.dart';

typedef AppRouteMapFunction = Widget Function(BuildContext context);

final class AppRoute {
  const AppRoute._(); // Gizlilik için yapıldı

  static const String onboard = "/onboard";
  static const String login = "/login";
  static const String home = "/home";
  static const String search = "/search";
  static const String favourite = "/favourite";
  static const String profile = "/profile";
  static const String curved = "/curved";
  static const String viewmore = "/viewmore";
  static const String course = "/course";
  static const String profiledit = "/profiledit";
  static const String loginOrRegister = "/loginOrRegister";
  static const String authGate = "/authGate";
  static const String calendar = "/calendar";
  static const String setting = "/setting";
  static const String forgot = "/forgot";

  static Map<String, AppRouteMapFunction> routes = {
    // onboard:(context) => const OnBoardScreen();

    login: (context) => LoginPage(),
    home: (context) => const HomePage(),
    onboard: (context) => OnboardingAnimation(),
    search: (context) => const SearchPage(),
    favourite: (context) => const FavouritePage(),
    profile: (context) => const ProfilePage(),
    curved: (context) => const CurvedNavBarWidget(),
    viewmore: (context) => const ViewMorePage(),
    course: (context) => const CourseViewPage(),
    profiledit: (context) => const ProfileEditPage(),
    loginOrRegister: (context) => const LoginOrRegister(),
    authGate: (context) => const AuthGate(),
    calendar: (context) => const CalendarPage(),
    setting: (context) => const SettingPage(),
    forgot: (context) => ForgotPasswordPage(),
  };
}

//  ekstradan ekledigim routelar daha sonradan yapicagimiz işlemler için.
// Navigator.of(context).pushNamed("/login") yapabilmek icin (sayfa geçişi)
// İlk ekrana geri dönmek için Navigator.pop()işlevi kullanın.
