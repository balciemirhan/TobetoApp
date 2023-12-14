import 'package:flutter/material.dart';
import 'package:tobeto_app/config/route/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Education App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),

// --------------------- ROUTES ---------------------

      initialRoute: AppRoute.login,
      routes: AppRoute.routes,
    );
  }
}
