import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto_app/api/blocs/note_bloc/note_bloc.dart';
import 'package:tobeto_app/api/blocs/note_bloc/note_event.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto_app/config/constant/core/widget/drawer/selaction.dart';
import 'package:tobeto_app/config/constant/theme/image.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/data/application.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);
  final GlobalKey _adSoyadKey = GlobalKey();
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
            MyListTile(
                key: _adSoyadKey,
                title: "Ad Soyad",
                photo: const Image(
                    image: AssetImage(AppImage.profileImage), height: 60),
                onTap: () {
                  _showPopupMenu(context, _adSoyadKey);
                }),
            const Spacer(),
            MyListTile(
              icon: const Icon(Icons.home_rounded),
              title: AppText.drawerHome,
              onTap: () => Navigator.of(context).pushNamed("/curved"),
            ),
            MyListTile(
              icon: const Icon(Icons.reviews_rounded),
              title: AppText.drawerRating,
              onTap: () => Navigator.of(context).pushNamed("/curved"),
            ),
            MyListTile(
              icon: const Icon(Icons.notifications_rounded),
              title: AppText.drawerNotice,
              onTap: () => Navigator.of(context).pushNamed("/notice"),
            ),
            MyListTile(
              icon: const Icon(Icons.menu_book_rounded),
              title: AppText.drawerCatalog,
              onTap: () => Navigator.of(context).pushNamed("/catalog"),
            ),
            MyListTile(
              icon: const Icon(Icons.calendar_month_rounded),
              title: AppText.drawerCalendar,
              onTap: () => Navigator.of(context).pushNamed("/calendar"),
            ),
            MyListTile(
                image: Image.asset("assets/images/tobeto-logo-white.png",
                    width: 25),
                title: AppText.tobeto,
                onTap: () {}),
            MySecondListTile(
              applicationList: applicationList,
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
    this.onTap,
    this.icon,
    this.image,
    this.photo,
  });
  final Image? photo;
  final String title;

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
      margin: const EdgeInsets.only(left: 10, right: 55, bottom: 10),
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
              Shadow(blurRadius: 5, color: Colors.black)
            ]),
      ),
    );
  }
}

enum _MenuValues { settings, exit }

void _showPopupMenu(BuildContext context, GlobalKey buttonKey) async {
  final RenderBox buttonBox =
      buttonKey.currentContext!.findRenderObject() as RenderBox;
  final offsetY = buttonBox.size.height;
  final offsetX = buttonBox.size.width / 1.2;

  showMenu(
    context: context,
    constraints: const BoxConstraints(maxHeight: 110, maxWidth: 50),
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    position: RelativeRect.fromLTRB(
      buttonBox.localToGlobal(Offset.zero).dx + offsetX,
      buttonBox.localToGlobal(Offset.zero).dy,
      buttonBox.localToGlobal(buttonBox.size.bottomRight(Offset.zero)).dx,
      buttonBox.localToGlobal(buttonBox.size.bottomRight(Offset.zero)).dy +
          offsetY,
    ),
    items: [
      const PopupMenuItem(
        value: _MenuValues.settings,
        child: Icon(Icons.settings),
      ),
      const PopupMenuItem(
        value: _MenuValues.exit,
        child: Icon(Icons.exit_to_app_rounded),
      ),
    ],
    elevation: 25,
  ).then((value) {
    if (value != null) {
      _handleMenuSelection(context, value);
    }
  });
}

void _handleMenuSelection(BuildContext context, dynamic value) {
  switch (value) {
    case _MenuValues.settings:
      Navigator.of(context).pushNamed("/setting");
      break;
    case _MenuValues.exit:
      context.read<ProfileBloc>().add(ClearState());
      context.read<AuthBloc>().add(UserOut());
      context.read<NoteBloc>().add(ClearNote());
      Navigator.of(context).pushNamed("/start");
      break;
  }
}
