import 'package:cloud_firestore/cloud_firestore.dart';

class AnnouncementModel {
  String title;
  String text;
  DateTime? dateTime;

  AnnouncementModel({
    required this.title,
    required this.text,
    this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'text': text,
      'dateTime': dateTime ?? DateTime.now(),
    };
  }

  factory AnnouncementModel.fromMap(Map<String, dynamic> map) {
    return AnnouncementModel(
      title: map['title'] ?? '',
      text: map['text'] ?? '',
      dateTime: (map['dateTime'] as Timestamp?)?.toDate(),
    );
  }
}
