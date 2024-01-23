import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/models/course_model.dart';

class BookMarkList extends StatelessWidget {
  const BookMarkList({Key? key, required this.course}) : super(key: key);

  // Category modellerimi çağırıyorum'ki kullanabileyim.
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: NeuBox(
        width: 200,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            elevation: 20,
            /*    color: Colors.grey[300], */
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            //clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 20),
                      child: NeuBox(
                        height: 80,
                        width: 80,
                        child: Image(
                          image: AssetImage(course.imagePath),
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              course.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          /*   Text(course.instructor ?? ""), */
                          /*   Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(course.description ?? ""),
                          ), */
                          /*   Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 1),
                                child: Text("${course.lessonCount} saat"),
                              ),
                              const SizedBox(width: 10),
                              Text("${course.rating}"),
                              const Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.deepPurple,
                              )
                            ],
                          ), */
                          /*    const Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: 10),
                              ],
                            ),
                          ) */
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
