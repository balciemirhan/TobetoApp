import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      color: Colors.black,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
          tabBackgroundGradient: LinearGradient(
            colors: [Color.fromARGB(125, 104, 58, 183), Colors.deepPurple],
            stops: [0.25, 0.75],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),

          // icon - text farkı :gap
          // onTabChange: ayarlarsayfası,
          gap: 8,
          padding: EdgeInsets.all(16),
          backgroundColor: Colors.transparent,
          color: Colors.deepPurple,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.deepPurple,

          tabs: [
            GButton(
              icon: Icons.home,
              text: "Anasayfa",
              // shadow: [
              //   BoxShadow(color: Colors.black, blurRadius: 5, spreadRadius: 3),
              // ],
            ),
            GButton(
              icon: Icons.favorite_border,
              text: "Favoriler",
            ),
            GButton(
              icon: Icons.search,
              text: "Arama",
            ),
            GButton(
              icon: Icons.settings,
              text: "Ayarlar",
            ),
          ],
        ),
      ),
    );
  }
}
