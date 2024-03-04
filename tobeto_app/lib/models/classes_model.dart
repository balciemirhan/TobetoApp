import 'package:flutter/material.dart';

class Classes {
  String title;
  num classId;
  String instructor;
  DateTime time;
  Color color;

  Classes({
    required this.title,
    required this.classId,
    required this.instructor,
    required this.time,
    required this.color,
  });
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'filterNumber': classId,
      'instructor': instructor,
      'time': time.toIso8601String(),
      'color': color.value,
    };
  }

  factory Classes.fromMap(Map<String, dynamic> map) {
    return Classes(
      title: map['title'] ?? '',
      classId: map['filterNumber'] ?? 0,
      instructor: map['instructor'] ?? '',
      time: DateTime.tryParse(map['time']) ?? DateTime.now(),
      color: Color(map['color'] ?? 0xFF000000),
    );
  }
}
