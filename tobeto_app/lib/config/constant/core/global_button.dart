import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/color.dart';
import 'package:tobeto_app/components/box_shadow.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton(
      {Key? key,
      this.imagePath,
      this.height,
      this.width,
      this.text,
      required this.onTap})
      : super(key: key);
  final double? height;
  final double? width;
  final String? imagePath;
  final String? text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double mHeight = mediaQueryData.size.height;
    final double mWidth = mediaQueryData.size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height ?? mHeight / 12,
          width: width ?? mWidth / 5.8,
          decoration: BoxDecoration(
            border: Border.all(color: LightColor.deepPurple),
            borderRadius: BorderRadius.circular(16),
            color: LightColor.lightBg,
            boxShadow: [
              //   BoxShadowLogin2().boxShadowLogin2,
              BoxShadowLogin(context).boxShadowLogin
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imagePath != null)
                Image.asset(
                  imagePath!,
                  height: 35,
                )
              else if (text != null)
                Text(
                  text!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
            ],
          )),
    );
  }
}
