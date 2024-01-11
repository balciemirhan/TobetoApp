import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/course_model.dart';

class CourseItemVertical extends StatelessWidget {
  const CourseItemVertical({Key? key, required this.course}) : super(key: key);
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed("/course", arguments: course);
        },
        child: Center(
          child: Stack(
            children: [
              NeuBox(
                width: 200,
                height: 200,
                child: _buildCategoryContent(),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_add_outlined,
                  size: 30,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NeuBox(
          width: 100,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
              width: 100,
              height: 100,
              image: AssetImage(
                course.imagePath,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            course.title,
            style: AppText.body2,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(course.lessonCount),
            const SizedBox(width: 10),
            Text("${course.rating}"),
            const Icon(
              Icons.star,
              size: 20,
              color: Colors.deepPurple,
            ),
            const SizedBox(width: 10),
          ],
        ),
      ],
    );
  }
}
