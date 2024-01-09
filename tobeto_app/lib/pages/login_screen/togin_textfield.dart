import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/global_textformfield.dart';

GlobalTextformfield logintextfield() {
  final emailController = TextEditingController();

  return GlobalTextformfield(
    controller: emailController,
    prefixIcon: const Icon(
      Icons.account_circle,
      color: Colors.black,
    ),
    hintText: "E-mail",
    validatorText: 'Email cannot be empty',
  );
}
