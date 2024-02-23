import 'package:flutter/material.dart';
import 'package:tobeto_app/pages/curved/curved_button.dart';
import 'package:tobeto_app/pages/quiz/next_button.dart';
import 'package:tobeto_app/pages/quiz/quiz_page.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.score,
  }) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score: $score/10',
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: CircularProgressIndicator(
                    strokeWidth: 12,
                    value: score / 10,
                    color: Colors.lightGreen,
                    backgroundColor: Colors.white,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '$score/10',
                      style: const TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${(score / 10 * 100).round()}%',
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                NextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const QuizPage()),
                    );
                  },
                  label: 'Tekrar Dene',
                ),
                NextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (_) => const CurvedNavBarWidget()),
                    );
                  },
                  label: 'Çıkış',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
