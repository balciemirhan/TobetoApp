import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/course_model.dart';
import 'package:tobeto_app/pages/bookmark/bookmark_add.dart';

class CourseItem extends StatefulWidget {
  const CourseItem({
    Key? key,
    required this.course,
  }) : super(key: key);
  final Course course;

  @override
  State<CourseItem> createState() => _CourseItemState();
}

class _CourseItemState extends State<CourseItem> {
/*   get index => courseList; */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/course",
              arguments: widget.course.title);
        },
        child: Center(
          child: NeuBox(
            width: 200,
            child: _buildCategoryContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 120,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey.shade700, blurRadius: 10)],
            image: DecorationImage(
                image: AssetImage(
                  widget.course.imagePath,
                ),
                fit: BoxFit.cover),
            borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(50), top: Radius.circular(10)),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(10),
          height: 50,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey.shade700, blurRadius: 10)],
            color: Colors.grey[300],
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: AppTextTheme.xxSmall(widget.course.title, context,
              textAlign: TextAlign.center),
        ),
      ],
    );
  }
}

// <----------------- BookMark ADD functions ----------------->

void _addToBookMark(BuildContext context, Course course) {
  BookMarkAdd.addToBookMark(course);
}
