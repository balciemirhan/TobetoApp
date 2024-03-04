import 'package:tobeto_app/models/user_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  UserModel user;
  ProfileLoaded({
    required this.user,
  });
}

class ProfileError extends ProfileState {
  String errorMessage;
  ProfileError({
    required this.errorMessage,
  });
}

class ProfileUpdated extends ProfileState {}

class CloseBloc extends ProfileState {}
