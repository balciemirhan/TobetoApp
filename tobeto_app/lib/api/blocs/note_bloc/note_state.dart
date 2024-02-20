import 'package:tobeto_app/models/note_model.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteLoaded extends NoteState {
  final List<Note> notes;

  NoteLoaded({required this.notes});
}

class NoteUpdated extends NoteState {}

class NoteError extends NoteState {
  final String message;

  NoteError(this.message);
}

class DeleteNote extends NoteState {}

class NoteAdded extends NoteState {}
