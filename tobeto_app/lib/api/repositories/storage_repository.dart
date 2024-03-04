import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tobeto_app/constant/format/collections.dart';
import 'package:tobeto_app/models/user_model.dart';

class StorageRepository {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future uploadPhoto(File photoUrl) async {
    User? loggedInUser = _auth.currentUser!;

    final reference =
        _firebaseStorage.ref().child('profileImages/${loggedInUser.uid}.png');

    await reference.putFile(photoUrl);

    final downloadUrl = await reference.getDownloadURL();
    await _firestore
        .collection(Collections.users)
        .doc(loggedInUser.uid)
        .update({
      'profilePhoto': downloadUrl,
      "userId": loggedInUser.uid,
    });
  }

  Future<void> updateUserCertificate(UserModel userModel, File? file) async {
    final user =
        _firestore.collection(Collections.users).doc(_auth.currentUser!.uid);
    if (file != null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child("files")
          .child(file.path.substring(53));
      await ref.putFile(file);
      final url = await ref.getDownloadURL();
      user.update({"certicafes": url});
    }
  }
}
