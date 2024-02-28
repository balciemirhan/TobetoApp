import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/course_bloc/course_bloc.dart';
import 'package:tobeto_app/api/blocs/course_bloc/course_event.dart';
import 'package:tobeto_app/api/blocs/course_bloc/course_state.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/config/constant/core/widget/background_image.dart';
import 'package:tobeto_app/config/constant/core/widget/drawer/my_advanced_drawer.dart';
import 'package:tobeto_app/config/constant/core/widget/drawer/my_appbar.dart';
import 'package:tobeto_app/config/constant/core/widget/drawer/my_drawer.dart';
import 'package:tobeto_app/config/constant/format/collections.dart';
import 'package:tobeto_app/data/course_data.dart';
import 'package:tobeto_app/models/course_model.dart';
import 'package:tobeto_app/pages/home/course_cards.dart';
import 'package:tobeto_app/pages/home/home_header.dart';
import 'package:tobeto_app/pages/home/course_cards_title.dart';
import 'package:tobeto_app/pages/home/bill_board.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceH = mediaQueryData.size.height;
    // final double deviceW = mediaQueryData.size.width;
    final courseCollection = _firebaseFirestore.collection(Collections.course);
    final drawerController = AdvancedDrawerController();
    return MyAdvancedDrawer(
        drawer: MyDrawer(),
        controller: drawerController,
        child: BackgroundImage(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBody: true, // button
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TopBar(drawerController: drawerController),

                  // ------------ Hoş Geldin Kullanıcı ------------

                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is ProfileInitial || state is ProfileUpdated) {
                        context.read<ProfileBloc>().add(GetProfil());
                      }

                      if (state is ProfileLoaded) {
                        return HomeHeader(user: state.user);
                      }
                      return Container();
                    },
                  ),

                  // ------------ Reklam Panosu ------------

                  const Padding(
                    padding: EdgeInsets.all(35),
                    child: BillBoard(),
                  ),
                  /*     ElevatedButton.icon(
                    onPressed: () async {
                      bool dataAdded = false;
                      if (!dataAdded) {
                        for (var course in courseList) {
                          await courseCollection.add(course.toMap());
                        }
                        dataAdded = true;
                      }
                    },
                    icon: const Icon(Icons.upload),
                    label: const Text("firestore veri yükle..."),
                  ),
 */
                  // ------------ Kategoriler / Tümünü Gör ------------

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    child: CourseCardsTitle(),
                  ),

                  // ------------ Dinamik Card Tasarımı / Flutter - Java - Dart vs. ------------

                  BlocBuilder<CourseBloc, CourseState>(
                    builder: (context, state) {
                      if (state is CourseInitial) {
                        context.read<CourseBloc>().add(GetCourse());
                      }
                      if (state is CourseLoaded) {
                        final List<Course> course = state.course;
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: SizedBox(
                            height: deviceH / 6,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(11),
                                  child: CourseCards(course: course[index]),
                                );
                              },
                            ),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),

                  const Padding(padding: EdgeInsets.only(top: 20)),

                  // ------------ Popüler Kurslar ------------
                  /*   const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    child: PopularWidget(),
                  ), */

                  // ------------ En son izlediğiniz ders ------------
                  /*   const Padding(
                    padding: EdgeInsets.all(35),
                    child: LastCourseVideo(),
                  ) */

                  //   bottomNavigationBari yani alt butonların yönetimi -->
                  //CurvedNavBarWidget() ' da yönetiliyor.
                ],
              ),
            ),
          ),
        ));
  }
}
