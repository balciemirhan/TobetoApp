import 'package:tobeto_app/models/catalog_course_model.dart';

abstract class CatalogState {}

class CatalogInitial extends CatalogState {}

class CatalogLoading extends CatalogState {}

class CatalogLoaded extends CatalogState {
  final List<CatalogCourse> catalog;

  CatalogLoaded({required this.catalog});
}

class CatalogError extends CatalogState {
  final String message;

  CatalogError({required this.message});

}
