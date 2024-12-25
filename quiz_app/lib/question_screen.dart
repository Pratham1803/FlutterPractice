import 'package:flutter/material.dart';
import 'package:quiz_app/style/text_style.dart';
import 'package:quiz_app/style/answer_button.dart';
import 'package:quiz_app/data/question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key,required this.chooseAnswer});

  final void Function(String ans) chooseAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String ans) {
    widget.chooseAnswer(ans);
    setState(() {    
        currentQuestionIndex++;      
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextStyleClass(currentQuestion.question, textType: 'heading'),
            const SizedBox(height: 50),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answer, (){
                answerQuestion(answer);
              });
            }),
          ],
        ),
      ),
    );
  }
}
