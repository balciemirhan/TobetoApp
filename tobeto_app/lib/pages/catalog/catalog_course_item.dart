import 'package:flutter/material.dart';
import 'package:tobeto_app/core/widget/neu_box.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';
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
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceW = mediaQueryData.size.width;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/catalogCourse",
            arguments: widget.catalogCourse.title);
      },
      child: NeuBox(
        width: deviceW / 2,
        child: _buildCatalogContent(),
      ),
    );
  }

  Widget _buildCatalogContent() {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter:
                  const ColorFilter.mode(Colors.white10, BlendMode.color),
              opacity: .4,
              image: AssetImage(widget.catalogCourse.imagePath),
            )),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppTextTheme.small(widget.catalogCourse.title, context,
                textAlign: TextAlign.center),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextTheme.xxSmall(
                    widget.catalogCourse.lessonCount,
                    fontWeight: FontWeight.normal,
                    context),
                const SizedBox(width: 10),
                AppTextTheme.xxSmall(widget.catalogCourse.instructor, context),
              ],
            ),
          ],
        ),
      )
    ]);
  }
}
