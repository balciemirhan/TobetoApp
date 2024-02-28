// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tobeto_app/models/course_model.dart';

class CourseListTile extends StatelessWidget {
  const CourseListTile({
    Key? key,
    required this.video,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  final Video video;
  final Icon icon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(video.videoTitle),
      subtitle: Text("${video.duration.inMinutes} dk"),
      trailing: icon,
      iconColor: iconColor,
    );
  }
}
