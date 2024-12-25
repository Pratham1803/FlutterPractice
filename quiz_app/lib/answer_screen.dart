import 'package:flutter/material.dart';
import 'package:quiz_app/style/text_style.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_summary.dart';

class AnswerScreen extends StatelessWidget {
  const AnswerScreen({super.key, required this.lsAnswer});

  final List<String> lsAnswer;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < lsAnswer.length; i++) {
      summary.add({
        'index': i,
        'question': questions[i].question,
        'correctAnswer': questions[i].answers[0],
        'userAnswer': lsAnswer[i],
        'isCorrect': lsAnswer[i] == questions[i].answers[0]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var summaryData = getSummary();
    // var correctAnswer = summaryData.where((data) {
    //   return data['isCorrect'] == true;
    // }).length;
    var correctAnswer = summaryData.where((data) => data['isCorrect'] == true).length;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextStyleClass(
              'You have Answered  $correctAnswer Out of ${summaryData.length} questions correctly',
              textType: 'heading',
            ),
            const SizedBox(height: 30),
            const TextStyleClass(
              'List of Questions & Answers',
            ),
            const SizedBox(height: 20),
            QuestionSummary(getSummary()),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const TextStyleClass('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
