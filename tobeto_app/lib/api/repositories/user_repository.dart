import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/constant/format/collections.dart';
import 'package:tobeto_app/models/user_model.dart';

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(UserModel userModel) async {
    final CollectionReference users = _firestore.collection(Collections.users);

    userModel.userId = _auth.currentUser!.uid;

    await users.doc(userModel.userId).set(userModel.toMap());
  }

  Future getUser(UserModel userModel) async {
    final CollectionReference users = _firestore.collection(Collections.users);
    userModel.userId = _auth.currentUser!.uid;
    final documentSnapshot = await users.doc(userModel.userId).get();
    if (documentSnapshot.exists) {
      return UserModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception("Hata!!!");
    }
  }

  Future<void> updateUser(UserModel userModel) async {
    final CollectionReference users = _firestore.collection(Collections.users);
    userModel.userId = _auth.currentUser!.uid;
    await users.doc(userModel.userId).update(userModel.toMap());
  }

  Future<void> deleteUser(UserModel userModel) async {
    final CollectionReference users = _firestore.collection(Collections.users);
    userModel.userId = _auth.currentUser!.uid;
    await users.doc(userModel.userId).delete();
  }
}
