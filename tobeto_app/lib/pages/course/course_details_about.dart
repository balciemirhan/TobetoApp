import 'package:flutter/material.dart';
import 'package:tobeto_app/constant/theme/color.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';

class CourseDetailsAbout extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  const CourseDetailsAbout({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: theme.brightness == Brightness.light
                ? AppColor.neuBoxColorLight
                : AppColor.neuBoxColorDark,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTextTheme.xSmall(title, context),
                ),
                AppTextTheme.xSmall(description, context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
