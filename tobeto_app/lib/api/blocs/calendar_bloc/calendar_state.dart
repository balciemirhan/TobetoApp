import 'package:tobeto_app/models/classes_model.dart';

abstract class ClassesState {}

class ClassesInitial extends ClassesState {}

class ClassesLoading extends ClassesState {}

class ClassesLoaded extends ClassesState {
  final List<Classes> classes;

  ClassesLoaded({required this.classes});
}

class ClassesError extends ClassesState {
  final String message;

  ClassesError({required this.message});
}
