import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';


class TopBarWidgetEvalution extends StatelessWidget {
  const TopBarWidgetEvalution({
    Key? key,
    required this.iconButton,
   
    this.widget,
  }) : super(key: key);

  final IconButton iconButton;
  
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 55, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NeuBox(child: iconButton), // IconButton burada kullanıldı
          SizedBox(width: 16),
          
          
        ],
      ),
    );
  }
}
