// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:tobeto_app/core/widget/neu_box.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';

class DrawerTopBar extends StatefulWidget {
  const DrawerTopBar({
    Key? key,
    required this.drawerController,
    required this.image,
    this.title,
  }) : super(key: key);
  final AdvancedDrawerController drawerController;
  final String image;
  final String? title;

  @override
  State<DrawerTopBar> createState() => _DrawerTopBarState();
}

class _DrawerTopBarState extends State<DrawerTopBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                widget.drawerController.showDrawer();
              },
              icon: const NeuBox(child: Icon(Icons.menu))),
          AppTextTheme.londrinaShadow(widget.title ?? "", context),
          NeuBox(
            child: Image(
              image: AssetImage(widget.image),
              height: 25,
            ),
          )
        ],
      ),
    );
  }
}
