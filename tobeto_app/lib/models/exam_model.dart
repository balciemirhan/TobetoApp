class Exam {
  String name; // sınavın ismi
  String examClass; // sınavın 2b mi 2c ?
  String examType; // çokatn seçmeli demek
  String content; // içerik Sevgili Adayımız, ile başlayan
  int questionNumber; // soru sayısı
  int time; // sıanıvın zamanı

  Exam({
    required this.name,
    required this.examClass,
    required this.examType,
    required this.content,
    required this.questionNumber,
    required this.time,
  });

  // firesttore veri gönderirken kullanıyoruz.
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

  // firestore 'dan veri çek.
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