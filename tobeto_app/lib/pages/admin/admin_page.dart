import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/format/collections.dart';
import 'package:tobeto_app/data/announcement_data.dart';
import 'package:tobeto_app/data/application.dart';
import 'package:tobeto_app/data/catalog_course_data.dart';
import 'package:tobeto_app/data/classes_data.dart';
import 'package:tobeto_app/data/course_data.dart';
import 'package:tobeto_app/data/exam_model.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final classesCollection = firebaseFirestore.collection(Collections.classes);

    final announcementCollection =
        firebaseFirestore.collection(Collections.announcement);
    final courseCollection = firebaseFirestore.collection(Collections.course);
    final catalogCourseCollection =
        firebaseFirestore.collection(Collections.catalogCourse);
    final examCollection = firebaseFirestore.collection(Collections.exam);
    final applicationCollection =
        firebaseFirestore.collection(Collections.application);

    return Column(
      children: [
        // ------------ Firestore'a  course  veri yükleme ------------

        ElevatedButton.icon(
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

        //------------ Firestore'a  catalog   veri yükleme ------------
        ElevatedButton.icon(
          onPressed: () async {
            bool dataAdded = false;
            if (!dataAdded) {
              for (var catalogCourse in catalogCourseList) {
                await catalogCourseCollection.add(catalogCourse.toMap());
              }
              dataAdded = true;
            }
          },
          icon: const Icon(Icons.upload),
          label: const Text("firestore veri yükle..."),
        ),

        // ------------ Firestore'a  classes   veri yükleme ------------

        ElevatedButton.icon(
          onPressed: () async {
            bool dataAdded = false;
            if (!dataAdded) {
              for (var classes in classesList) {
                await classesCollection.add(classes.toMap());
              }
              dataAdded = true;
            }
          },
          icon: const Icon(Icons.upload),
          label: const Text("firestore veri yükle..."),
        ),

        //--------------------------*****EXAM VERİSİ YÜKLEME
        ElevatedButton.icon(
          onPressed: () async {
            bool dataAdded = false;
            if (!dataAdded) {
              for (var exam in examList) {
                await examCollection.add(exam.toMap());
              }
              dataAdded = true;
            }
          },
          icon: const Icon(Icons.upload),
          label: const Text("firestore veri yükle..."),
        ),

        ElevatedButton.icon(
          onPressed: () async {
            bool dataAdded = false;
            if (!dataAdded) {
              for (var application in applicationList) {
                await applicationCollection.add(application.toMap());
              }
              dataAdded = true;
            }
          },
          icon: const Icon(Icons.upload),
          label: const Text("firestore veri yükle..."),
        ),

        // ------------ Firestore'a  announcement   veri yükleme ------------

        ElevatedButton.icon(
          onPressed: () async {
            bool dataAdded = false;
            if (!dataAdded) {
              for (var announcement in announcementList) {
                await announcementCollection.add(announcement.toMap());
              }
              dataAdded = true;
            }
          },
          icon: const Icon(Icons.upload),
          label: const Text("firestore veri yükle..."),
        ),
      ],
    );
  }
}
