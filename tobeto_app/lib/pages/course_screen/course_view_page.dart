import 'package:flutter/material.dart';
import 'package:tobeto_app/data/course_data.dart';
import 'package:tobeto_app/pages/course_screen/course_page.dart';

class CourseViewPage extends StatelessWidget {
  const CourseViewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int? index;
    final args = ModalRoute.of(context)!.settings.arguments as String?;
    if (args != null) {
      index = courseList.indexWhere((element) => element.title == args);
    }

    //ModalRoute sayfanın özel verilerini almak için kullanılır bunu da settings.arguments ile yapar
    final pageController = PageController(initialPage: index ?? 0);

    return PageView.builder(
      controller: pageController,
      itemCount: courseList.length,
      itemBuilder: (context, index) {
        return CoursePage(
          course: courseList[index],
        );
      },
    );
  }
}
