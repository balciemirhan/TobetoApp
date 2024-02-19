
import 'package:tobeto_app/models/exam_model.dart';


abstract class ExamState {}

class ExamInitial extends ExamState {}

class ExamLoading extends ExamState {}

class ExamLoaded extends ExamState {
  final List<Exam> exam;

  ExamLoaded({required this.exam});
}

class ExamError extends ExamState {
  final String message;

  ExamError({required this.message});

}
