import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    Key? key,
    required this.leadingIcon,
    required this.titleText,

    /* required this.titleStyle */
  }) : super(key: key);

  final Icon leadingIcon;
  final String titleText;

  /*  final TextStyle titleStyle; */
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titleText, style: AppText.headline),
          NeuBox(child: leadingIcon)
        ],
      ),
    );
  }
}
