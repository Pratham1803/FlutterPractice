// Importing necessary Flutter material package
import 'package:flutter/material.dart';

// Importing custom files that contain questions and different screens
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start.dart';
import 'package:quiz_app/answer_screen.dart';

// Define a StatefulWidget called Quiz
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  // Creating the mutable state for the Quiz widget
  @override
  State<Quiz> createState() {
    return _QuizState(); // Returns an instance of the state
  }
}

// State class that handles the logic for the Quiz widget
class _QuizState extends State<Quiz> {
  // List to store selected answers
  List<String> selectedAnswer = [];

  // Variable to keep track of the current screen
  var activeScreen = 'start-screen';

  // Alternative approach: Using a widget instance instead of a string
  // Widget? activeScreen;
  // @override
  // void initState() {
  //   activeScreen = Start(switchScreen);
  //   super.initState();
  // }

  // Function to switch from the Start screen to the Question screen
  void switchScreen() {
    setState(() {
      selectedAnswer = []; // Reset selected answers for a new quiz attempt
      activeScreen = 'question-screen'; // Set active screen to question screen
    });
  }

  // Function to handle answer selection
  void selectAnswer(String answer) {
    selectedAnswer.add(answer); // Add the selected answer to the list

    setState(() {
      // If all questions have been answered, switch to the Answer screen
      if (selectedAnswer.length == questions.length) {
        activeScreen = 'answer-screen';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine which screen to display based on activeScreen value
    Widget screenWidget = Start(switchScreen); // Default screen is Start screen

    // If the activeScreen is 'question-screen', display the QuestionScreen
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(chooseAnswer: selectAnswer);
    }

    // If the activeScreen is 'answer-screen', display the AnswerScreen
    if (activeScreen == 'answer-screen') {
      screenWidget = AnswerScreen(
        lsAnswer: selectedAnswer, // Pass the selected answers to AnswerScreen
        restartQuiz: switchScreen, // Pass the restart function to restart the quiz
      );
    }

    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 13, 151), // Dark purple
              Color.fromARGB(255, 177, 15, 168), // Bright pink
            ],
            begin: Alignment.topCenter, // Gradient starts at the top
            end: Alignment.bottomCenter, // Gradient ends at the bottom
          ),
        ),
        child: screenWidget, // Display the selected screen widget
      ),
    );
  }
}
