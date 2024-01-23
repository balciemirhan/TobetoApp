import 'package:flutter/material.dart';

class NowBottom extends StatelessWidget {
  const NowBottom(
      {Key? key, this.onTap, required this.text, required this.text2})
      : super(key: key);

  final void Function()? onTap;
  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(color: Colors.grey[700]),
        ),
        const SizedBox(width: 4),
        InkWell(
        onTap: onTap,
          child: Text(
            text2,
            style: const TextStyle(
              color: Color.fromARGB(255, 143, 101, 215),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
