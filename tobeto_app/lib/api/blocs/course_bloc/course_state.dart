import 'package:tobeto_app/models/course_model.dart';

abstract class CourseState {}

class CourseInitial extends CourseState {
  // başlangıç... (boşşşşşşş)
  // context.read
  // isterk atılıyor...
}

class CourseLoading extends CourseState {
  // circular dönen cisim... // center(circular)  spinner
}

class CourseLoaded extends CourseState {
  final List<Course> course;

  CourseLoaded({required this.course});
  // verilerimiz burada yüklenecek

  //if(state is  CourseLoaded)
  //{  verilerimi göster.... ==== context.read<CourseBloc>add() }
}

class CourseError extends CourseState {
  // hata alanı...
  final String message;

  CourseError({required this.message});
}

class CoursExample extends CourseState{}
