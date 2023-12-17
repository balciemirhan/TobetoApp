import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Spacer(),
              ListTile(
                onTap: () {},
                title: const Row(
                  children: [
                    CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage("assets/images/tobeto-logo.png")),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Ad Soyad',
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Spacer(),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed("/home");
                },
                title: Text('Anasayfa'),
              ),
              ListTile(
                onTap: () {},
                title: Text('Değerlendirmeler'),
              ),
              ListTile(
                onTap: () {},
                title: Text('Profilim'),
              ),
              ListTile(
                onTap: () {},
                title: Text('Katalog'),
              ),
              ListTile(
                onTap: () {},
                title: Text('Takvim'),
              ),
              ListTile(
                onTap: () {},

                title: Row(
                  children: [Text('Tobeto '), Icon(Icons.home)],
                ),

                //enableFeedback: false, // tıklama sesini kapatır
              ),
              Spacer(flex: 2),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text('© 2022 Tobeto'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
