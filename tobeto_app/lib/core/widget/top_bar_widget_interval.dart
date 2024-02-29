import 'package:flutter/material.dart';
import 'package:tobeto_app/core/widget/neu_box.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    Key? key,
    this.leadingIcon,
    required this.titleText,
    this.iconButton,
    this.iconButton2,
  }) : super(key: key);

  final Icon? leadingIcon;
  final String titleText;
  final IconButton? iconButton;
  final IconButton? iconButton2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 45, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (iconButton != null)
            IconButton(
              onPressed: () {},
              icon: NeuBox(child: iconButton),
            ),
          AppTextTheme.londrinaShadow(
            titleText,
            context,
          ),
          NeuBox(child: leadingIcon ?? iconButton2)
        ],
      ),
    );
  }
}
