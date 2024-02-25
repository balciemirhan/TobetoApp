import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto_app/config/constant/core/widget/my_dialog_button.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';

class MyDialog extends StatelessWidget {
  final String title;
  final Color color;
  final String imagePath;

  const MyDialog({
    Key? key,
    required this.title,
    required this.color,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        height: 325,
        width: 400,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 400,
                color: color,
                child: Image.asset(
                  height: 50,
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: AppTextTheme.small(title, context),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      myDialogButton("Hayır", () => Navigator.of(context).pop(),
                          color: Colors.white, textColor: Colors.black),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: myDialogButton(
                          "Evet",
                          textColor: Colors.white,
                          color: Colors.deepPurple,
                          () {
                            context.read<ProfileBloc>().add(DeleteProfile());
                            context.read<AuthBloc>().add(DeleteUserEmail());
                            Navigator.pushNamed(context, "/start");
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
