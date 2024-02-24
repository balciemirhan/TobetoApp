import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = Theme.of(context).brightness;
    String backgroundImage = currentBrightness == Brightness.light
        ? "assets/images/light_background.gif"
        : "assets/images/dark_background.gif";

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(backgroundImage))),
      child: child,
    );
  }
}
