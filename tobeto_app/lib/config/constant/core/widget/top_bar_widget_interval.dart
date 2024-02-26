import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';

class TopBarWidgetInterval extends StatelessWidget {
  const TopBarWidgetInterval({
    Key? key,
    this.leadingIcon,
    required this.titleText,
    required this.iconButton,
    this.iconButton2,
    /* required this.titleStyle */
  }) : super(key: key);

  final Icon? leadingIcon;
  final String titleText;
  final IconButton iconButton;
  final IconButton? iconButton2;
  /*  final TextStyle titleStyle; */
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 50, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: NeuBox(child: iconButton)),
          AppTextTheme.large(titleText, context),
          NeuBox(child: leadingIcon ?? iconButton2)
        ],
      ),
    );
  }
}
