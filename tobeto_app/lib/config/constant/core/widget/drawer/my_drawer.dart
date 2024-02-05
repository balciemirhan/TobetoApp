import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/business_logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_app/business_logic/blocs/auth_bloc/auth_event.dart';
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
                elevation: 25,
                margin: const EdgeInsets.only(left: 20, right: 65),
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
              icon: const Icon(Icons.home_rounded),
              title: AppText.drawerHome,
              nav: "/home",
              onTap: () => Navigator.of(context).pushNamed("/curved"),
            ),
            MyListTile(
              icon: const Icon(Icons.reviews_rounded),
              title: AppText.drawerRating,
              nav: "/home",
              onTap: () => Navigator.of(context).pushNamed("/curved"),
            ),
            MyListTile(
              icon: const Icon(Icons.notifications_rounded),
              title: AppText.drawerNotice,
              nav: "/home",
              onTap: () => Navigator.of(context).pushNamed("/curved"),
            ),
            MyListTile(
              icon: const Icon(Icons.poll_rounded),
              title: AppText.drawerSurvey,
              nav: "/home",
              onTap: () => Navigator.of(context).pushNamed("/setting"),
            ),
            MyListTile(
              icon: const Icon(Icons.menu_book_rounded),
              title: AppText.drawerCatalog,
              nav: "/home",
              onTap: () => Navigator.of(context).pushNamed("/catalog"),
            ),
            MyListTile(
              icon: const Icon(Icons.calendar_month_rounded),
              title: AppText.drawerCalendar,
              nav: "/home",
              onTap: () => Navigator.of(context).pushNamed("/calendar"),
            ),
            MyListTile(
                image: Image.asset("assets/images/tobeto-logo-white.png",
                    width: 25),
                title: AppText.tobeto,
                nav: "/home",
                onTap: () {
                  context.read<AuthBloc>().add(UserOut());
                  Navigator.of(context).pushNamed("/login");
                }),
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
    this.icon,
    this.image,
  });
  final String title;
  final String nav;
  final void Function()? onTap;
  final Icon? icon;
  final Image? image;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.grey,
          )),
      //LinearBorder(side: BorderSide(color: Colors.black)),
      //Border.all(color: Colors.white, width: 2),
      elevation: 25,
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.only(
          left: 10, right: 55, bottom: 10), // Adjust margin

      child: ListTile(
        onTap: () {
          onTap!();
        },
        title: Text(title),
        leading: icon ?? image,
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            shadows: [
              Shadow(blurRadius: 15, color: Colors.deepPurple),
              Shadow(blurRadius: 5, color: Colors.black)
            ]),
      ),
    );
  }
}
