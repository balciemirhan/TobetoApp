import 'package:tobeto_app/models/course_model.dart';

abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseLoaded extends CourseState {
  final List<Course> course;

  CourseLoaded({required this.course});
}

class CourseError extends CourseState {
  final String message;

  CourseError({required this.message});
}

class CoursExample extends CourseState {}
