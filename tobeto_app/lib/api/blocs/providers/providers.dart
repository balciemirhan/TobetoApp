import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/announcement_bloc/announcement_bloc.dart';
import 'package:tobeto_app/api/blocs/application_bloc/application_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_app/api/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:tobeto_app/api/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:tobeto_app/api/blocs/course_bloc/course_bloc.dart';
import 'package:tobeto_app/api/blocs/exam_bloc/exam_bloc.dart';
import 'package:tobeto_app/api/blocs/note_bloc/note_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/repositories/announcement_repository.dart';
import 'package:tobeto_app/api/repositories/application_repository.dart';
import 'package:tobeto_app/api/repositories/auth_repository.dart';
import 'package:tobeto_app/api/repositories/calendar_repository.dart';
import 'package:tobeto_app/api/repositories/catalog_repository.dart';
import 'package:tobeto_app/api/repositories/course_repository.dart';
import 'package:tobeto_app/api/repositories/exam_repostoriy.dart';
import 'package:tobeto_app/api/repositories/note_repository.dart';
import 'package:tobeto_app/api/repositories/storage_repository.dart';
import 'package:tobeto_app/api/repositories/user_repository.dart';

final authBlocProvider = BlocProvider<AuthBloc>(
    create: (context) => AuthBloc(AuthRepository(), UserRepository()));

final profileBlocProvider = BlocProvider<ProfileBloc>(
  create: (context) => ProfileBloc(UserRepository(), StorageRepository()),
);
final courseBlocProvider = BlocProvider<CourseBloc>(
  create: (context) => CourseBloc(CourseRepository()),
);

final catalogBlocProvider = BlocProvider<CatalogBloc>(
  create: (context) => CatalogBloc(CatalogRepository()),
);

final classesBlocProvider = BlocProvider<ClassesBloc>(
  create: (context) => ClassesBloc(CalendarRepository()),
);

final examBlocProvider = BlocProvider<ExamBloc>(
  create: (context) => ExamBloc(ExamRepostiory()),
);

final applicationBlocProvider = BlocProvider<ApplicationBloc>(
  create: (context) => ApplicationBloc(ApplicationRepostiory()),
);

final noteBlocProvider = BlocProvider<NoteBloc>(
  create: (context) => NoteBloc(NoteRepository()),
);

final announcementBlocProvider = BlocProvider<AnnouncementBloc>(
  create: (context) => AnnouncementBloc(AnnouncementRepository()),
);
