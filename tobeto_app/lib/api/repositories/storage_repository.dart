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

  //  ---------------- Photo Seçtirme islemi ----------------

  Future uploadPhoto(File photoUrl) async {
// Upload işlemini gerçekleştirirken kullanıcı'nın bilgisini'de alalım.

    User? loggedInUser = _auth.currentUser!;

// Fotoğrafı göndermeden önce referens verilmesi gerek:
    final reference =
        _firebaseStorage.ref().child('profileImages/${loggedInUser.uid}.png');

// .putFile(resmi yükleme işlemi)
// Resmi yükleme işlemi: ---> kullanıcıdan aldığımız image

    await reference.putFile(photoUrl);
// Yükleme işlemi tamamlandıktan sonra, alt dizindeki dosyanın indirme URL'sini alabilirsiniz:
// İndirme Url'ni  Firestore'a kaydetmek için alıyorum.

    final downloadUrl = await reference.getDownloadURL();
// users --> koleksiyonuna ekleyebilirsin.
    await _firestore
        .collection(Collections.users)
        .doc(loggedInUser.uid)
        .update({
      'profilePhoto': downloadUrl,
      "userId": loggedInUser.uid,
    });
  }

  //   ---------------- Dosya Seçtirme islemi ----------------

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
    } /* else { 
      user.update(
          UserModel(certificates: [...userModel.certificates!]).toMap());
    } */
  }
}
