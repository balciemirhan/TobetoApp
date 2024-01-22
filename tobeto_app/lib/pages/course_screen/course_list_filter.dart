import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/image.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/data/course_data.dart';
import 'package:tobeto_app/models/course_model.dart';
import 'package:tobeto_app/pages/home_screens/course_item_vertical.dart';
import 'package:tobeto_app/widget/textfield_filter.dart';

class CourseListFilter extends StatefulWidget {
  const CourseListFilter({Key? key}) : super(key: key);

  @override
  State createState() => _CourseListState();
}

class _CourseListState extends State<CourseListFilter> {
  String searchText = "";
  List<Course> filteredCourses = [];
  int selectedFilter = 0; // Başlangıçta filtre olmadığını temsil eder

  @override
  // Başlangıçta Tüm kurslar gözüksün
  void initState() {
    super.initState();
    filteredCourses = courseList;
  }

  // <---------- Filter Systems ---------->

  void filterCourses() {
    setState(() {
      filteredCourses = courseList
          .where((course) =>
              course.title.toLowerCase().contains(searchText.toLowerCase()) &&
              (selectedFilter == 0 || course.filterNumber == selectedFilter))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceH = mediaQueryData.size.height;

    // <---------- TextFieldFilter (Search) ---------->

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFieldFilter(
            onChanged: (value) {
              setState(() {
                searchText = value; // Update the searchText variable
                filterCourses();
              });
            },
          ),
        ),

        // <---------- filterButtons ---------->

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              filterButton(0, all),
              filterButton(1, softWare),
              filterButton(2, softSkill),
              filterButton(3, other),
            ],
          ),
        ),

        // <---------- GridView (CourseItemVertical) ---------->

        SizedBox(
          height: deviceH / 1.55,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: filteredCourses.isNotEmpty
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      mainAxisExtent: 220,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: filteredCourses.length,
                    itemBuilder: (context, index) {
                      final course = filteredCourses[index];
                      return CourseItemVertical(course: course);
                    },
                  )

                // <---------- Not found : ---------->

                : const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: Text(
                          notFound,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Image(image: AssetImage(notFoundImage))
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  // <---------- filterButton Area ---------->

  // <---------- filterButtons Color and Text color Changes with Map Function ---------->

  Map<int, Color> filterButtonColors = {
    1: Colors.grey.shade200,
    2: Colors.grey.shade200,
    3: Colors.grey.shade200,
    0: Colors.deepPurple,
  };

  // <---------- filterButton ---------->

  Widget filterButton(int filter, String text) {
    Color textColor = filterButtonColors[filter] == Colors.grey.shade200
        ? Colors.black
        : Colors.white;
    return GestureDetector(
      onTap: () {
        setState(() {
          filterButtonColors.forEach((key, value) {
            filterButtonColors[key] =
                key == filter ? Colors.deepPurple : Colors.grey.shade200;
          });
          selectedFilter = filter;
          filterCourses();
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: filterButtonColors[filter],
          ),
          alignment: Alignment.center,
          width: 70,
          height: 30,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
