import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_app/config/constant/format/collections.dart';
import 'package:tobeto_app/models/application_model.dart';


class ApplicationRepostiory {
  Future<List<Application>> getApplication() async {
    CollectionReference applicationRef =
        FirebaseFirestore.instance.collection(Collections.application);
    QuerySnapshot snapshot = await applicationRef.get();
    return snapshot.docs
        .map((doc) => Application.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
