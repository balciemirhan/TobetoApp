import 'package:flutter/material.dart';
import 'package:tobeto_app/pages/forgot/forgot_form.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/images/forgot_background.png"),
      )),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/authGate");
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
                size: 40,
                shadows: [
                  Shadow(
                      color: Colors.grey.shade900,
                      blurRadius: 20,
                      offset: const Offset(4, 4))
                ],
              )),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ForgotPasswordForm(
                formKey: formKey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
