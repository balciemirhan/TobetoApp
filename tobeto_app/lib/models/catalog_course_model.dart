class CatalogCourse {
  String title;
  String lessonCount;
  double rating;
  String imagePath;
  double progress;
  int filterNumber;
  String? description;
  String instructor;

  CatalogCourse({
    required this.title,
    required this.lessonCount,
    required this.rating,
    required this.imagePath,
    required this.progress,
    required this.filterNumber,
    this.description,
    required this.instructor,
  });
}
