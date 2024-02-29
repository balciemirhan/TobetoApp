import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_app/constant/format/collections.dart';
import 'package:tobeto_app/models/announcement_model.dart';

class AnnouncementRepository {
  Future<List<AnnouncementModel>> getAnnouncement() async {
    CollectionReference announcementRef =
        FirebaseFirestore.instance.collection(Collections.announcement);
    QuerySnapshot snapshot = await announcementRef.get();

    return snapshot.docs
        .map((doc) =>
            AnnouncementModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
