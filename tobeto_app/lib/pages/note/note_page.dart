import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/note_model/note_bloc.dart';
import 'package:tobeto_app/api/blocs/note_model/note_event.dart';
import 'package:tobeto_app/api/blocs/note_model/note_state.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/models/note_model.dart';

class NotePage extends StatelessWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController noteController = TextEditingController();
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Notlarım",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          if (state is NoteInitial || state is NoteUpdated) {
            context.read<NoteBloc>().add(NoteGet());
            return const Center(
              child: Text(" İstek atılıyor..."),
            );
          }
          if (state is NoteLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NoteLoaded) {
            return SizedBox(
              height: double.infinity,
              child: ListView.builder(
                itemCount: state.notes.length,
                itemBuilder: (context, index) {
                  final note = state.notes[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[350],
                    ),
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(15),
                    child: ListTile(
                      title: Text(note.note!),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Container(
                                    height: 300,
                                    width: 300,
                                    child: TextField(
                                      keyboardType: TextInputType.multiline,
                                      maxLength: 250,
                                      controller: noteController,
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          context
                                              .read<NoteBloc>()
                                              .add(NoteUpdate(
                                                  note: Note(
                                                userId: auth.currentUser!.uid,
                                                noteId: note
                                                    .noteId, // güncelleme işlemi
                                                note: noteController.text,
                                              )));
                                          noteController.clear();
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Güncelle"))
                                  ],
                                ),
                              );
                            },
                          ),
                          IconButton(
                            onPressed: () {
                              context.read<NoteBloc>().add(
                                    NoteDelete(
                                      note: Note(noteId: note.noteId),
                                    ),
                                  );
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    scrollable: true,
                    content: Container(
                      height: 300,
                      width: 300,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        maxLength: 250,
                        minLines: 1,
                        controller: noteController,
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<NoteBloc>().add(NoteAdd(
                              note: Note(
                                  userId: auth.currentUser!.uid,
                                  note: noteController.text,
                                  timestamp: Timestamp.now())));
                          noteController.clear();
                          Navigator.pop(context);
                        },
                        child: const Text("Ekle"),
                      )
                    ],
                  ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
