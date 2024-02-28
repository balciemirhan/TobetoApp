import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/image.dart';
import 'package:tobeto_app/data/course_data.dart';
import 'package:tobeto_app/models/course_model.dart';
import 'package:tobeto_app/config/constant/core/widget/lottie_button.dart';
import 'package:tobeto_app/pages/course/video_player.dart';

class CourseImage extends StatefulWidget {
  const CourseImage({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  State<CourseImage> createState() => _CourseImageState();
}

class _CourseImageState extends State<CourseImage> {
  final videoUrlNotifier =
      ValueNotifier<String>(courseList[3].videoList[1].link);
  int selectedVideoIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 10, color: Color.fromARGB(255, 251, 251, 251))
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: ValueListenableBuilder<String>(
            valueListenable: videoUrlNotifier,
            builder: (context, value, child) {
              return CustomVideoPlayer(
                videoUrlNotifier: videoUrlNotifier,
              );
            },
          ),
        ),
        Positioned(
            top: 30,
            left: 10,
            child: IconButton(
                onPressed: () => Navigator.of(context).pushNamed("/viewmore"),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                ))),
        const Positioned(
            bottom: 0,
            left: 30,
            child: LottieButton(
              url: AppImage.lottieSave,
            )),
        const Positioned(
          bottom: 0,
          right: 30,
          child: LottieButton(
            url: AppImage.lottieFavourite,
          ),
        ),
      ],
    );
  }
}
