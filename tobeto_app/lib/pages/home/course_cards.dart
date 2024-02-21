import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/course_model.dart';

class CourseCards extends StatelessWidget {
  const CourseCards({Key? key, required this.course}) : super(key: key);

  // Category modellerimi çağırıyorum'ki kullanabileyim.
  final Course course;

  @override
  Widget build(BuildContext context) {
    return NeuBox(
      width: 130,
      child: Stack(alignment: Alignment.center, children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  course.imagePath,
                ),
                fit: BoxFit.fill),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            alignment: Alignment.center,
            width: 130,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius:
                  BorderRadius.vertical(top: Radius.elliptical(40, 20)),
            ),
            child: AppTextTheme.xxSmall(course.title, context,
                textAlign: TextAlign.center, fontWeight: FontWeight.normal),
          ),
        )
      ]),
    );
  }
}
