import 'package:flutter/material.dart';
import 'package:tobeto_app/models/course_model.dart';
import 'package:tobeto_app/pages/course/course_video_tile.dart';

class CourseVideos extends StatefulWidget {
  const CourseVideos({Key? key, required this.course}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CourseVideosState();
  final Course course;
}

class _CourseVideosState extends State<CourseVideos> {
  int selectedVideoIndex = 0;

  late final ValueNotifier<String> videoUrlNotifier;

  @override
  void initState() {
    videoUrlNotifier = ValueNotifier<String>(widget.course.videoList[0].link);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.course.videoList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                videoUrlNotifier.value = widget.course.videoList[index].link;
                setState(() {
                  selectedVideoIndex = index;
                });
              },
              child: Card(
                elevation: 3,
                color: selectedVideoIndex == index
                    ? const Color.fromARGB(255, 202, 198, 198)
                    : Colors.white,
                child: CourseListTile(
                  video: widget.course.videoList[index],
                  icon: const Icon(Icons.play_arrow),
                  iconColor: Colors.black45,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
