import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.light
            ? Colors.grey.shade200
            : Colors.deepPurple,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(50),
        ),
      ),
      child: Center(child: child),
    );
  }
}
