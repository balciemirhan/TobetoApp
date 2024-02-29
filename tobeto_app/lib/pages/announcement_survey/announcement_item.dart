import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tobeto_app/core/widget/neu_box.dart';
import 'package:tobeto_app/constant/format/date_formatter.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/announcement_model.dart';

class AnnouncementItem extends StatelessWidget {
  const AnnouncementItem({Key? key, required this.announcement})
      : super(key: key);
  final AnnouncementModel announcement;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: InkWell(
        child: NeuBox(
          width: 250,
          child: Column(
            children: [
              const Spacer(
                flex: 3,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: AppTextTheme.xSmall(announcement.title, context,
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
                      AppTextTheme.xxSmall(
                          DateFormatter.dateFormatter
                              .format(announcement.dateTime ?? DateTime.now()),
                          context)
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
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Kapat"))
              ],
              title: AppTextTheme.small(
                announcement.title,
                context,
                textAlign: TextAlign.center,
              ),
              contentPadding: const EdgeInsets.all(15),
              content: SingleChildScrollView(
                child: AppTextTheme.xSmall(announcement.text, context,
                    fontWeight: FontWeight.normal),
              ),
            ),
          );
        },
      ),
    );
  }
}
