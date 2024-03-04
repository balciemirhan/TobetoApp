import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_app/constant/format/collections.dart';
import 'package:tobeto_app/models/course_model.dart';

class CourseRepository {
  Future<List<Course>> getCourse() async {
    CollectionReference courseRef =
        FirebaseFirestore.instance.collection(Collections.course);

    QuerySnapshot snapshot = await courseRef.get();

    return snapshot.docs
        .map((doc) => Course.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
