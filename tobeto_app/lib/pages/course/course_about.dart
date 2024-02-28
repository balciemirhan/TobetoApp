import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tobeto_app/models/course_model.dart';
import 'package:tobeto_app/pages/course/course_details_about.dart';

class CourseAbout extends StatelessWidget {
  const CourseAbout({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return CourseDetailsAbout(
                  title: "Başlangıç:",
                  icon: FontAwesomeIcons.calendar,
                  description:
                      "${course.startDate.day}/0${course.startDate.weekday}/${course.startDate.year}",
                );
              case 1:
                return CourseDetailsAbout(
                  title: "Bitiş:",
                  icon: FontAwesomeIcons.calendarWeek,
                  description:
                      "${course.endDate.day}/0${course.endDate.weekday}/${course.endDate.year}",
                );
              case 2:
                return CourseDetailsAbout(
                  title: "Geçirdiğin Süre:",
                  icon: FontAwesomeIcons.clock,
                  description: "${course.spentTime.inHours} saat"
                      " ${course.spentTime.inMinutes.remainder(60)} dakika",
                );
              case 3:
                return CourseDetailsAbout(
                  title: "Tahmini Süre:",
                  icon: FontAwesomeIcons.clock,
                  description: "${course.estimatedTime.inHours} saat"
                      " ${course.estimatedTime.inMinutes.remainder(60)} dakika",
                );

              case 4:
                return CourseDetailsAbout(
                  title: "Eğitmen:",
                  icon: FontAwesomeIcons.person,
                  description: course.instructor ?? "",
                );
              case 5:
                return CourseDetailsAbout(
                  title: "Video Sayısı:",
                  icon: FontAwesomeIcons.video,
                  description: course.videoCount.toString(),
                );
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
