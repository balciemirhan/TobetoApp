// Modellerimi, HomePage üzerinden CategoryItem ile döndürüp ekran'a yansıtıyorum.
class Course {
  String title;
  String lessonCount;
  int money;
  double rating;
  String imagePath;
  double progress;

  Course({
    required this.title,
    required this.lessonCount,
    required this.money,
    required this.rating,
    required this.imagePath,
    required this.progress,
  });
}
