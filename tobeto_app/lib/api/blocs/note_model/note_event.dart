import 'package:tobeto_app/models/note_model.dart';

abstract class NoteEvent {}

class NoteAdd extends NoteEvent {
  final Note note;

  NoteAdd({required this.note});
}

class NoteGet extends NoteEvent {}

class NoteUpdate extends NoteEvent {
  final Note note;

  NoteUpdate({required this.note});
}

class NoteDelete extends NoteEvent {
  final Note note;

  NoteDelete({required this.note});
}

class ClearNote extends NoteEvent {}
