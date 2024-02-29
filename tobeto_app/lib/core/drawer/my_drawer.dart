import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto_app/api/blocs/note_bloc/note_bloc.dart';
import 'package:tobeto_app/api/blocs/note_bloc/note_event.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/constant/theme/image.dart';
import 'package:tobeto_app/constant/theme/text.dart';
import 'package:tobeto_app/models/user_model.dart';

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
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileInitial || state is ProfileUpdated) {
                  context.read<ProfileBloc>().add(GetProfil());
                }
                if (state is ProfileLoaded) {
                  UserModel user = state.user;
                  return MyListTile(
                      key: _adSoyadKey,
                      title: "${user.name} ${user.surname}" ?? "",
                      photo: CircleAvatar(
                          minRadius: 20,
                          maxRadius: 35,
                          backgroundImage: NetworkImage(user.profilePhoto!)),
                      onTap: () {
                        _showPopupMenu(context, _adSoyadKey);
                      });
                }
                return Container();
              },
            ),
            const Spacer(),
            MyListTile(
              image: AppImage.home,
              title: AppText.drawerHome,
              onTap: () => Navigator.of(context).pushNamed("/curved"),
            ),
            MyListTile(
              image: AppImage.announcement,
              title: AppText.drawerNotice,
              onTap: () => Navigator.of(context).pushNamed("/announcement"),
            ),
            MyListTile(
              image: AppImage.catalog,
              title: AppText.drawerCatalog,
              onTap: () => Navigator.of(context).pushNamed("/catalog"),
            ),
            MyListTile(
              image: AppImage.calendar,
              title: AppText.drawerCalendar,
              onTap: () => Navigator.of(context).pushNamed("/calendar"),
            ),
            MyListTile(
              image: AppImage.exam,
              title: AppText.drawerExam,
              onTap: () => Navigator.of(context).pushNamed("/exam"),
            ),
            MyListTile(
              image: AppImage.admin,
              title: AppText.drawerAdmin,
              onTap: () => Navigator.of(context).pushNamed("/admin"),
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
    this.image,
    this.photo,
  });
  final Widget? photo;
  final String title;

  final void Function()? onTap;

  final String? image;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.grey,
          )),
      elevation: 25,
      margin: const EdgeInsets.only(left: 10, right: 55, bottom: 10),
      child: ListTile(
        onTap: onTap,
        title: Column(
          children: [
            Container(
              child: photo,
            ),
            Text(
              title,
            ),
          ],
        ),
        leading: image != null
            ? Image(
                image: AssetImage(image!),
                height: 25,
                color: Colors.white,
              )
            : null,
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}

enum _MenuValues { exit }

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
      buttonBox.localToGlobal(Offset.zero).dy + offsetY / 5,
      buttonBox.localToGlobal(buttonBox.size.bottomRight(Offset.zero)).dx,
      buttonBox.localToGlobal(buttonBox.size.bottomRight(Offset.zero)).dy +
          offsetY,
    ),
    items: [
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
    case _MenuValues.exit:
      context.read<ProfileBloc>().add(ClearState());
      context.read<AuthBloc>().add(UserOut());
      context.read<NoteBloc>().add(ClearNote());
      Navigator.of(context).pushNamed("/start");
      break;
  }
}
