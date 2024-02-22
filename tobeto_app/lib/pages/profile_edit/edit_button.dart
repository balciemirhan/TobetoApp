import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton(
      {Key? key, required this.text, required this.onTap, this.color})
      : super(key: key);

  final String text;
  final Function() onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: color ?? Colors.deepPurple,
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          width: mediaQuery.width * 0.35,
          height: mediaQuery.height * 0.05,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
