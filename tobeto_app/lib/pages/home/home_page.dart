import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:tobeto_app/config/constant/core/widget/drawer/my_advanced_drawer.dart';
import 'package:tobeto_app/config/constant/core/widget/drawer/my_appbar.dart';
import 'package:tobeto_app/config/constant/core/widget/drawer/my_drawer.dart';
import 'package:tobeto_app/data/course_data.dart';
import 'package:tobeto_app/pages/home/course_cards.dart';
import 'package:tobeto_app/pages/home/home_header.dart';
import 'package:tobeto_app/pages/home/course_cards_title.dart';
import 'package:tobeto_app/pages/home/bill_board.dart';
import 'package:tobeto_app/pages/home/last_course_video.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceH = mediaQueryData.size.height;
    /*  final courseCollection = _firebaseFirestore.collection(Collections.course);
    final catalogCourseCollection =
        _firebaseFirestore.collection(Collections.catalogCourse); */
    /* final double deviceW = mediaQueryData.size.width; */

    final drawerController = AdvancedDrawerController();
    return MyAdvancedDrawer(
        drawer: MyDrawer(),
        controller: drawerController,
        child: Scaffold(
          extendBody: true, // button
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TopBar(drawerController: drawerController),

                  // ------------ Hoş Geldin Kullanıcı ------------
                  const HomeHeader(),

                  // ------------ Reklam Panosu ------------

                  const Padding(
                    padding: EdgeInsets.all(35),
                    child: BillBoard(),
                  ),

                  // ------------ Firestore'a  course  veri yükleme ------------

                  /*   ElevatedButton.icon(
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
                  ), */

                  // ------------ Firestore'a  catalog   veri yükleme ------------
                  /* ElevatedButton.icon(
                    onPressed: () async {
                      bool dataAdded = false;
                      if (!dataAdded) {
                        for (var catalogCourse in catalogCourseList) {
                          await catalogCourseCollection
                              .add(catalogCourse.toMap());
                        }
                        dataAdded = true;
                      }
                    },
                    icon: const Icon(Icons.upload),
                    label: const Text("firestore veri yükle..."),
                  ), */

                  // ------------ Kategoriler / Tümünü Gör ------------

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    child: CourseCardsTitle(),
                  ),

                  // ------------ Dinamik Card Tasarımı / Flutter - Java - Dart vs. ------------

                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: SizedBox(
                      height: deviceH / 5,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return CourseCards(course: courseList[index]);
                        },
                      ),
                    ),
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
