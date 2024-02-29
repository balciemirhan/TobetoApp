import 'package:flutter/material.dart';
import 'package:tobeto_app/core/widget/neu_box.dart';
import 'package:tobeto_app/constant/theme/text.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppTextTheme.small(AppText.popularCourses, context),
          NeuBox(
              child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.expand_circle_down,
                    color: Colors.deepPurple,
                  )))
        ],
      ),
    );
  }
}
