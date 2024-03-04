import 'package:flutter/material.dart';
import 'package:tobeto_app/core/widget/neu_box.dart';

class SquareAuthButtons extends StatelessWidget {
  const SquareAuthButtons({
    Key? key,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  final String imagePath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: NeuBox(
        height: 70,
        width: 70,
        child: Center(
          child: Image(
            image: AssetImage(imagePath),
            height: 35,
          ),
        ),
      ),
    );
  }
}
