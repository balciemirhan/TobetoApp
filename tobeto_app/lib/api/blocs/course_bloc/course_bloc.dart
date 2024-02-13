import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/course_bloc/course_event.dart';
import 'package:tobeto_app/api/blocs/course_bloc/course_state.dart';
import 'package:tobeto_app/api/repositories/course_repository.dart';
import 'package:tobeto_app/models/course_model.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository _courseRepository;
  CourseBloc(this._courseRepository) : super(CourseInitial()) {
    // Initial === if(state is CourseInitial)
                    //{context.read<CourseBloc>.add(GetCourse)   }
                    
                    // istek atılıyor...
    on<GetCourse>(_onGetCourse);
  }

  Future<void> _onGetCourse(GetCourse event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    try {
      final List<Course> course =
          await _courseRepository.getCourse(); // verilerimi getir
      // getirilen verilerimi de yayınla
      emit(CourseLoaded(course: course));
    } catch (e) {
      emit(CourseError(message: "Hata!!!"));
    }
  }
}
