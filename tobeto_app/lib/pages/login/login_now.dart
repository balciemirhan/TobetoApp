import 'package:flutter/material.dart';

class LoginNow extends StatelessWidget {
  const LoginNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Üye değil misin?",
          style: TextStyle(color: Colors.grey[700]),
        ),
        const SizedBox(width: 4),
        const Text(
          "Şimdi kaydolun",
          style: TextStyle(
            color: Color.fromARGB(255, 143, 101, 215),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
