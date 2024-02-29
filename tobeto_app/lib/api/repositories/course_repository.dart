import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_app/constant/format/collections.dart';
import 'package:tobeto_app/models/course_model.dart';

class CourseRepository {
  // firestoredan veri çekmek get / fetch
  Future<List<Course>> getCourse() async {
    // Kurslar koleksiyonuna bir referans alın
    CollectionReference courseRef =
        FirebaseFirestore.instance.collection(Collections.course);
    //Map<String,dynamic> = Course
    // Anlık görüntüyü Course nesnesine  listesine dönüştür: (from Map)
    QuerySnapshot snapshot = await courseRef.get();

    return snapshot.docs
        .map((doc) => Course.fromMap(doc.data() as Map<String, dynamic>))
        .toList();

    //
  }
}

 /*   Future<List<Course>> fetchCourses() async {
    List<Course> courses = [];

    // Get a reference to the courses collection
    CollectionReference coursesRef =
        FirebaseFirestore.instance.collection('courses');

    // Get a snapshot of the collection
    QuerySnapshot snapshot = await coursesRef.get();

    // Convert the snapshot into a list of Course objects
    // Anlık görüntüyü Course nesnelerinin listesine dönüştürme
    for (DocumentSnapshot doc in snapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      courses.add(Course.fromMap(data));
      print("${courses} + asdasdasdnasoıdx");
    }
    return courses;
  } 
 */