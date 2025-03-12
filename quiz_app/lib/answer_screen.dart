// Importing necessary Flutter UI components
import 'package:flutter/material.dart';

// Importing custom text style and question summary widgets
import 'package:quiz_app/style/text_style.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_summary.dart';

// Stateless Widget for displaying the quiz results
class AnswerScreen extends StatelessWidget {
  const AnswerScreen({
    super.key,
    required this.lsAnswer,
    required this.restartQuiz,
  });

  // List of selected answers from the user
  final List<String> lsAnswer;

  // Function to restart the quiz
  final void Function() restartQuiz;

  // Method to generate a summary of the user's answers
  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];

    // Looping through all the user's answers
    for (int i = 0; i < lsAnswer.length; i++) {
      summary.add({
        'index': i, // Question index
        'question': questions[i].question, // The question text
        'correctAnswer': questions[i].answers[0], // The correct answer (first item in list)
        'userAnswer': lsAnswer[i], // The user's selected answer
        'isCorrect': lsAnswer[i] == questions[i].answers[0] // Boolean to check correctness
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var summaryData = getSummary(); // Calling getSummary() to prepare summary data

    // Counting the number of correct answers
    var correctAnswer = summaryData.where((data) => data['isCorrect'] == true).length;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(20), // Adding margin around the container
        child: Column(
          mainAxisSize: MainAxisSize.min, // Column takes minimum space needed
          crossAxisAlignment: CrossAxisAlignment.stretch, // Expands children to full width
          children: [
            // Displaying score summary
            TextStyleClass(
              'You have answered $correctAnswer out of ${summaryData.length} questions correctly',
              textType: 'heading',
            ),
            const SizedBox(height: 30), // Adding spacing

            // Displaying a label for the list of questions and answers
            const TextStyleClass('List of Questions & Answers'),
            const SizedBox(height: 20), // Adding spacing

            // Displaying the question summary list
            QuestionSummary(summaryData),
            const SizedBox(height: 20), // Adding spacing

            // Button to restart the quiz
            TextButton(
              onPressed: restartQuiz, // Calls restartQuiz function when pressed
              child: const TextStyleClass('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
