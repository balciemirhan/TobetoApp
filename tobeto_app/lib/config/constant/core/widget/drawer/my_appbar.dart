// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/image.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    Key? key,
    required this.drawerController,
  }) : super(key: key);
  final AdvancedDrawerController drawerController;
  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                widget.drawerController.showDrawer();
              },
              icon: const NeuBox(child: Icon(Icons.menu))),
          const NeuBox(
            child: Image(
              image: AssetImage(AppImage.tobetoLogo),
              height: 25,
            ),
          )
        ],
      ),
    );
  }
}
