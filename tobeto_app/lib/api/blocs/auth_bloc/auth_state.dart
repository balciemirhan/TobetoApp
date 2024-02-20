// ignore_for_file: public_member_api_docs, sort_constructors_first
// Bloc'taki stateler, UI'ın şu anki durumunu temsil eder ve UI'ın nasıl davranacağını belirler.
// UI, Bloc'taki statelere göre güncellenir.
// Bloc, UI'ı state'lerden ayırır ve UI'ın daha kolay test edilmesini sağlar.
// Bloc, UI yönetimini daha kolay ve daha öngörülebilir hale getirir.
// Stateler, UI'ın şu anki durumunu temsil eden nesnelerdir.

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {} // ---> başlangıç

class Authenticated extends AuthState {
  // ---> giriş yap
  User? user; // kullanıcının user verir. Buna göre de giriş izni.

  Authenticated({
    this.user,
  });

/*   state is  Authenticated
  return homepage */
}

class NotAuthenticated extends AuthState {} //  --> giriş yapmadan önceki sayfa.

class AuthError extends AuthState {
  // ---> Error
  final String message;

  AuthError({required this.message});
}
