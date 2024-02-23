import 'package:flutter/material.dart';
import 'package:tobeto_app/pages/quiz/quiz_page.dart';

class QuizStartPage extends StatefulWidget {
  const QuizStartPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuizStartPageState();
}

class _QuizStartPageState extends State<QuizStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*  Image.asset(
              "assets/quiz-logo.png",
              width: 300,
            ), */
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Sınava Başla",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 50,
            ),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const QuizPage(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text("Devam", style: TextStyle(fontSize: 20)),
              style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 235, 66, 165),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.fromLTRB(50, 15, 60, 15)),
            )
          ],
        ),
      ),
    );
  }
}
