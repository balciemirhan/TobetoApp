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
    return Container(
      margin: const EdgeInsets.all(10),
      child: NeuBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: NeuBox(
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    image: AssetImage(
                      course.imagePath,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            AppTextTheme.small(course.title, context,
                textAlign: TextAlign.center, fontWeight: FontWeight.normal)
          ],
        ),
      ),
    );
  }
}
