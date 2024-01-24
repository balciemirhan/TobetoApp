import 'package:flutter/material.dart';
import 'package:tobeto_app/auth/signout_auth.dart';
import 'package:tobeto_app/config/constant/theme/image.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';

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
                          backgroundImage: AssetImage(AppImage.profileImage)),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        AppText.drawerNameSurname,
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
              title: AppText.drawerHome,
              nav: "/home",
              onTap: () => Navigator.of(context).pushNamed("/curved"),
            ),
            MyListTile(
              title: AppText.drawerRating,
              nav: "/home",
              onTap: () => Navigator.of(context).pushNamed("/curved"),
            ),
            MyListTile(
              title: AppText.drawerProfile,
              nav: "/home",
              onTap: () => Navigator.of(context).pushNamed("/curved"),
            ),
            MyListTile(
              title: AppText.drawerCatalog,
              nav: "/home",
              onTap: () => Navigator.of(context).pushNamed("/curved"),
            ),
            MyListTile(
              title: AppText.drawerCalendar,
              nav: "/home",
              onTap: () => Navigator.of(context).pushNamed("/calendar"),
            ),
            MyListTile(
              title: AppText.settings,
              nav: "/home",
              onTap: () => Navigator.of(context).pushNamed("/setting"),
            ),
            ListTile(
              onTap: () {
                SignOut.logout(context);
              },

              title: const Row(
                children: [
                  Text(AppText.tobeto),
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
                child: const Text(AppText.drawerCopyRight),
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
