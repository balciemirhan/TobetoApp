import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/config/constant/format/collections.dart';
import 'package:tobeto_app/models/note_model.dart';

class NoteRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CollectionReference notes =
      FirebaseFirestore.instance.collection(Collections.note);

  // CRUD OPERATIONS:

  // --------------------------- CREATE ---------------------------

  Future addNote(Note note) async {
    note.userId = _auth.currentUser!.uid;
    return await notes.add(note.toMap());
  }

  // --------------------------- READ ---------------------------

  Future<List<Note>> getNote(Note note) async {
    note.userId = _auth.currentUser!.uid;

    // userId = noteId (Where)
    // kullanıcmın id si, where(userId = note.userId) not id sine eşit olanları getir.

    final QuerySnapshot querySnapshot =
        await notes.where("userId", isEqualTo: note.userId).get();

    // update ve delete işlemleri noteId yi al... böylece güncelleme ve silme işlemlerini

    return querySnapshot.docs.map((doc) {
      Note note = Note.fromMap(doc.data() as Map<String, dynamic>);
      note.noteId = doc.id; // firestoredak i  document ayarladık..
      return note;
    }).toList();
  }

  // --------------------------- UPDATE ---------------------------

  // Aldığım doc.id =  note.noteId ' yi burada kullanacağım. (Güncelleme)

  Future updateNote(Note note) async {
    note.userId = _auth.currentUser!.uid;
    return await notes.doc(note.noteId).update(note.toMap());
  }

  // --------------------------- DELETE ---------------------------

  Future deleteNote(Note note) async {
    note.userId = _auth.currentUser!.uid;
    return await notes.doc(note.noteId).delete();
  }
}

/* Bu değişikliklerle artık notun documentId'sini alabilir ve updateNote() ve deleteNote() yöntemlerinde kullanabilirsiniz. */