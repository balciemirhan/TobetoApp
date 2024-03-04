import 'package:flutter/material.dart';

class ReviwesList extends StatelessWidget {
  const ReviwesList({
    Key? key,
    required this.title,
    this.onTap,
    this.icon,
    this.image,
    this.photo,
    this.trailing,
  }) : super(key: key);

  final Image? photo;
  final String title;
  final void Function()? onTap;
  final Widget? icon;
  final Image? image;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 130, 106, 182),
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
          trailing: trailing),
    );
  }
}
