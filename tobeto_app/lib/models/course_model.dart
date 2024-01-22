// Modellerimi, HomePage üzerinden CategoryItem ile döndürüp ekran'a yansıtıyorum.
// ignore_for_file: public_member_api_docs, sort_constructors_first
// Modellerimi, HomePage üzerinden CategoryItem ile döndürüp ekran'a yansıtıyorum.
class Course {
  String title;
  String lessonCount;
  int money;
  double rating;
  String imagePath;
  double progress;
  int filterNumber;
  String? description;
  String? instructor;

  Course({
    required this.title,
    required this.lessonCount,
    required this.money,
    required this.rating,
    required this.imagePath,
    required this.progress,
    required this.filterNumber,
    this.description,
    this.instructor,
  });
}
