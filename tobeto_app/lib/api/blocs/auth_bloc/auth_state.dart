import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {} // ---> başlangıç

class Authenticated extends AuthState {
  // ---> giriş yap
  User? user; // kullanıcının user verir. Buna göre de giriş izni.
  String? message;
  final bool? isNewUser;
  Authenticated({
    this.user,
    this.message,
    this.isNewUser = false,
  });

/*   state is  Authenticated
  return homepage */
}

class NotAuthenticated extends AuthState {
  final String? errorMessage;

  NotAuthenticated({this.errorMessage});
} //  --> giriş yapmadan önceki sayfa.

class AuthError extends AuthState {
  // ---> Error
  final String message;

  AuthError({required this.message});
}
