import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/constant/format/collections.dart';
import 'package:tobeto_app/models/note_model.dart';

class NoteRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CollectionReference notes =
      FirebaseFirestore.instance.collection(Collections.note);
  Future addNote(Note note) async {
    note.userId = _auth.currentUser!.uid;
    return await notes.add(note.toMap());
  }

  Future<List<Note>> getNote(Note note) async {
    note.userId = _auth.currentUser!.uid;
    final QuerySnapshot querySnapshot =
        await notes.where("userId", isEqualTo: note.userId).get();

    return querySnapshot.docs.map((doc) {
      Note note = Note.fromMap(doc.data() as Map<String, dynamic>);
      note.noteId = doc.id;
      return note;
    }).toList();
  }

  Future updateNote(Note note) async {
    note.userId = _auth.currentUser!.uid;
    return await notes.doc(note.noteId).update(note.toMap());
  }

  Future deleteNote(Note note) async {
    note.userId = _auth.currentUser!.uid;
    return await notes.doc(note.noteId).delete();
  }
}
