


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/exam_bloc/exam_evet.dart';
import 'package:tobeto_app/api/blocs/exam_bloc/exam_state.dart';
import 'package:tobeto_app/api/repositories/exam_repostoriy.dart';
import 'package:tobeto_app/models/exam_model.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  final ExamRepostiory _examRepostiory;

  ExamBloc(this._examRepostiory) : super(ExamInitial()) {
    on<GetExam>(_onGetExam);
  }

  Future<void> _onGetExam(
      GetExam event, Emitter<ExamState> emit) async {
    emit(ExamLoading());

    try {
      final List<Exam> exam =
          await _examRepostiory.getExam(); 
      emit(ExamLoaded(exam: exam));
    } catch (e) {
      emit(ExamError(message: "Hata!!!"));
    }
  }
}