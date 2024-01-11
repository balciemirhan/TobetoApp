import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:tobeto_app/components/drawer/my_advanced_drawer.dart';
import 'package:tobeto_app/components/drawer/my_appbar.dart';
import 'package:tobeto_app/components/drawer/my_drawer.dart';
import 'package:tobeto_app/pages/home_screens/popular_widget.dart';
import 'package:tobeto_app/data/course_data.dart';
import 'package:tobeto_app/models/course_model.dart';
import 'package:tobeto_app/pages/home_screens/course_item.dart';
import 'package:tobeto_app/pages/home_screens/profile.dart';
import 'package:tobeto_app/pages/home_screens/course_widget.dart';
import 'package:tobeto_app/pages/home_screens/bill_board.dart';
import 'package:tobeto_app/pages/home_screens/last_course_video.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceH = mediaQueryData.size.height;
    /* final double deviceW = mediaQueryData.size.width; */

    final drawerController = AdvancedDrawerController();
    return MyAdvancedDrawer(
        drawer: const MyDrawer(),
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
                  const Profile(),

                  // ------------ Reklam Panosu ------------

                  const Padding(
                    padding: EdgeInsets.all(35),
                    child: BillBoard(),
                  ),

                  // ------------ Kategoriler / Tümünü Gör ------------

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    child: CourseWidget(),
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
                          return CourseItem(course: courseList[index]);
                        },
                      ),
                    ),
                  ),
                  /* const Padding(padding: EdgeInsets.only(top: 20)), 

                  // ------------ Popüler Kurslar ------------
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    child: PopularWidget(),
                  ),

                  // ------------ En son izlediğiniz ders ------------
                  const Padding(
                    padding: EdgeInsets.all(35),
                    child: LastCourseVideo(),
                  )
*/
                  //   bottomNavigationBari yani alt butonların yönetimi -->
                  //CurvedNavBarWidget() ' da yönetiliyor.
                ],
              ),
            ),
          ),
        ));
  }
}
