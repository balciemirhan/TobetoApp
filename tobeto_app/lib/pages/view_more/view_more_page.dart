import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/course_bloc/course_bloc.dart';
import 'package:tobeto_app/api/blocs/course_bloc/course_event.dart';
import 'package:tobeto_app/api/blocs/course_bloc/course_state.dart';
import 'package:tobeto_app/constant/theme/image.dart';
import 'package:tobeto_app/core/widget/background_image.dart';
import 'package:tobeto_app/core/widget/top_bar_widget_interval.dart';
import 'package:tobeto_app/constant/theme/text.dart';
import 'package:tobeto_app/pages/view_more/course_list_filter.dart';

class ViewMorePage extends StatelessWidget {
  const ViewMorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BackgroundImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopBarWidget(
                iconButton: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                titleText: AppText.courses,
                image: Image(
                  image: const AssetImage(AppImage.course),
                  color: theme.brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  height: 25,
                ),
              ),
              BlocBuilder<CourseBloc, CourseState>(
                builder: (context, state) {
                  if (state is CourseInitial) {
                    context.read<CourseBloc>().add(GetCourse());
                    return const Center(child: Text("İstek Atılıyor..."));
                  }
                  if (state is CourseLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is CourseLoaded) {
                    final course = state.course;

                    return CourseListFilter(course: course);
                  }
                  if (state is CourseError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  return const Center(
                    child: Text("Geçmiş Olsun... "),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
