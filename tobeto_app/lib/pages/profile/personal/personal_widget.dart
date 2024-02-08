import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';

class PersonalWidget extends StatelessWidget {
  const PersonalWidget({Key? key, required this.text, required this.widget})
      : super(key: key);
  final String text;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: NeuBox(
        width: screenWidth * 0.9,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              AppTextTheme.medium(text, context),
              const Divider(),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: widget)
            ],
          ),
        ),
      ),
    );
  }
}
