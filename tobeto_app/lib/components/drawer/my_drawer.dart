import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTileTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(),
            ListTile(
              onTap: () {},
              title: Card(
                margin: const EdgeInsets.all(40),
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
            const Spacer(),
            const MyListTile(
              title: "Anasayfa",
              nav: "/home",
            ),
            const MyListTile(
              title: "Değerlendirmeler",
              nav: "/home",
            ),
            const MyListTile(
              title: "Profilim",
              nav: "/home",
            ),
            const MyListTile(
              title: "Katalog",
              nav: "/home",
            ),
            const MyListTile(
              title: "Takvim",
              nav: "/home",
            ),
            ListTile(
              onTap: () {},

              title: const Row(
                children: [
                  Text('Tobeto '),
                  Icon(
                    Icons.home,
                    shadows: [
                      Shadow(blurRadius: 15, color: Colors.deepPurple),
                      Shadow(blurRadius: 5, color: Colors.black)
                    ],
                  )
                ],
              ),
              titleTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  shadows: [
                    Shadow(blurRadius: 15, color: Colors.deepPurple),
                    Shadow(blurRadius: 5, color: Colors.black)
                  ]),

              //enableFeedback: false, // tıklama sesini kapatır
            ),
            const Spacer(flex: 2),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white54,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: const Text('© 2022 Tobeto'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.title,
    required this.nav,
  });
  final String title;
  final String nav;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(nav);
      },
      title: Text(title),
      titleTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, shadows: [
        Shadow(blurRadius: 15, color: Colors.deepPurple),
        Shadow(blurRadius: 5, color: Colors.black)
      ]),
    );
  }
}
