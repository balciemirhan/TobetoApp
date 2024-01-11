import 'package:flutter/material.dart';
import 'package:tobeto_app/data/course_data.dart';
import 'package:tobeto_app/models/course_model.dart';
import 'package:tobeto_app/pages/course_screen/course_page.dart';

class CourseViewPage extends StatelessWidget {
  const CourseViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: courseList.length,
      itemBuilder: (context, index) {
        return CoursePage(
          course: courseList[index],
        );
      },
    );
  }
}
