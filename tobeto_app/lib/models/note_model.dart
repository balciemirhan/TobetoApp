import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String? userId;
  String? noteId;
  String? note;
  Timestamp? timestamp;

  Note({
    this.userId,
    this.note,
    this.timestamp,
    this.noteId,
  });
  factory Note.fromMap(Map<String, dynamic> json) {
    return Note(
      userId: json['userId'] ?? "",
      note: json['note'] ?? "",
      timestamp: json['timestamp'] ?? Timestamp.now(),
      noteId: json['noteId'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'note': note,
      'timestamp': timestamp,
      'noteId': noteId,
    };
  }
}
