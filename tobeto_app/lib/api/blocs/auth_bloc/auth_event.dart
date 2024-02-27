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
  final String? message;

  CreateUser({
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.message,
  });
}

// ------------- singOut -------------

class UserOut extends AuthEvent {}

// ------------- forgotPassword -------------

class ForgotPassword extends AuthEvent {
  String email;
  ForgotPassword({
    required this.email,
  });
}

// ------------- changePassword -------------

class ChangePassword extends AuthEvent {
  String newPassword;
  String confirmNewPassword;
  ChangePassword({
    required this.newPassword,
    required this.confirmNewPassword,
  });
}

// ------------- SignInWithGoogle -------------

class SignInWithGoogle extends AuthEvent {
  final String email;

  SignInWithGoogle({required this.email});
}

// ------------- DeleteUserEmail -------------

class DeleteUserEmail extends AuthEvent {}
