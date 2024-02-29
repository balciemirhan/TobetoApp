import 'package:flutter/material.dart';

void showDialogWidget(context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(
      child: CircularProgressIndicator(
        color: Colors.deepPurple,
      ),
    ),
  );
}
