class CatalogCourse {
  String title;
  String lessonCount;
  int money;
  num rating;
  String imagePath;
  num progress;
  int filterNumber;
  String? description;
  String instructor;
  String? videoLink;

  CatalogCourse({
    required this.title,
    required this.lessonCount,
    required this.money,
    required this.rating,
    required this.imagePath,
    required this.progress,
    required this.filterNumber,
    this.description,
    required this.instructor,
    this.videoLink,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'lessonCount': lessonCount,
      'money': money,
      'rating': rating,
      'imagePath': imagePath,
      'progress': progress,
      'filterNumber': filterNumber,
      'description': description,
      'instructor': instructor,
      'video': videoLink,
    };
  }

  factory CatalogCourse.fromMap(Map<String, dynamic> map) {
    return CatalogCourse(
      title: map['title'] ?? '',
      lessonCount: map['lessonCount'] ?? '',
      money: map['money'] ?? '',
      rating: map['rating'] ?? '',
      imagePath: map['imagePath'] ?? '',
      progress: map['progress'] ?? '',
      filterNumber: map['filterNumber'] ?? '',
      description: map['description'] ?? '',
      instructor: map['instructor'] ?? '',
      videoLink: map["video"] ?? '',
    );
  }
}
