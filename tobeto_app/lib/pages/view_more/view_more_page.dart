import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/top_bar_widget_interval.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/pages/view_more/course_list_filter.dart';

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
                titleText: AppText.courses,
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