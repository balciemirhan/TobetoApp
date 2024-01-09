import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/category.dart';

class CategoryItemVertical extends StatelessWidget {
  const CategoryItemVertical({Key? key, required this.category})
      : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
    );
  }

  Widget _buildCategoryContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NeuBox(
          width: 50,
          height: 50,
          child: Image(
            image: AssetImage(category.imagePath),
            height: 40,
            width: 40,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          category.title,
          style: AppText.body1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${category.lessonCount} saat"),
            const SizedBox(width: 10),
            Text("${category.rating}"),
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
