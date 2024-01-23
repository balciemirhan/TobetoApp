import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  const NeuBox({Key? key, this.child, this.width, this.height})
      : super(key: key);
  final Widget? child;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 50, // Use provided width or default to 50
      height: height ?? 50,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 15,
                offset: const Offset(5, 5)),
            const BoxShadow(
                color: Colors.white, blurRadius: 15, offset: Offset(-5, -5)),
          ]),
      child: Center(
        child: child,
      ),
    );
  }
}
