import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/catalog_course_model.dart';

class CatalogCourseItem extends StatefulWidget {
  const CatalogCourseItem({
    Key? key,
    required this.catalogCourse,
  }) : super(key: key);
  final CatalogCourse catalogCourse;

  @override
  State<CatalogCourseItem> createState() => _CatalogCourseItemState();
}

class _CatalogCourseItemState extends State<CatalogCourseItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/",
              arguments: widget.catalogCourse.title);
        },
        child: Center(
          child: NeuBox(
            width: 200,
            height: 200,
            child: _buildCatalogContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildCatalogContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(children: [
            Image(
              image: AssetImage(
                widget.catalogCourse.imagePath,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppTextTheme.small(widget.catalogCourse.title, context,
                    fontWeight: FontWeight.normal, textAlign: TextAlign.center),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.catalogCourse.lessonCount),
                    const SizedBox(width: 10),
                    Text(widget.catalogCourse.instructor),
                  ],
                ),
              ],
            )
          ]),
        ),
      ],
    );
  }
}
