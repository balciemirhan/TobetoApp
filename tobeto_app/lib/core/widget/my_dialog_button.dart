import 'package:flutter/material.dart';

ElevatedButton myDialogButton(
    final String title, final void Function()? onPressed,
    {final Color? color, final Color? textColor}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: color, // Use backgroundColor instead of primary
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
    ),
    child: Text(
      title,
      style: TextStyle(color: textColor),
    ),
  );
}
