abstract class AuthEvent {}

class LoginUser extends AuthEvent {
  final String email;
  final String password;

  LoginUser({required this.email, required this.password});
}

class CreateUser extends AuthEvent {
  final String email;
  final String password;
  final String confirmPassword;
  final String? message;

  CreateUser({
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.message,
  });
}

class UserOut extends AuthEvent {}

class ForgotPassword extends AuthEvent {
  String email;
  ForgotPassword({
    required this.email,
  });
}

class ChangePassword extends AuthEvent {
  String newPassword;
  String confirmNewPassword;
  ChangePassword({
    required this.newPassword,
    required this.confirmNewPassword,
  });
}

class SignInWithGoogle extends AuthEvent {
  final String email;

  SignInWithGoogle({required this.email});
}

class DeleteUserEmail extends AuthEvent {}
