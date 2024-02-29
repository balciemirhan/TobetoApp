import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/core/widget/snackbar_widget.dart';

const validRegister = {
  'email-already-in-use': 'E-posta Zaten Kullanılıyor',
  'wrong-password': 'Hatalı Şifre',
  'weak-password': 'zayıf şifre: minimum 6 karakter giriniz.',
  'invalid-email': 'Geçersiz E-posta',
};

const validLogin = {
  'invalid-email': 'Geçersiz E-posta',
  'wrong-password': 'Hatalı Şifre',
  'user-not-found': 'Kullanıcı Bulunamadı',
  'network-request-failed': 'Ağ Hatası',
  'too-many-requests': 'Çok Fazla İstek',
};

String forgotPasswordValid(FirebaseAuthException e, String message, context) {
  if (e.code == "invalid-email") {
    message = "Geçersiz e-posta";
  } else if (e.code == "network-request-failed") {
    message = "Ağ Hatası";
  } else if (e.code == "user-not-found") {
    message = "Kullanıcı bulunamadı.";
  }
  snackBarMessage(context, message);
  return message;
}
