// route = sayfa geçişleri yönetimi için kullanılır.
// typedef = tanımlı fonksiyonlar. ( Widget fonskiyo'nun tanımını kısalttım.)
import 'package:flutter/material.dart';
import 'package:tobeto_app/pages/calendar/calendar_page.dart';
import 'package:tobeto_app/pages/catalog/catalog_page.dart';
import 'package:tobeto_app/pages/course/course_view_page.dart';
import 'package:tobeto_app/pages/curved/curved_button.dart';
import 'package:tobeto_app/pages/home/home_page.dart';
import 'package:tobeto_app/pages/login/login_page.dart';
import 'package:tobeto_app/pages/note/note_page.dart';
import 'package:tobeto_app/pages/onboard/onboarding_animation.dart';
import 'package:tobeto_app/pages/personal_information/personal_page.dart';
import 'package:tobeto_app/pages/profile_edit/profile_edit_page.dart';
import 'package:tobeto_app/pages/profile/profile_page.dart';
import 'package:tobeto_app/pages/register/register_page.dart';
import 'package:tobeto_app/pages/settings/setting_page.dart';
import 'package:tobeto_app/pages/view_more/view_more_page.dart';

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
  static const String calendar = "/calendar";
  static const String setting = "/setting";
  // static const String forgot = "/forgot";
  static const String catalog = "/catalog";
  static const String register = "/register";
  static const String personall = "/personal";
  static const String note = "/note";

  static Map<String, AppRouteMapFunction> routes = {
    // onboard:(context) => const OnBoardScreen();

    login: (context) => LoginPage(),
    home: (context) => const HomePage(),
    onboard: (context) => OnboardingAnimation(),
    profile: (context) => const ProfilePage(),
    curved: (context) => const CurvedNavBarWidget(),
    viewmore: (context) => const ViewMorePage(),
    course: (context) => const CourseViewPage(),
    profiledit: (context) => const ProfileEditPage(),
    calendar: (context) => const CalendarPage(),
    setting: (context) => const SettingPage(),
    //forgot: (context) => ForgotPasswordPage(),
    catalog: (context) => const CatalogPage(),
    register: (context) => RegisterPage(),
    personall: (context) => const PersonalPage(),
    note: (context) => const NotePage(),
  };
}

//  ekstradan ekledigim routelar daha sonradan yapicagimiz işlemler için.
// Navigator.of(context).pushNamed("/login") yapabilmek icin (sayfa geçişi)
// İlk ekrana geri dönmek için Navigator.pop()işlevi kullanın.
