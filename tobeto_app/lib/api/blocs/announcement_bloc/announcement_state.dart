import 'package:tobeto_app/models/announcement_model.dart';
import 'package:tobeto_app/models/course_model.dart';

abstract class AnnouncementState {}

class AnnouncementInitial extends AnnouncementState {
  // başlangıç... (boşşşşşşş)
  // context.read
  // isterk atılıyor...
}

class AnnouncementLoading extends AnnouncementState {
  // circular dönen cisim... // center(circular)  spinner
}

class AnnouncementLoaded extends AnnouncementState {
  final List<AnnouncementModel> announcement;

  AnnouncementLoaded({required this.announcement});
  // verilerimiz burada yüklenecek

  //if(state is  CourseLoaded)
  //{  verilerimi göster.... ==== context.read<CourseBloc>add() }
}

class AnnouncementError extends AnnouncementState {
  // hata alanı...
  final String message;

  AnnouncementError({required this.message});
}

class AnnouncementExample extends AnnouncementState {}
