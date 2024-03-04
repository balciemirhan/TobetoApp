class Exam {
  String name;
  String examClass;
  String examType;
  String content;
  int questionNumber;
  int time;

  Exam({
    required this.name,
    required this.examClass,
    required this.examType,
    required this.content,
    required this.questionNumber,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'examClass': examClass,
      'examType': examType,
      'content': content,
      'questionNumber': questionNumber,
      'time': time,
    };
  }

  factory Exam.fromMap(Map<String, dynamic> map) {
    return Exam(
      name: map['name'] ?? "",
      examClass: map['examClass'] ?? "",
      examType: map['examType'] ?? "",
      content: map['content'] ?? "",
      questionNumber: map['questionNumber'] ?? 0,
      time: map['time'] ?? 0,
    );
  }
}
