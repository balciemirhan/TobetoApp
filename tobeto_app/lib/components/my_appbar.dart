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
      height: 200,
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
              FlutterSwitch(
                width: 80,
                height: 40,
                toggleSize: 45.0,
                value: status,
                borderRadius: 30.0,
                padding: 2.0,
                activeToggleColor: const Color(0xFF6E40C9),
                inactiveToggleColor: const Color(0xFF2F363D),
                activeSwitchBorder: Border.all(
                  color: const Color(0xFF3C1E70),
                  width: 6.0,
                ),
                inactiveSwitchBorder: Border.all(
                  color: const Color(0xFFD1D5DA),
                  width: 6.0,
                ),
                activeColor: const Color(0xFF271052),
                inactiveColor: Colors.white,
                activeIcon: const Icon(
                  Icons.nightlight_round,
                  color: Color(0xFFF8E3A1),
                ),
                inactiveIcon: const Icon(
                  Icons.wb_sunny,
                  color: Color(0xFFFFDF5D),
                ),
                onToggle: (value) {
                  setState(() {
                    status = value;
                    AppConst.themeNotifier.changeTheme();
                  });
                },
              )
            ],
          ),
          MyTextForm(),
        ],
      ),
    );
  }
}
