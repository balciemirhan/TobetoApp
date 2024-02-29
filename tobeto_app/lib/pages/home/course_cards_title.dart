import 'package:flutter/material.dart';
import 'package:tobeto_app/constant/theme/text.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';

// import 'package:tobeto_app/pages/home_screens/education_card.dart';

class CourseCardsTitle extends StatelessWidget {
  const CourseCardsTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppTextTheme.concertOne(AppText.courses, context),
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed("/viewmore"),
            icon: const Icon(
              Icons.keyboard_double_arrow_right_rounded,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
