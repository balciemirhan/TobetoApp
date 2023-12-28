import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromARGB(240, 150, 51, 251),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Image.asset(
                tobetoImageWhite,
                height: 150,
                width: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                onPressed: () {
                  // Bize Ulaşın butonu tıklandığında yapılacak işlemler
                },
                child: const Text(
                  contactUs,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
