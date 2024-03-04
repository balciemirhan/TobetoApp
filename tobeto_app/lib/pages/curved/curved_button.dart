import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tobeto_app/pages/curved/curved_items.dart';
import 'package:tobeto_app/pages/home/home_page.dart';
import 'package:tobeto_app/pages/profile/profile_page.dart';
import 'package:tobeto_app/pages/reviwes/reviwes_page.dart';

class CurvedNavBarWidget extends StatefulWidget {
  const CurvedNavBarWidget({Key? key}) : super(key: key);

  @override
  State<CurvedNavBarWidget> createState() => _CurvedNavBarWidgetState();
}

class _CurvedNavBarWidgetState extends State<CurvedNavBarWidget> {
  int currentIndex = 0;
  final List<Widget> pages = const [
    HomePage(),
    RevisterPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    List<Icon> items = curvedItems();
    return Scaffold(
        extendBody: true,
        body: pages[currentIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            color: theme.brightness == Brightness.light
                ? Colors.deepPurple.shade200
                : Colors.deepPurple,
            buttonBackgroundColor: Colors.deepPurple,
            animationDuration: const Duration(milliseconds: 300),
            animationCurve: Curves.easeInOut,
            items: items,
            height: 65,
            index: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ));
  }
}
