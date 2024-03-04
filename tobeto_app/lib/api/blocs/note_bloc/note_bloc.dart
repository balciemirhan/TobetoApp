import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/note_bloc/note_event.dart';
import 'package:tobeto_app/api/blocs/note_bloc/note_state.dart';
import 'package:tobeto_app/api/repositories/note_repository.dart';
import 'package:tobeto_app/models/note_model.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteRepository _noteRepository;
  NoteBloc(this._noteRepository) : super(NoteInitial()) {
    on<NoteAdd>(_onAddNote);
    on<NoteGet>(_onGetNote);
    on<NoteUpdate>(_onUpdateNote);
    on<NoteDelete>(_onDeleteNote);
    on<ClearNote>(_onClearNote);
  }

  Future<void> _onAddNote(NoteAdd event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    try {
      await _noteRepository.addNote(event.note);
      emit(NoteInitial());
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }

  Future<void> _onGetNote(NoteGet event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    try {
      final List<Note> notes = await _noteRepository.getNote(Note());
      emit(NoteLoaded(notes: notes));
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }

  Future<void> _onUpdateNote(NoteUpdate event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    try {
      await _noteRepository.updateNote(event.note);
      emit(NoteUpdated());
    } catch (e) {
      emit(NoteError("${e.toString()} Güncelleme Hatası!!!"));
    }
  }

  Future<void> _onDeleteNote(NoteDelete event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    try {
      await _noteRepository.deleteNote(event.note);
      emit(NoteUpdated());
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }

  void _onClearNote(ClearNote event, Emitter<NoteState> emit) {
    emit(NoteInitial());
  }
}
