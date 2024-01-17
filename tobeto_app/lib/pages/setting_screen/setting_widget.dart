import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/neu_box.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    Key? key,
    required this.leadingIcon,
    required this.titleText,
    required this.iconButton,
  }) : super(key: key);

  final Icon leadingIcon;
  final String titleText;
  final IconButton iconButton;
  /* final  Map<String, Object> settingsData; */

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: NeuBox(
            width: 250,
            height: 80,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: NeuBox(
                          width: 40,
                          height: 40,
                          child: leadingIcon,
                        ),
                      ),
                      Text(titleText),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: NeuBox(
                          width: 40,
                          height: 40,
                          child: iconButton,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(
          height: 30,
          color: Colors.grey[200],
          /* endIndent: 30,
          indent: 30, */
        ),
      ],
    );
  }
}
