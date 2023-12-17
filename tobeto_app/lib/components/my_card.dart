import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/theme_manager.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  // final String egitmen;
  @override
  Widget build(BuildContext context) {
    final themeManager = ThemeManager.of(context); // color library

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: 325,
        margin: const EdgeInsets.symmetric(vertical: 50),
        padding: const EdgeInsets.all(50),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black87,
                blurRadius: 20,
                offset: Offset(12, 12),
              )
            ],
            color: themeManager.theme.cardColor,
            // color: const Color.fromARGB(255, 128, 102, 199),
            borderRadius: BorderRadius.circular(16)),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Flutter",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              "OOP",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Eğitmen:"),
                Text(" John Doe"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
