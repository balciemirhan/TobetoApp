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
    //print(videoUrlNotifier.value);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.course.videoList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                //print(videoUrlNotifier.value);
                videoUrlNotifier.value = widget.course.videoList[index].link;
                //print(videoUrlNotifier.value);
                setState(() {
                  selectedVideoIndex =
                      index; // Seçili video indeksini güncelleyin
                });
              },
              child: Card(
                elevation: 3,
                color: selectedVideoIndex == index
                    ? const Color.fromARGB(255, 202, 198, 198)
                    : Colors.white, // Seçili öğe mavi olarak belirlenir
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


/* 
GestureDetector öğesi tıklandığında, videoUrlNotifier üzerindeki değeri güncelleyerek seçili video URL'sini değiştiriyoruz. Ardından, CustomVideoPlayer widget'ını bu yeni URL ile oluşturarak videonun oynatılmasını sağlayabilirsiniz. */