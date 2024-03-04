import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    Key? key,
    required this.question,
    required this.isSelected,
    this.correctAnswerIndex,
    this.selectedAnswerIndex,
    required this.currentIndex,
  }) : super(key: key);

  final String question;
  final bool isSelected;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = correctAnswerIndex == currentIndex && isSelected;
    bool isWrongAnswer =
        selectedAnswerIndex != correctAnswerIndex && isSelected;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: selectedAnswerIndex != null
          ? Container(
              height: 70,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: isCorrectAnswer
                    ? Colors.green
                    : isWrongAnswer
                        ? const Color.fromARGB(255, 255, 30, 14)
                        : const Color.fromARGB(99, 255, 255, 255),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        question,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              height: 70,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(99, 255, 255, 255),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      question,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 22, 15, 15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  isCorrectAnswer
                      ? buildCorrectIcon()
                      : isWrongAnswer
                          ? buildWrongIcon()
                          : const SizedBox.shrink(),
                ],
              ),
            ),
    );
  }

  Widget buildCorrectIcon() => const CircleAvatar(
        radius: 15,
        backgroundColor: Colors.green,
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      );

  Widget buildWrongIcon() => const CircleAvatar(
        radius: 15,
        backgroundColor: Colors.red,
        child: Icon(
          Icons.close,
          color: Colors.white,
        ),
      );
}
