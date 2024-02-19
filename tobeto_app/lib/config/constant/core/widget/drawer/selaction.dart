import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/drawer/cotom.dart';
import 'package:tobeto_app/models/application_model.dart';

class MySecondListTile extends StatelessWidget {
  const MySecondListTile({
    Key? key,
    required this.applicationList,
  }) : super(key: key);

  final List<Application> applicationList;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
      elevation: 25,
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.only(left: 10, right: 55, bottom: 10),
      child: ListTile(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog(applicationList: applicationList);
            },
          );
        },
        title: Column(
          children: [
            const SizedBox(height: 10),
            const Text("İstanbul Kodluyoruz"), // Örnek bir başlık
          ],
        ),
        leading: Image.asset(
          "assets/images/tobeto-logo-white.png",
          width: 25,
        ),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          shadows: [
            Shadow(blurRadius: 15, color: Colors.deepPurple),
            Shadow(blurRadius: 5, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
