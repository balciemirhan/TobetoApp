import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/snackbar_widget.dart';
import 'package:tobeto_app/rules/rules.dart';

class Forgot {
  static Future<void> passwordReset(context, String email) async {
    String message = "";
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      message = "Şifre bağlantısı gönderildi! Lütfen e-postanı kontrol et";
      snackBarMessage(
        color: Colors.green,
        context,
        message,
      );
    } on FirebaseAuthException catch (e) {
      message = forgotPasswordRules(e, message, context);
    }
  }
}
