import 'package:flutter/material.dart';
import 'package:tobeto_app/data/quiz_data.dart';

import 'package:tobeto_app/pages/quiz/answer_card.dart';
import 'package:tobeto_app/pages/quiz/next_button.dart';
import 'package:tobeto_app/pages/quiz/result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;
  bool get isLastQuestion => questionIndex == questions.length - 1;

  void pickAnswer(int value) {
    setState(() {
      selectedAnswerIndex = value;
      final question = questions[questionIndex];

      if (selectedAnswerIndex == question.correctAnswerIndex) {
        score++;
      }
    });
  }

  void goToResultScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ResultPage(score: score)),
    );
  }

  void goToNextQuestion() {
    setState(() {
      if (questionIndex < questions.length - 1) {
        questionIndex++;
        selectedAnswerIndex = null;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultPage(score: score)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              question.question,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: question.answers.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: selectedAnswerIndex == null
                      ? () => pickAnswer(index)
                      : null,
                  child: AnswerCard(
                    currentIndex: index,
                    question: question.answers[index],
                    isSelected: selectedAnswerIndex == index,
                    selectedAnswerIndex: selectedAnswerIndex,
                    correctAnswerIndex: question.correctAnswerIndex,
                  ),
                );
              },
            ),
            isLastQuestion
                ? NextButton(
                    onPressed: selectedAnswerIndex != null || isLastQuestion
                        ? goToNextQuestion
                        : null,
                    label: isLastQuestion ? 'Bitti' : 'Devam',
                  )
                : NextButton(
                    onPressed:
                        selectedAnswerIndex != null ? goToNextQuestion : null,
                    label: 'Devam'),
          ],
        ),
      ),
    );
  }
}
