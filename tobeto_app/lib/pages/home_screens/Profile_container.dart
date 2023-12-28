import 'package:flutter/material.dart';

import 'package:tobeto_app/config/constant/theme/text.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),

      // Profilini oluştur kutucuğu
      child: Container(
        height: 150,
        width: 350,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0), // sivri kenar
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 29, 11, 140),
              Color.fromARGB(255, 178, 155, 246)
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              createProfile,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(240, 153, 51, 255),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15)),
                child: const Text(
                  start,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
