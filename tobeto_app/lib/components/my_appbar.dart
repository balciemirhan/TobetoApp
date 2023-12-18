import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:tobeto_app/components/my_textForm.dart';
import 'package:tobeto_app/config/constant/app_const.dart';

class MyAppbar extends StatefulWidget {
  final AdvancedDrawerController drawerController;
  const MyAppbar({Key? key, required this.drawerController}) : super(key: key);

  @override
  _MyAppbarState createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
      height: 125,
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.1,
                0.5
              ],
              colors: [
                Color(0xff886ff2),
                Color(0xff6849ef),
              ])),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    widget.drawerController.showDrawer();
                  },
                  icon: Icon(Icons.menu)),
              const Text(
                "Hoş geldiniz",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          //    MyTextForm(),
        ],
      ),
    );
  }
}
