import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/theme_manager.dart';

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
                title: Card(
                  margin: EdgeInsets.all(40),
                  shadowColor: Colors.deepPurple,
                  color: Colors.deepPurple[200],
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage("assets/images/kitty.png")),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'Ad Soyad',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
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
