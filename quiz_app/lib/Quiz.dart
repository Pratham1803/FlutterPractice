import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start.dart';
import 'package:quiz_app/answer_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  // 1. first way to change the screen by passing screen instance in variable
  // Widget? activeScreen;
  // @override
  // void initState() {
  //   activeScreen = Start(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'question-screen';
    });
  }

  void selectAnswer(String answer) {
    selectedAnswer.add(answer);
    setState(() {
      if (selectedAnswer.length == questions.length) {
        activeScreen = 'answer-screen';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidget =
    //     activeScreen == 'start-screen' ? Start(switchScreen) : QuestionScreen();

    Widget screenWidget = Start(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(chooseAnswer: selectAnswer);
    }

    if (activeScreen == 'answer-screen') {
      screenWidget = AnswerScreen(
        lsAnswer: selectedAnswer,
        restartQuiz: switchScreen,
      );
    }

    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 177, 15, 168),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: screenWidget,
      ),
    );
  }
}
