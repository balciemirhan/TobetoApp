

import 'package:flutter/material.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({
    Key? key,
    required this.title,
    this.onTap,
    this.icon,
    this.image,
    this.photo,
  }) : super(key: key);

  final Image? photo;
  final String title;
  final void Function()? onTap;
  final Icon? icon;
  final Image? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(horizontal: 20), // Yanlardan boşluk ekleme
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient:const LinearGradient(
          colors: [
            Color.fromARGB(255, 77, 12, 216),
            Color.fromARGB(255, 160, 139, 206)
          ], // İki renkli border
        ),
      ),
      child: ListTile(
        onTap: onTap,
        title: Column(
          children: [
            Container(
              child: photo,
            ),
            Text(title),
          ],
        ),
        leading: icon ?? image,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          shadows: [
            Shadow(blurRadius: 15, color: Colors.deepPurple),
            Shadow(blurRadius: 5, color: Colors.black),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Butona tıklandığında yapılacak işlem
          },
          child:const Text('Başla'), // Buton metni
        ),
      ),
    );
  }
}
