import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
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
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidget =
    //     activeScreen == 'start-screen' ? Start(switchScreen) : QuestionScreen();

    Widget screenWidget = Start(switchScreen);
    
    if(activeScreen == 'question-screen') {
      screenWidget = const QuestionScreen();      
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
