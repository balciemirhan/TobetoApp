// Bloc => Bu klasör, uygulama durumunu yöneten BLoC'ları içerir.

// Bloc, UI katmanındaki verileri yönetmek için kullanılan bir state management pattern'ıdır.
// !!!!!!!!! Bloc, stateleri yönetmek için kullanılan bir sınıf veya nesnedir. !!!!!
// UI, Bloc'taki statelere göre güncellenir.
// Bloc'taki stateler, UI'ın şu anki durumunu temsil eder ve UI'ın nasıl davranacağını belirler.
//Bloc, UI'ı state'lerden ayırır ve UI'ın daha kolay test edilmesini sağlar.

/* Bloc, event'leri UI'dan alır ve bu event'lere göre state'leri günceller. (context.read)
Bloc, güncellenen state'leri UI'a gönderir ve UI, buna göre güncellenir.
Bloc, event'leri ve state'leri asenkron olarak işler */

/*  BLoC, event'leri UI'dan alır ve bu event'lere göre state'i günceller. Bu nedenle, (context.read) kullanarak BLoC örneğine erişebilir ve event'leri gönderebilirsiniz
 */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_state.dart';
import 'package:tobeto_app/api/repositories/auth_repository.dart';
import 'package:tobeto_app/api/repositories/user_repository.dart';
import 'package:tobeto_app/models/user_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  final FirebaseAuth _firebaseAuth; // id mi çağırıyorum.

  AuthBloc(this._authRepository, this._userRepository,
      {FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        super(AuthInitial()) {
    on<LoginUser>(_onLoginUser);
    on<CreateUser>(_onCreateUser);
    on<UserOut>(_onUserOut);

    // Kimlik doğrulama durumu değişikliklerini dinle:
    // eğer var ise Homepage dön.
    // yok ise login de kal.

    _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        (Authenticated(user: user));
      } else {
        (NotAuthenticated());
      }
    });
  }

  //  LoginUser olayını dinle ve başarılı olursa Authenticated i' yay.
  // emit =>  bir Bloc sınıfının durumunu güncellemek için kullanılır ve yalnızca Bloc sınıfının içinde kullanılabilir.

  void _onLoginUser(LoginUser event, Emitter<AuthState> emit) async {
    try {
      await _authRepository.loginUser(event.email, event.password);
      emit(Authenticated(user: _firebaseAuth.currentUser));
    } catch (e) {
      emit(AuthError(message: "Giriş Başarısız"));
    }
  }

  void _onCreateUser(CreateUser event, Emitter<AuthState> emit) async {
    try {
      await _authRepository.createUser(
          event.email, event.password, event.confirmPassword);
      await _userRepository.addUser(
        UserModel(email: event.email),
      );
      emit(Authenticated(user: _firebaseAuth.currentUser));
    } catch (e) {
      emit(AuthError(message: "Kayıt Başarısız..."));
    }
  }

  void _onUserOut(UserOut event, Emitter<AuthState> emit) async {
    try {
      await _authRepository.userOut();
    } catch (e) {
      emit(AuthError(message: "Kayıt Başarısız..."));
    }
  }
}
