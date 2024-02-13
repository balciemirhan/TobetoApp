// Repository => Bu klasör veri kaynaklarına erişien ve veri işlemlerini gerçekleştiren depoları içerir.

// aslında biz repositories içerisende firestore istek atıp firestore dan gelen verileri de bloc içerisinde yönetiyoruz.

// auth işlemlerini tutar. =>fireaseauth
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ------------- loginUser -------------

  Future<void> loginUser(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  // ------------- createUser -------------

  Future<void> createUser(
      String email, String password, String confirmPassword) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  // ------------- singOut -------------

  Future<void> userOut() async {
    await _auth.signOut();
  }
}
