import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/image.dart';
import 'package:tobeto_app/models/catalog_course_model.dart';
import 'package:tobeto_app/config/constant/core/widget/lottie_button.dart';

class CatalogCourseImage extends StatelessWidget {
  const CatalogCourseImage({Key? key, required this.catalogCourse})
      : super(key: key);

  final CatalogCourse catalogCourse;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black)],
            image: DecorationImage(
                image: AssetImage(catalogCourse.imagePath), fit: BoxFit.cover),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
        Positioned(
            top: 45,
            left: 20,
            child: NeuBox(
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 30,
                  )),
            )),
      ],
    );
  }
}
