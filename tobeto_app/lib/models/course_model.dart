// Modellerimi, HomePage üzerinden CategoryItem ile döndürüp ekran'a yansıtıyorum.
// ignore_for_file: public_member_api_docs, sort_constructors_first
// Modellerimi, HomePage üzerinden CategoryItem ile döndürüp ekran'a yansıtıyorum.

// attığın veri çekttiğin veri int =int
class Course {
  String title;
  String lessonCount;
  int money;
  num rating;
  String imagePath;
  num progress;
  int filterNumber;
  String? description;
  String? instructor;
  String? videoLink;

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
    this.videoLink,
  });

  // verileri gönder.

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

  // verileri al.

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
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
