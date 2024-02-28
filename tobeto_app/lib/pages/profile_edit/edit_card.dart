import 'package:flutter/material.dart';

class EditCard extends StatelessWidget {
  const EditCard({Key? key, required this.child, required this.onPressed})
      : super(key: key);
  final Widget child;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = Theme.of(context).brightness;
    Color containerColor =
        currentBrightness == Brightness.light ? Colors.black12 : Colors.white12;
    Color buttonColor = currentBrightness == Brightness.light
        ? Colors.deepPurple.shade900
        : Colors.deepPurple.shade100;
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: containerColor),
      child: Row(
        children: [
          Container(
              constraints: const BoxConstraints(maxWidth: 300), child: child),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.delete_rounded,
              color: buttonColor,
            ),
          ),
        ],
      ),
    );
  }
}
