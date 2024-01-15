import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

//butona atamak için oluşturduğum fonksiyon. => logout()

/* ----------------------- logout Function -----------------------  */

  Future<void> logout(context) async {
    // çıkış düğmesine tıkladığımızda yapmak istediklerimiz:
    // hem firebase'den çıkış yapsın hem' de uygulamadan.

    await FirebaseAuth.instance.signOut().whenComplete(
          () => Navigator.of(context).pushNamed("/authGate"),
        );
  }

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
            MyListTile(
              title: "Anasayfa",
              nav: "/home",
              onTap: () => Navigator.of(context).pushNamed("/curved"),
            ),
            MyListTile(
              title: "Değerlendirmeler",
              nav: "/home",
              onTap: () => Navigator.of(context).pushNamed("/curved"),
            ),
            MyListTile(
              title: "Profilim",
              nav: "/home",
              onTap: () => Navigator.of(context).pushNamed("/curved"),
            ),
            MyListTile(
              title: "Katalog",
              nav: "/home",
              onTap: () => Navigator.of(context).pushNamed("/curved"),
            ),
            MyListTile(
              title: "Takvim",
              nav: "/home",
              onTap: () => Navigator.of(context).pushNamed("/calendar"),
            ),
            ListTile(
              onTap: () {
                logout(context);
              },

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
    this.onTap,
  });
  final String title;
  final String nav;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap!();
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
