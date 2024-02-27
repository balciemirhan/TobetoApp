import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    Key? key,
    this.leadingIcon,
    required this.titleText,
    this.widget,

    /* required this.titleStyle */
  }) : super(key: key);

  final Icon? leadingIcon;
  final String titleText;
  final Widget? widget;

  /*  final TextStyle titleStyle; */
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 55, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTextTheme.londrinaShadow(
            titleText,
            context,
          ),
          NeuBox(child: leadingIcon ?? widget)
        ],
      ),
    );
  }
}
