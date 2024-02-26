import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:tobeto_app/config/constant/theme/color.dart';

class MyAdvancedDrawer extends StatefulWidget {
  const MyAdvancedDrawer(
      {Key? key,
      required this.child,
      required this.drawer,
      required this.controller})
      : super(key: key);
  final Widget child;
  final Widget drawer;
  final AdvancedDrawerController controller;

  @override
  State<MyAdvancedDrawer> createState() => _MyAdvancedDrawerState();
}

class _MyAdvancedDrawerState extends State<MyAdvancedDrawer> {
  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = Theme.of(context).brightness;
    Color containerColor = currentBrightness == Brightness.light
        ? Colors.deepPurple.shade100
        : const Color.fromARGB(255, 75, 37, 116);

    return AdvancedDrawer(
        backdrop: Container(
          decoration: BoxDecoration(
              color: containerColor,
              image: const DecorationImage(
                colorFilter: ColorFilter.mode(
                    Color.fromARGB(255, 131, 95, 213), BlendMode.dstIn),
                opacity: .4,
                image: AssetImage("assets/images/tobeto-logo.png"),
              )),
        ),
        animationCurve: Easing.standard,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 30, spreadRadius: 10),
          ],
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        controller: widget.controller,
        drawer: widget.drawer,
        child: widget.child);
  }
}
