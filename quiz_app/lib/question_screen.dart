import 'package:flutter/material.dart';
import 'package:quiz_app/style/text_style.dart';
import 'package:quiz_app/style/answer_button.dart';
import 'package:quiz_app/data/question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[1];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,          
          children: [
            TextStyleClass(currentQuestion.question, textType: 'heading'),
            const SizedBox(height: 50),
            ...currentQuestion.answers.map((answer) {
              return AnswerButton(answer, () {});
            }),
          ],
        ),
      ),
    );
  }
}
