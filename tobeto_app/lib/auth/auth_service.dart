import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  // FirebaseAuth.instance ile firebase'in tüm işlevselliğine sahip oluyoruz.

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // -------------------- Sign In --------------------

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    // herhangi bir hata varsa try-catch bloğu ile yakalayalım.

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  // -------------------- Sign Up --------------------

  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      return _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // -------------------- Sign Out --------------------

// whenComplete sadece pushlamaya yarıyor.
// çıkış butonuna basıldığı anda hem firebase'den çıkış yapılsın
// hem de uygulama içerisinden Login ekranına döndürülsün istiyorum. => authGate (Login ekranına döndürür.)

  Future<void> signOut(context) async {
    return await _auth
        .signOut()
        .whenComplete(() => Navigator.of(context).pushNamed("/authGate"));
  }

  // -------------------- Google Authentication sign in --------------------
  // yapılacak...
}
