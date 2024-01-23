import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/show_dialog_widget.dart';
import 'package:tobeto_app/main.dart';
import 'package:tobeto_app/service/google_auth_service.dart';

class SignOut {
  static Future<void> logout(context) async {
    // Çıkış düğmesine tıkladığımızda yapmak istediklerimiz:
    // hem firebase'den çıkış yapsın hem' de uygulamadan.
    // Google ile de çıkış yap.

    /* ------------ GoogleOut  ------------ */
    showDialogWidget(context);

    final GoogleAuthenticationService authentication =
        GoogleAuthenticationService();

    await authentication.signOutWithGoogle();

    /* ------------ Firebase'dan çıkış yap ------------ */

    await FirebaseAuth.instance.signOut();

    navigatorKey.currentState!.pop();
    Navigator.of(context).pushNamed("/authGate");
  }
}
