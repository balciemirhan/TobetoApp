import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_app/config/constant/format/collections.dart';
import 'package:tobeto_app/models/exam_model.dart';

class ExamRepostiory {
  Future<List<Exam>> getExam() async {
    CollectionReference examRef =
        FirebaseFirestore.instance.collection(Collections.exam);
    QuerySnapshot snapshot = await examRef.get();
    return snapshot.docs
        .map((doc) => Exam.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
