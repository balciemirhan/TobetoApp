import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/business_logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_app/business_logic/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/business_logic/repositories/auth_repository.dart';
import 'package:tobeto_app/business_logic/repositories/user_repository.dart';
import 'package:tobeto_app/config/constant/theme/theme.dart';
import 'package:tobeto_app/config/routes/app_routes.dart';
import 'package:tobeto_app/firebase_options.dart';

Future<void> main() async {
  // Firebase'in mevcut platform için uygulamayı başlatması:
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

// Tüm navigator nesnelerine erişim.
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            AuthRepository(),
            UserRepository(),
          ),
        ),
        BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(UserRepository())),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Education App',
        debugShowCheckedModeBanner: false,

        // --------------------------- THEME ---------------------------

        theme: AppTheme.lightMode,
        darkTheme: AppTheme.darkMode,
        themeMode: ThemeMode.system,

        // --------------------------- ROUTE ---------------------------

        initialRoute: AppRoute.curved,
        routes: AppRoute.routes,
      ),
    );
  }
}
