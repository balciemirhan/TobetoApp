import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/top_bar_widget_interval.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/pages/catalog/catalog_course_filter.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                titleText: AppText.catalog,
                leadingIcon: const Icon(Icons.book_outlined),
              ),

              //  <------- CourseListFilter (Search and Gridview (CourseItemVertical)) ------->

              const CatalogCourseFilter(),
            ],
          ),
        ),
      ),
    );
  }
}
