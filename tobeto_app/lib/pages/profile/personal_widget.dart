import 'package:flutter/material.dart';

import 'package:tobeto_app/constant/theme/text_theme.dart';

class ProfilWidget extends StatelessWidget {
  const ProfilWidget({Key? key, required this.text, required this.widget})
      : super(key: key);
  final String text;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextTheme.xSmall(text, context),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: widget)
        ],
      ),
    );
  }
}
