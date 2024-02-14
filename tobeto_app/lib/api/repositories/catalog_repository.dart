import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:tobeto_app/config/constant/format/collections.dart';
import 'package:tobeto_app/models/catalog_course_model.dart';

class CatalogRepository {
  Future<List<CatalogCourse>> getCatalog() async {
    CollectionReference catalogRef =
        FirebaseFirestore.instance.collection(Collections.catalogCourse);
    QuerySnapshot snapshot = await catalogRef.get();

    return snapshot.docs
        .map((doc) => CatalogCourse.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
