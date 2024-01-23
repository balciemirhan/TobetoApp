import 'package:tobeto_app/models/course_model.dart';

class BookMarkAdd {
  static List<Course> bookMark = [];

  static void addToBookMark(Course course) {
    if (!bookMark.contains(course)) {
      bookMark.add(course);
    }
  }
}
