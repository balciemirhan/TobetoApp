import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBarMessage(
    context, String content,
    {Color? color}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color ?? Colors.red,
      content: Text(content),
      dismissDirection: DismissDirection.horizontal,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        textColor: Colors.white,
        label: "Kapat",
        onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
      ),
    ),
  );
}

// Parolalar Eşleşmiyor  