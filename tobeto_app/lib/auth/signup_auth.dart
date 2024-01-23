import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/config/constant/core/widget/show_dialog_widget.dart';
import 'package:tobeto_app/config/constant/core/widget/snackbar_widget.dart';
import 'package:tobeto_app/main.dart';
import 'package:tobeto_app/rules/rules.dart';

class SignUp {
  static Future register(
      context, String email, password, confirmPassword) async {
    // kayıt düğmesine tıkladığımızda yapmak istediklerimiz:
    // herhangi bir hata varsa try-catch bloğu ile yakalayalım.(hata yönetimi)
    // parola ve doğrulanmış parola birbirine eşit ise kullanıcı oluşsun.
    // birbirine eşit değil ise 'Parolalar Eşleşmiyor' uyarsı versin.

// başlangıçta CircularProgressIndicator göster.
    showDialogWidget(context);

    String message;
    try {
      if (password == confirmPassword) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        message = " Parolalar Eşleşmiyor";
        return snackBarMessage(context, message);
      } // ---------- catch bloğu içerisinde Hata yönetimi: ----------
    } on FirebaseAuthException catch (e) {
      message = firebaseAuthExceptionRulesRegister[e.code] ??
          "Lütfen bir Değer girin";
      snackBarMessage(context, message);
    } finally {
      navigatorKey.currentState!.pop();
    } // =>  CircularProgressIndicator'ı sonlandırır.
  }
}
