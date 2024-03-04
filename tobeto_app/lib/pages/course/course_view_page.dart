import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/course_bloc/course_bloc.dart';
import 'package:tobeto_app/api/blocs/course_bloc/course_event.dart';
import 'package:tobeto_app/api/blocs/course_bloc/course_state.dart';
import 'package:tobeto_app/models/course_model.dart';
import 'package:tobeto_app/pages/course/course_page.dart';

class CourseViewPage extends StatelessWidget {
  const CourseViewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseBloc, CourseState>(
      builder: (context, state) {
        if (state is CourseInitial) {
          context.read<CourseBloc>().add(GetCourse());
          return const Center(
            child: Text("İstek Atılıyor..."),
          );
        }
        if (state is CourseLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CourseLoaded) {
          final List<Course> course = state.course;
          final args = ModalRoute.of(context)!.settings.arguments as String?;
          int? index;
          if (args != null) {
            index = course.indexWhere((element) => element.title == args);
          }
          final pageController = PageController(initialPage: index ?? 0);

          return PageView.builder(
            controller: pageController,
            itemCount: course.length,
            itemBuilder: (context, index) {
              return CoursePage(
                course: course[index],
              );
            },
          );
        }
        if (state is CourseError) {
          Center(
            child: Text(state.message),
          );
        }
        return Container();
      },
    );
  }
}
