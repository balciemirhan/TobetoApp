import 'package:flutter/material.dart';
import 'package:tobeto_app/constant/theme/color.dart';

class NeuBox extends StatelessWidget {
  const NeuBox({Key? key, this.child, this.width, this.height})
      : super(key: key);

  final Widget? child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final double blurRadius;
    final Offset offset;

    if (theme.brightness == Brightness.light) {
      blurRadius = 15.0;
      offset = const Offset(5, 5);
    } else {
      blurRadius = 2.0;
      offset = const Offset(1, 2);
    }

    return Container(
      constraints: BoxConstraints(
        minHeight: height ?? 50,
        maxWidth: width ?? 50,
      ),
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.light
            ? AppColor.neuBoxColorLight
            : AppColor.neuBoxColorDark,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: theme.brightness == Brightness.light
                ? AppColor.neuBoxShadowColorBRLight
                : AppColor.neuBoxShadowColorBRDark,
            blurRadius: blurRadius,
            offset: offset,
          ),
          BoxShadow(
            color: theme.brightness == Brightness.light
                ? AppColor.neuBoxShadowColorTLLight
                : AppColor.neuBoxShadowColorTLDark,
            blurRadius: blurRadius,
            offset: -offset,
          ),
        ],
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
