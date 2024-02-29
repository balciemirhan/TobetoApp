import 'package:flutter/material.dart';
import 'package:tobeto_app/constant/theme/color.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/course_model.dart';

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
    Brightness currentBrightness = Theme.of(context).brightness;
    Color containerColor = currentBrightness == Brightness.light
        ? Colors.deepPurple.shade100
        : AppColor.neuBoxColorDark;

    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceH = mediaQueryData.size.height;
    final double deviceW = mediaQueryData.size.width;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/course", arguments: widget.course.title);
      },
      child: Container(
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              height: deviceH / 5.2,
              width: deviceW / 2,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade700, blurRadius: 10)
                ],
                color: containerColor,
                borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(50), top: Radius.circular(12)),
              ),
              child: AppTextTheme.xxSmall(widget.course.title, context,
                  textAlign: TextAlign.center),
            ),
            Container(
              height: deviceH / 7,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade700, blurRadius: 10)
                ],
                image: DecorationImage(
                    image: AssetImage(
                      widget.course.imagePath,
                    ),
                    fit: BoxFit.cover),
                borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(50), top: Radius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
