//  import 'package:flutter/material.dart';

// import 'package:tobeto_app/data/course_data.dart';
// import 'package:tobeto_app/models/course_model.dart';

// import 'package:tobeto_app/pages/course/video_player.dart';

// class CourseImage extends StatefulWidget {
//   const CourseImage({Key? key, required this.course}) : super(key: key);

//   final Course course;

//   @override
//   State<CourseImage> createState() => _CourseImageState();
// }

// class _CourseImageState extends State<CourseImage> {
 
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ValueListenableBuilder<String>(
          
//           valueListenable: videoUrlNotifier,
//           builder: (context, value, child) {
//             return CustomVideoPlayer(
//               videoUrlNotifier: videoUrlNotifier,
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
 