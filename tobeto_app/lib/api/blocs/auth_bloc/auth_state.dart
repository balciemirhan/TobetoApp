import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  User? user;
  String? message;
  final bool? isNewUser;
  Authenticated({
    this.user,
    this.message,
    this.isNewUser = false,
  });
}

class NotAuthenticated extends AuthState {
  final String? errorMessage;

  NotAuthenticated({this.errorMessage});
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
