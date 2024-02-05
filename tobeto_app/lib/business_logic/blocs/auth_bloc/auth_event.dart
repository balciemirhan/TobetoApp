// Bloc'ta event'ler, UI'dan kaynaklanan ve state'lerin değişmesine neden olan olaylardır.
/* Örneğin, bir kullanıcı bir düğmeye tıkladığında, bu bir event'tir.
Event'ler, Bloc'a gönderilir ve Bloc, event'lere göre state'leri günceller.
UI, daha sonra güncellenen state'lere göre güncellenir.
Event'ler, UI'ın state'leri nasıl değiştireceğini belirler.
Event'ler, UI'ı daha reaktif ve etkileşimli hale getirir.
Event'ler, UI'ın daha kolay test edilmesini sağlar. */

// Event'ler, state'lerin değişmesine neden olur ve state'ler, UI'ın nasıl davranacağını belirler.

abstract class AuthEvent {}

// ------------- loginUser -------------

class LoginUser extends AuthEvent {
  final String email;
  final String password;

  LoginUser({required this.email, required this.password});
}

// ------------- createUser -------------

class CreateUser extends AuthEvent {
  final String email;
  final String password;
  final String confirmPassword;

  CreateUser(
      {required this.email,
      required this.password,
      required this.confirmPassword});
}

// ------------- singOut -------------

class UserOut extends AuthEvent {}
