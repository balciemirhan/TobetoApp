import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/application_bloc/application_event.dart';
import 'package:tobeto_app/api/blocs/application_bloc/application_state.dart';
import 'package:tobeto_app/api/repositories/application_repository.dart';
import 'package:tobeto_app/models/application_model.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final ApplicationRepostiory _applicationRepository;

  ApplicationBloc(this._applicationRepository) : super(ApplicationInitial()) {
    on<GetApplication>(_onGetApplication);
  }

  Future<void> _onGetApplication(
      GetApplication event, Emitter<ApplicationState> emit) async {
    emit(ApplicationLoading());

    try {
      final List<Application> applications =
          await _applicationRepository.getApplication();
      emit(ApplicationLoaded(application: applications));
    } catch (e) {
      emit(ApplicationError(message: "Hata!!"));
    }
  }
}
