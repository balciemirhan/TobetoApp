import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/announcement_bloc/announcement_event.dart';
import 'package:tobeto_app/api/blocs/announcement_bloc/announcement_state.dart';
import 'package:tobeto_app/api/repositories/announcement_repository.dart';
import 'package:tobeto_app/models/announcement_model.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  final AnnouncementRepository _announcementRepository;
  AnnouncementBloc(this._announcementRepository)
      : super(AnnouncementInitial()) {
    // Initial === if(state is CourseInitial)
    //{context.read<CourseBloc>.add(GetCourse)   }

    // istek atılıyor...
    on<GetAnnouncement>(_onGetAnnouncement);
  }

  Future<void> _onGetAnnouncement(
      GetAnnouncement event, Emitter<AnnouncementState> emit) async {
    emit(AnnouncementLoading());
    try {
      final List<AnnouncementModel> announcement =
          await _announcementRepository.getAnnouncement(); // verilerimi getir
      // getirilen verilerimi de yayınla
      emit(AnnouncementLoaded(announcement: announcement));
    } catch (e) {
      emit(AnnouncementError(message: "Hata!!!"));
    }
  }
}
