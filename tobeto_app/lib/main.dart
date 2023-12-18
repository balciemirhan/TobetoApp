import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/app_const.dart';
import 'package:tobeto_app/config/constant/theme/theme_dark.dart';
import 'package:tobeto_app/config/constant/theme/theme_manager.dart';
import 'package:tobeto_app/config/route/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // MaterialApp ' i ThemeManager widget ile sarmaladım. Sonra'da Builder <--> ile. ValueListenableBuilder(mesaj)
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: AppConst.themeNotifier,
        builder: (context, themeData, child) {
          //
          return ThemeManager(
            theme: themeData,
            changeTheme: AppConst.themeNotifier.changeTheme,
            // ----------------------------------------------------
            child: MaterialApp(
              title: "Education App",
              debugShowCheckedModeBanner: false,

              // --------------------- ROUTES ---------------------

              initialRoute: AppRoute.onboard,
              routes: AppRoute.routes,

              // ---------------------- THEME ---------------------

              theme: themeData,
              darkTheme: DarkTheme.theme,
              themeMode: ThemeMode.system, //  reaksiyon

              // ---------------------------------------------------
            ),
          );
        });
  }
}
