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

  // verileri gönder.

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'text': text,
      'dateTime': dateTime,
    };
  }

  // verileri al.

  factory AnnouncementModel.fromMap(Map<String, dynamic> map) {
    return AnnouncementModel(
      title: map['title'] ?? '',
      text: map['text'] ?? '',
      dateTime: (map['dateTime'] as Timestamp?)?.toDate(),
    );
  }
}
