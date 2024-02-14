import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/catalog_bloc/catalog_event.dart';
import 'package:tobeto_app/api/blocs/catalog_bloc/catalog_state.dart';
import 'package:tobeto_app/api/repositories/catalog_repository.dart';
import 'package:tobeto_app/models/catalog_course_model.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final CatalogRepository _catalogRepository;
  CatalogBloc(this._catalogRepository) : super(CatalogInitial()) {
    on<GetCatalog>(_onGetCatalog);
  }
  Future<void> _onGetCatalog(
      GetCatalog event, Emitter<CatalogState> emit) async {
    emit(CatalogLoading());
    try {
      final List<CatalogCourse> catalogCourse =
          await _catalogRepository.getCatalog();
      emit(CatalogLoaded(catalog: catalogCourse));
    } catch (e) {
      emit(CatalogError(message: "Hata!!!"));
    }
  }
}
