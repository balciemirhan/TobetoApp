import 'package:flutter/material.dart';
import 'package:tobeto_app/pages/curved_bar.dart/top_bar_widget.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

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
                titleText: "Favoriler",
                leadingIcon: Icon(
                  Icons.favorite,
                  color: Colors.red,
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
