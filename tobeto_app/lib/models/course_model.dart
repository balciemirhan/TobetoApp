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
  List<Video> videoList;
  DateTime startDate;
  DateTime endDate;
  Duration spentTime;
  Duration estimatedTime;
  int videoCount;

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
    required this.videoList,
    required this.startDate,
    required this.endDate,
    required this.spentTime,
    required this.estimatedTime,
    required this.videoCount,
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
      'videoList': videoList.map((x) => x.toMap()).toList(),
      'instructor': instructor,
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
      'spentTime': spentTime.inMilliseconds,
      'estimatedTime': estimatedTime.inMilliseconds,
      'videoCount': videoCount
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
      videoList:
          List<Video>.from(map['videoList']?.map((x) => Video.fromMap(x))),
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate']),
      endDate: DateTime.fromMillisecondsSinceEpoch(map['endDate']),
      spentTime: Duration(milliseconds: map['spentTime']),
      estimatedTime: Duration(milliseconds: map['estimatedTime']),
      videoCount: map['videoCount']?.toInt() ?? 0,
    );
  }
}

class Video {
  int id;
  String videoTitle;
  String link;
  Duration duration;

  Video({
    required this.id,
    required this.videoTitle,
    required this.link,
    required this.duration,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'videoTitle': videoTitle,
      'link': link,
      'duration': duration
          .inMilliseconds, // Duration'u inMilliseconds ile tamsayıya dönüştürüyoruz
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      id: map['id'] ?? 0,
      videoTitle: map['videoTitle'] ?? '',
      link: map['link'] ?? '',
      duration: Duration(
          milliseconds: map['duration'] ??
              0), // Duration'u inMilliseconds ile tamsayıdan oluşturuyoruz
    );
  }
}
