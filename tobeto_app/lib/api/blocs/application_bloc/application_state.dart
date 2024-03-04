import 'package:tobeto_app/models/application_model.dart';

abstract class ApplicationState {}

class ApplicationInitial extends ApplicationState {}

class ApplicationLoading extends ApplicationState {}

class ApplicationLoaded extends ApplicationState {
  final List<Application> application;

  ApplicationLoaded({required this.application});
}

class ApplicationError extends ApplicationState {
  final String message;

  ApplicationError({required this.message});
}
