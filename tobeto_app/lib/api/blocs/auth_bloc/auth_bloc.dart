import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_state.dart';
import 'package:tobeto_app/api/repositories/auth_repository.dart';
import 'package:tobeto_app/api/repositories/user_repository.dart';
import 'package:tobeto_app/models/user_model.dart';
import 'package:tobeto_app/validation/validation.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  final FirebaseAuth _firebaseAuth;

  AuthBloc(this._authRepository, this._userRepository,
      {FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        super(AuthInitial()) {
    on<LoginUser>(_onLoginUser);
    on<CreateUser>(_onCreateUser);
    on<UserOut>(_onUserOut);
    on<ForgotPassword>(_onForgotPassword);
    on<ChangePassword>(_onChangePassword);
    on<SignInWithGoogle>(_onSignInWithGoogle);
    on<DeleteUserEmail>(_onDeleteUserEmail);
    // on<Current>(_onCurrent);

    _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        emit(Authenticated(user: user));
      } else {
        emit((NotAuthenticated()));
      }
    });
  }

/*   void _onCurrent(Current event, Emitter<AuthState> emit) async {
    if (_firebaseAuth.currentUser != null) {
      emit(Authenticated(user: _firebaseAuth.currentUser));
    } else {
      emit(AuthInitial());
    }
  } */

  // ------------- loginUser -------------

  void _onLoginUser(LoginUser event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authRepository.loginUser(event.email, event.password);
      emit(Authenticated(user: _firebaseAuth.currentUser));
    } on FirebaseAuthException catch (e) {
      emit(NotAuthenticated(
          errorMessage:
              validLogin[e.code] ?? "Lütfen Geçerli Bir Değer Girin"));
    }
  }

  // ------------- createUser -------------

  void _onCreateUser(CreateUser event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      if (event.password == event.confirmPassword) {
        await _authRepository.createUser(
            event.email, event.password, event.confirmPassword);
        await _userRepository.addUser(
          UserModel(
              email: event.email,
              profilePhoto:
                  "https://static.vecteezy.com/system/resources/previews/022/450/297/original/3d-minimal-purple-user-profile-avatar-icon-in-circle-white-frame-design-vector.jpg"),
        );
        emit(Authenticated(user: _firebaseAuth.currentUser, isNewUser: true));
      } else {
        emit(NotAuthenticated(errorMessage: "Şifreler eşleşmiyor."));
      }
    } on FirebaseAuthException catch (e) {
      emit(NotAuthenticated(
          errorMessage:
              validRegister[e.code] ?? "Lütfen Geçerli Bir Değer Girin"));
    }
  }

// ------------- singOut -------------

  void _onUserOut(UserOut event, Emitter<AuthState> emit) async {
    try {
      await _authRepository.userOut();
      await _authRepository.googleSignOut();
    } catch (e) {
      emit(AuthError(message: "Kayıt Başarısız..."));
    }
  }

// ------------- forgotPassword -------------

  void _onForgotPassword(ForgotPassword event, Emitter<AuthState> emit) async {
    try {
      await _authRepository.forgotPassword(event.email);
    } catch (e) {
      print(e);
    }
  }

  // ------------- changePassword -------------

  void _onChangePassword(ChangePassword event, Emitter<AuthState> emit) async {
    try {
      if (event.newPassword == event.confirmNewPassword) {
        await _authRepository.changePassword(
            event.newPassword, event.confirmNewPassword);
      }
    } catch (e) {
      print(e);
    }
  }

// ------------- signInWithGoogle -------------

  void _onSignInWithGoogle(
      SignInWithGoogle event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authRepository.signInWithGoogle();
      await _userRepository.addUser(
        UserModel(
            email: event.email,
            profilePhoto:
                "https://static.vecteezy.com/system/resources/previews/022/450/297/original/3d-minimal-purple-user-profile-avatar-icon-in-circle-white-frame-design-vector.jpg"),
      );
      emit(Authenticated(user: _firebaseAuth.currentUser));
    } catch (e) {
      emit(NotAuthenticated(errorMessage: e.toString()));
    }
  }

// ------------- deleteUserEmail -------------

  Future<void> _onDeleteUserEmail(
      DeleteUserEmail event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authRepository.deleteUserEmail();
    } catch (e) {
      emit(AuthError(message: "Hesabınız Silinemedi..!"));
    }
  }
}
