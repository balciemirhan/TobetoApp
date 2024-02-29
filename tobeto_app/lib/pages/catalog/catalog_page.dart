import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:tobeto_app/api/blocs/catalog_bloc/catalog_event.dart';
import 'package:tobeto_app/api/blocs/catalog_bloc/catalog_state.dart';
import 'package:tobeto_app/core/widget/background_image.dart';
import 'package:tobeto_app/core/drawer/my_advanced_drawer.dart';
import 'package:tobeto_app/core/drawer/my_appbar.dart';
import 'package:tobeto_app/core/drawer/my_drawer.dart';
import 'package:tobeto_app/constant/theme/image.dart';
import 'package:tobeto_app/pages/catalog/catalog_course_filter.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerController = AdvancedDrawerController();

    return MyAdvancedDrawer(
      drawer: MyDrawer(),
      controller: drawerController,
      child: BackgroundImage(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DrawerTopBar(
                    drawerController: drawerController,
                    title: "Katalog",
                    image: AppImage.tobetoLogo),

                //  <------- CourseListFilter (Search and Gridview (CourseItemVertical)) ------->

                BlocBuilder<CatalogBloc, CatalogState>(
                  builder: (context, state) {
                    if (state is CatalogInitial) {
                      context.read<CatalogBloc>().add(GetCatalog());
                    }
                    if (state is CatalogLoading) {
                      return const Center(
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
      ),
    );
  }
}
