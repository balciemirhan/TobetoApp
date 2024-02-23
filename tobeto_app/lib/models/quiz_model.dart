class Quiz {
  final String question;
  final List<String> answers;
  final int correctAnswerIndex;

  Quiz({
    required this.question,
    required this.answers,
    required this.correctAnswerIndex,
  });

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answers': answers,
      'correctAnswerIndex': correctAnswerIndex,
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      question: map['question'],
      answers: List<String>.from(map['answers']),
      correctAnswerIndex: map['correctAnswerIndex'],
    );
  }
}
