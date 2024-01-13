import 'package:flutter/material.dart';
import 'package:tobeto_app/data/course_data.dart';
import 'package:tobeto_app/pages/home_screens/course_item_vertical.dart';
import 'package:tobeto_app/pages/view_more_screen/top_bar_widget_interval.dart';

class ViewMorePage extends StatelessWidget {
  const ViewMorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceH = mediaQueryData.size.height;
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
              SizedBox(
                height: deviceH / 1.2,
                /*  width: deviceW / 2, */
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      mainAxisExtent: 220,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: courseList.length,
                    itemBuilder: (context, index) {
                      return CourseItemVertical(course: courseList[index]);
                    },
                    shrinkWrap: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
