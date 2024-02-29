import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/background_image.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/image.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/catalog_course_model.dart';
import 'package:tobeto_app/models/course_model.dart';
import 'package:tobeto_app/pages/catalog_course/catalog_course_image.dart';
import 'package:tobeto_app/pages/course/course_image.dart';
import 'package:tobeto_app/config/constant/core/widget/progress_bar_animation.dart';

class CatalogCoursePage extends StatelessWidget {
  const CatalogCoursePage({Key? key, required this.catalogCourse})
      : super(key: key);
  final CatalogCourse catalogCourse;
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
                flex: 4,
                child: CatalogCourseImage(
                  catalogCourse: catalogCourse,
                )),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    AppTextTheme.small(catalogCourse.title, context),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        ProgressBarAnimation(
                          progress: catalogCourse.progress,
                        ),
                        const Spacer(),
                        NeuBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${catalogCourse.rating} ",
                                style: const TextStyle(fontSize: 13),
                              ),
                              const Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.deepPurple,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(flex: 7, child: TabBarExample())
          ],
        ),
      ),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      animationDuration: Durations.long2,
      child: Column(
        children: [
          TabBar(
            splashBorderRadius: const BorderRadius.all(Radius.circular(30)),
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: Colors.grey.shade700,
            labelColor: Colors.deepPurple,
            labelStyle:
                const TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            indicator: BoxDecoration(
                color: Colors.grey.shade300,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(5, 5),
                      color: Colors.grey.shade500)
                ],
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            tabs: const [
              Tab(
                text: AppText.courseContent,
              ),
              Tab(
                text: AppText.courseAbout,
              ),
            ],
          ),
          const Expanded(
            child: TabBarView(
              children: [
                Center(
                  child: Text(AppText.courseVideos),
                ),
                Center(
                  child: Text(AppText.courseAbout),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
