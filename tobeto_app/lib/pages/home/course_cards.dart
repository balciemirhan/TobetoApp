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
              margin: const EdgeInsets.all(0.5),
              alignment: Alignment.center,
              width: 128,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(40, 20),
                    bottom: Radius.circular(12)),
              ),
              child: Text(
                course.title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              )),
        )
      ]),
    );
  }
}
