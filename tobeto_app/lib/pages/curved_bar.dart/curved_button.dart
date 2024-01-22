import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tobeto_app/pages/bookmark/bookmark_page.dart';
import 'package:tobeto_app/pages/curved_bar.dart/curved_items.dart';
import 'package:tobeto_app/pages/favourite_screens/favourite_page.dart';
import 'package:tobeto_app/pages/home_screens/home_page.dart';
import 'package:tobeto_app/pages/profile_screen/profile_page.dart';

class CurvedNavBarWidget extends StatefulWidget {
  const CurvedNavBarWidget({Key? key}) : super(key: key);

  @override
  State<CurvedNavBarWidget> createState() => _CurvedNavBarWidgetState();
}

class _CurvedNavBarWidgetState extends State<CurvedNavBarWidget> {
  int currentIndex = 0;

  /*  final navigationKey = GlobalKey<CurvedNavigationBarState>(); */
  final List<Widget> pages = const [
    HomePage(),
    BookmarkPage(),
    FavouritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    List<Icon> items = curvedItems();
    return Scaffold(
        extendBody: true,
        body: pages[currentIndex],
        /* body: Center(child: Text('${currentIndex}')), */

        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            /*  key: navigationKey, */
            color: Colors.deepPurple.shade200,
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
