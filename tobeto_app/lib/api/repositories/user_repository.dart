// Burası kullanıcının datası eklendi mi? silindi mi? güncellendi mi? => firebasestore
// profile bilgilerini:::

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/config/constant/format/collections.dart';
import 'package:tobeto_app/models/user_model.dart';

// CRUD operations:

// CREATE ekleme add
// READ --> firestore da veri getirme get() / snapshot()
// UPDATE
// DELETE

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance; //=> id almak için
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ------------------------------- CREATE / ADD  -------------------------------

  Future<void> addUser(UserModel userModel) async {
    final CollectionReference users = _firestore.collection(Collections.users);

    userModel.userId = _auth.currentUser!.uid;

    await users.doc(userModel.userId).set(userModel.toMap());
    // await users.add(userModel.toMap());
  }

  // ------------------------------- READ -------------------------------

  Future getUser(UserModel userModel) async {
    /*    1. koleksiyonu Belirle
      2. id yi belirle,
      3.  verileri getir get() */

    final CollectionReference users = _firestore.collection(Collections.users);
    userModel.userId = _auth.currentUser!.uid;

    // spesifik veriler için (photo,name)
    // final email = await documentSnapshot.get("profilePhoto");

    // Tüm verileri okuyorum.
    final documentSnapshot = await users.doc(userModel.userId).get();

    // veri var mı? null kontrolü:
    if (documentSnapshot.exists) {
      return UserModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception("Hata!!!");
    }
  }

  // ------------------------------- UPDATE -------------------------------

  Future<void> updateUser(UserModel userModel) async {
    final CollectionReference users = _firestore.collection(Collections.users);
    userModel.userId = _auth.currentUser!.uid;
    await users.doc(userModel.userId).update(userModel.toMap());
  }

  // ------------------------------- DELETE -------------------------------
  Future<void> deleteUser(UserModel userModel) async {
    final CollectionReference users = _firestore.collection(Collections.users);
    userModel.userId = _auth.currentUser!.uid;
    await users.doc(userModel.userId).delete();
  }
}
