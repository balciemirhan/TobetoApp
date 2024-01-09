import 'package:flutter/material.dart';
import 'package:tobeto_app/pages/curved_bar.dart/top_bar_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopBarWidget(
                titleText: "Profil",
                leadingIcon: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 23, 62, 128),
                ),
              )
            ],
          ),
        ),
      ),
      // Add other widgets or configurations as needed
    );
  }
}
