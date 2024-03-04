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
      backgroundColor: const Color.fromARGB(255, 164, 117, 247),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Sınava Başla",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: const Color.fromARGB(255, 250, 196, 196),
                shadows: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const QuizPage(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text(
                "Devam",
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shadowColor: Colors.black.withOpacity(0.3),
                elevation: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
