import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/course_model.dart';
import 'package:tobeto_app/pages/course_screen/course_image.dart';
import 'package:tobeto_app/widget/progress_bar_animation.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key, required this.course}) : super(key: key);
  final Course course;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 4, child: CourseImage(course: course)),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    course.title,
                    style: AppText.body1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ProgressBarAnimation(
                        progress: course.progress,
                      ),
                      const Spacer(),
                      NeuBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${course.rating} ",
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
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            indicator: BoxDecoration(
                color: Colors.grey.shade300,
                boxShadow: const [
                  BoxShadow(blurRadius: 10, color: Colors.white)
                ],
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            tabs: const [
              Tab(
                text: "İçerik",
              ),
              Tab(
                text: "Hakkında",
              ),
            ],
          ),
          const Expanded(
            child: TabBarView(
              children: [
                Center(
                  child: Text("Videolar"),
                ),
                Center(
                  child: Text("Hakkında"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
