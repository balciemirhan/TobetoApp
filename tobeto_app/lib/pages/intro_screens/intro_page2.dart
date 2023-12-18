//gece gündüz
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:tobeto_app/config/constant/app_const.dart';
import 'package:tobeto_app/config/constant/theme/theme_manager.dart';

class IntroPage2 extends StatefulWidget {
  @override
  State<IntroPage2> createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeManager.of(context).theme.primaryColor,
      child: FlutterSwitch(
        width: 100,
        height: 55,
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
      ),
    );
  }
}
