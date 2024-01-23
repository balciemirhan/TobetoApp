import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/config/constant/core/widget/show_dialog_widget.dart';
import 'package:tobeto_app/config/constant/core/widget/snackbar_widget.dart';
import 'package:tobeto_app/main.dart';
import 'package:tobeto_app/rules/rules.dart';

class SignIn {
  static Future login(context, String email, password) async {
    // giriş  düğmesine tıkladığımızda yapmak istediklerimiz:
    // herhangi bir hata varsa try-catch bloğu ile yakalayalım.

    // başlangıçta CircularProgressIndicator göster.
    showDialogWidget(context);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // ---------- catch bloğu içerisinde Hata yönetimi: ----------
    } on FirebaseAuthException catch (e) {
      String message =
          firebaseAuthExceptionRulesLogin[e.code] ?? "Lütfen bir Değer girin";
      snackBarMessage(context, message);
    }
    navigatorKey.currentState!
        .pop(); // =>  CircularProgressIndicator 'ı sonlandırır.
  }
}
