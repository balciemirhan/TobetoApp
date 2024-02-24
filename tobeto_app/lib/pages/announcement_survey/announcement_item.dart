import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/announcement_model.dart';

class AnnouncementItem extends StatelessWidget {
  const AnnouncementItem({Key? key, required this.announcement})
      : super(key: key);
  final AnnouncementModel announcement;

  @override
  Widget build(BuildContext context) {
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
              child: AppTextTheme.small(announcement.title, context,
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
                    AppTextTheme.xxSmall("${announcement.dateTime}", context)
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
