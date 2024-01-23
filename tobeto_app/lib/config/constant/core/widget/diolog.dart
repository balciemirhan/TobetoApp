import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  final String title;
  final Color color;
  final String imagePath;

  const MyDialog({
    Key? key,
    required this.title,
    required this.color,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        height: 200,
        width: 200,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 280,
                color: color, // Use the provided color parameter here
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(title),
                  Text(
                      title), // You might want to change this line to display a different text
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.blue, // Use backgroundColor instead of primary
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                    ),
                    child: const Text(
                      "Okay",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
