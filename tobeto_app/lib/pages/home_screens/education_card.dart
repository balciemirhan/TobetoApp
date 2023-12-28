import 'package:flutter/material.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({super.key});

  // final String egitmen;
  @override
  Widget build(BuildContext context) {
    // color library

    return Container(
      width: 370,
      height: 150,
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

          // color: const Color.fromARGB(255, 128, 102, 199),
          borderRadius: BorderRadius.circular(16)),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
    );
  }
}
