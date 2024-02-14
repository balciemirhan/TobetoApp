import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:tobeto_app/api/blocs/catalog_bloc/catalog_event.dart';
import 'package:tobeto_app/api/blocs/catalog_bloc/catalog_state.dart';
import 'package:tobeto_app/config/constant/core/widget/top_bar_widget_interval.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/pages/catalog/catalog_course_filter.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopBarWidgetInterval(
                iconButton: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/curved");
                    },
                    icon: const Icon(Icons.arrow_back)),
                titleText: AppText.catalog,
                leadingIcon: const Icon(Icons.book_outlined),
              ),

              //  <------- CourseListFilter (Search and Gridview (CourseItemVertical)) ------->

              BlocBuilder<CatalogBloc, CatalogState>(
                builder: (context, state) {
                  if (state is CatalogInitial) {
                    context.read<CatalogBloc>().add(GetCatalog());
                  }
                  if (state is CatalogLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CatalogLoaded) {
                    final catalog = state.catalog;
                    return CatalogCourseFilter(
                      catalog: catalog,
                    );
                  }
                  if (state is CatalogError) {
                    return Center(child: Text(state.message));
                  }

                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
