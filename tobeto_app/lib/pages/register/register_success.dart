import 'package:flutter/material.dart';
import 'package:tobeto_app/core/widget/my_dialog_button.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';

class MyDialogSuccess extends StatelessWidget {
  final String title;
  final Color color;
  final String imagePath;
  final void Function()? onPressed;
  final void Function()? closePressed;
  final String? closeText;
  final String? onText;

  const MyDialogSuccess(
      {Key? key,
      required this.title,
      required this.color,
      required this.imagePath,
      this.closePressed,
      this.onPressed,
      this.closeText,
      this.onText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        height: 325,
        width: 400,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 400,
                color: color,
                child: Image.asset(
                  height: 50,
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: AppTextTheme.small(title, context),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: myDialogButton(closeText ?? "", closePressed,
                            color: Colors.white, textColor: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
