import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath; // görüntü yolunun dizesi

  const SquareTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // dinamaik blur - offset
    const Offset distance = Offset(28, 28);
    double blur = 30.0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 143, 101, 215)),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              blurRadius: blur,
              offset: -distance,
              color: Colors.white,
            ),
            BoxShadow(
              blurRadius: blur,
              offset: distance,
              color: const Color(0xFFA7A9AF),
            )
          ]),
      child: Image.asset(
        imagePath,
        height: 35,
      ),
    );
  }
}
