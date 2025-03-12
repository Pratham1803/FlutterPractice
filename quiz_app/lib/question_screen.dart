// Importing necessary Flutter material package for UI components
import 'package:flutter/material.dart';

// Importing custom text style and button widgets
import 'package:quiz_app/style/text_style.dart';
import 'package:quiz_app/style/answer_button.dart';

// Importing question data
import 'package:quiz_app/data/question.dart';

// Creating a StatefulWidget for managing the question screen
class QuestionScreen extends StatefulWidget {
  // Constructor accepting a callback function to handle selected answers
  const QuestionScreen({super.key, required this.chooseAnswer});

  // Function to handle answer selection
  final void Function(String ans) chooseAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

// Creating the state class for QuestionScreen
class _QuestionScreenState extends State<QuestionScreen> {
  // Variable to track the current question index
  var currentQuestionIndex = 0;

  // Function to handle answer selection and move to the next question
  void answerQuestion(String ans) {
    widget.chooseAnswer(ans); // Calls the parent function with selected answer

    setState(() {
      currentQuestionIndex++; // Moves to the next question
    });
  }

  @override
  Widget build(BuildContext context) {
    // Getting the current question using the index
    var currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(20), // Adds margin around the container
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ensures column takes minimum space
          crossAxisAlignment: CrossAxisAlignment.stretch, // Expands children to fill width
          children: [
            // Displays the question text
            TextStyleClass(currentQuestion.question, textType: 'heading'),
            const SizedBox(height: 50), // Adds spacing between question and answers

            // Mapping through shuffled answer choices and creating answer buttons
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answer,
                () {
                  answerQuestion(answer); // Calls function when an answer is selected
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
