import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';

class AnnouncementItem extends StatelessWidget {
  const AnnouncementItem({Key? key, required this.title, required this.date})
      : super(key: key);

  final String title;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd.MM.yyyy').format(date);

    return Container(
      margin: const EdgeInsets.all(15),
      child: NeuBox(
        width: 250,
        child: Column(
          children: [
            const Spacer(
              flex: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppTextTheme.small(title, context,
                  textAlign: TextAlign.center),
            ),
            const Spacer(
              flex: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.calendar,
                      color: Colors.blue.shade900,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    AppTextTheme.xxSmall(formattedDate, context)
                  ],
                ),
                Icon(
                  Icons.touch_app_rounded,
                  color: Colors.blue.shade900,
                  size: 22,
                )
              ],
            ),
            const Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
