import 'package:flutter/material.dart';
import 'package:tobeto_app/pages/view_more_screen/top_bar_widget_interval.dart';
import 'package:tobeto_app/pages/course_screen/course_list_filter.dart';

class ViewMorePage extends StatelessWidget {
  const ViewMorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* final double deviceW = mediaQueryData.size.width; */
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopBarWidgetInterval(
                iconButton: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/curved");
                    },
                    icon: const Icon(Icons.arrow_back)),
                titleText: "Kurslar",
                leadingIcon: const Icon(Icons.cast_for_education_rounded),
              ),

              //  <------- CourseListFilter (Search and Gridview (CourseItemVertical)) ------->

              const CourseListFilter(),
            ],
          ),
        ),
      ),
    );
  }
}
