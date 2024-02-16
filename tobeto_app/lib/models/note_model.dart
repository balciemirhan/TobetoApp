import 'package:cloud_firestore/cloud_firestore.dart';

// Kullanıcıya özel notlar oluşturmak için userId alanını kullanıyoruz.
class Note {
  String? userId; // userId = auth_current!.uid;
  String? noteId; // = document (doc.id) = noteId; güncelleme ve silme
  String? note;
  Timestamp? timestamp;

  Note({
    this.userId,
    this.note,
    this.timestamp,
    this.noteId,
  });

// haritalanmış(map) lenmiş verileri çekerken de Note sınıfına çeviriyor.Bu sayede verilerimizi kullanabiliyoruz.
  factory Note.fromMap(Map<String, dynamic> json) {
    return Note(
      userId: json['userId'] ?? "",
      note: json['note'] ?? "",
      timestamp: json['timestamp'] ?? Timestamp.now(),
      noteId: json['noteId'] ?? "",
    );
  }
  //verileri haritalandır ve firestore aktar.
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'note': note,
      'timestamp': timestamp,
      'noteId': noteId,
    };
  }
}
