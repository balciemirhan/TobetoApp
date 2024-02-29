import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:tobeto_app/api/blocs/catalog_bloc/catalog_event.dart';
import 'package:tobeto_app/api/blocs/catalog_bloc/catalog_state.dart';
import 'package:tobeto_app/models/catalog_course_model.dart';
import 'package:tobeto_app/pages/catalog_course/catalog_course_page.dart';

class CatalogCourseViewPage extends StatelessWidget {
  const CatalogCourseViewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        if (state is CatalogInitial) {
          context.read<CatalogBloc>().add(GetCatalog());
          return const Center(
            child: Text("İstek Atılıyor..."),
          );
        }
        if (state is CatalogLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CatalogLoaded) {
          final List<CatalogCourse> catalogCourse = state.catalog;
          final args = ModalRoute.of(context)!.settings.arguments as String?;

          int? index;
          if (args != null) {
            index =
                catalogCourse.indexWhere((element) => element.title == args);
          }

          //ModalRoute sayfanın özel verilerini almak için kullanılır bunu da settings.arguments ile yapar
          final pageController = PageController(initialPage: index ?? 0);

          return PageView.builder(
            controller: pageController,
            itemCount: catalogCourse.length,
            itemBuilder: (context, index) {
              return CatalogCoursePage(
                catalogCourse: catalogCourse[index],
              );
            },
          );
        }
        if (state is CatalogError) {
          Center(
            child: Text(state.message),
          );
        }
        return Container();
      },
    );
  }
}
