import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/application_bloc/application_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_app/api/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:tobeto_app/api/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:tobeto_app/api/blocs/course_bloc/course_bloc.dart';
import 'package:tobeto_app/api/blocs/exam_bloc/exam_bloc.dart';
import 'package:tobeto_app/api/blocs/note_bloc/note_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/repositories/application_repository.dart';
import 'package:tobeto_app/api/repositories/auth_repository.dart';
import 'package:tobeto_app/api/repositories/calendar_repository.dart';
import 'package:tobeto_app/api/repositories/catalog_repository.dart';
import 'package:tobeto_app/api/repositories/course_repository.dart';
import 'package:tobeto_app/api/repositories/exam_repostoriy.dart';
import 'package:tobeto_app/api/repositories/note_repository.dart';
import 'package:tobeto_app/api/repositories/storage_repository.dart';
import 'package:tobeto_app/api/repositories/user_repository.dart';
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
          create: (context) => AuthBloc(AuthRepository(), UserRepository()),
        ),
        BlocProvider<ProfileBloc>(
            create: (context) =>
                ProfileBloc(UserRepository(), StorageRepository())),
        BlocProvider<CourseBloc>(
          create: (context) => CourseBloc(CourseRepository()),
        ),
        BlocProvider<CatalogBloc>(
          create: (context) => CatalogBloc(CatalogRepository()),
        ),
        BlocProvider<ClassesBloc>(
          create: (context) => ClassesBloc(CalendarRepository()),
        ),
        BlocProvider<ExamBloc>(
          create: (context) => ExamBloc(ExamRepostiory()),
        ),
        BlocProvider<ApplicationBloc>(
          create: (context) => ApplicationBloc(ApplicationRepostiory()),
        ),
        BlocProvider<NoteBloc>(
          create: (context) => NoteBloc(NoteRepository()),
        )
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

        initialRoute: AppRoute.start,
        routes: AppRoute.routes,
      ),
    );
  }
}
